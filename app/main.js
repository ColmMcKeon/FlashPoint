const { app, BrowserWindow, ipcMain, dialog } = require('electron');
const path = require('path');
const fs   = require('fs');
const os   = require('os');

const DATA_DIR  = path.join(os.homedir(), 'Documents', 'FlashPoint');
const DATA_FILE = path.join(DATA_DIR, 'flashpoint.json');

let mainWindow   = null;
let isDirty      = false;
let isSavingQuit = false; // true while renderer is handling save-and-quit

function createWindow() {
  mainWindow = new BrowserWindow({
    width:  1250,
    height: 778,
    minWidth:  800,
    minHeight: 600,
    title: 'FlashPoint',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false,
    },
  });

  mainWindow.loadFile('flashpoint.html');
  mainWindow.setMenuBarVisibility(false);

  mainWindow.on('close', e => {
    if (!isDirty || isSavingQuit) return;

    e.preventDefault();

    const response = dialog.showMessageBoxSync(mainWindow, {
      type: 'warning',
      buttons: ['Save', "Don't Save", 'Cancel'],
      defaultId: 0,
      cancelId: 2,
      message: 'You have unsaved changes',
      detail: 'Do you want to save your presentation before closing?',
    });

    if (response === 0) {
      isSavingQuit = true;
      mainWindow.webContents.send('save-and-quit');
    } else if (response === 1) {
      isDirty = false;
      mainWindow.destroy();
    }
  });
}

app.whenReady().then(() => {
  createWindow();
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => app.quit());

ipcMain.on('set-dirty', (e, dirty) => { isDirty = dirty; });
ipcMain.on('save-complete', () => { isSavingQuit = false; app.quit(); });

// ── File I/O ──
ipcMain.handle('load-data', () => null);

// Open a presentation via native file picker
ipcMain.handle('open-preso-dialog', async () => {
  // Default to the folder containing the .app bundle (or __dirname in dev)
  const appFolder = app.isPackaged
    ? path.join(path.dirname(process.execPath), '../../..')
    : __dirname;
  const result = await dialog.showOpenDialog(mainWindow, {
    title: 'Open Presentation',
    defaultPath: currentSavePath ? path.dirname(currentSavePath) : appFolder,
    properties: ['openFile'],
    filters: [{ name: 'FlashPoint Presentation', extensions: ['fpx','json'] }],
  });
  if (result.canceled || !result.filePaths.length) return null;
  try {
    currentSavePath = result.filePaths[0];
    const data = JSON.parse(fs.readFileSync(currentSavePath, 'utf8'));
    data._path = currentSavePath;
    return data;
  } catch { return null; }
});

// Clear the current save path (for new presentations)
ipcMain.handle('new-presentation', () => { currentSavePath = null; return true; });

// Delete a presentation file
ipcMain.handle('delete-presentation', (e, filePath) => {
  try { fs.unlinkSync(filePath); return true; } catch { return false; }
});

// List all .fpx files in the data directory
ipcMain.handle('list-presentations', () => {
  try {
    if (!fs.existsSync(DATA_DIR)) return [];
    return fs.readdirSync(DATA_DIR)
      .filter(f => f.endsWith('.fpx') || f.endsWith('.json'))
      .map(f => {
        const full = path.join(DATA_DIR, f);
        const stat = fs.statSync(full);
        return { name: f.replace(/\.(fpx|json)$/i, ''), path: full, mtime: stat.mtimeMs };
      })
      .sort((a, b) => b.mtime - a.mtime);
  } catch { return []; }
});

// Open a presentation directly by path (for recent files)
ipcMain.handle('open-file-by-path', async (e, filePath) => {
  try {
    currentSavePath = filePath;
    const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
    data._path = filePath;
    return data;
  } catch { return null; }
});

let currentSavePath = null;

ipcMain.handle('save-data', async (e, data) => {
  try {
    if (!currentSavePath) {
      if (!fs.existsSync(DATA_DIR)) fs.mkdirSync(DATA_DIR, { recursive: true });
      currentSavePath = path.join(DATA_DIR, (data.title || 'Untitled') + '.fpx');
    }
    fs.writeFileSync(currentSavePath, JSON.stringify(data, null, 2), 'utf8');
    return currentSavePath;
  } catch (e) { return null; }
});

// Read a local file as base64 data URL (for native file picker)
ipcMain.handle('read-file-as-dataurl', async (e, filePath) => {
  try {
    const buf = fs.readFileSync(filePath);
    const ext = path.extname(filePath).slice(1).toLowerCase();
    const mime =
      ['jpg','jpeg'].includes(ext) ? 'image/jpeg' :
      ext === 'png'  ? 'image/png'  :
      ext === 'gif'  ? 'image/gif'  :
      ext === 'webp' ? 'image/webp' :
      ext === 'svg'  ? 'image/svg+xml' :
      ext === 'mp4'  ? 'video/mp4'  :
      ext === 'mov'  ? 'video/mp4' :
      ext === 'webm' ? 'video/webm' :
      ext === 'mp3'  ? 'audio/mpeg' :
      ext === 'wav'  ? 'audio/wav'  :
      ext === 'ogg'  ? 'audio/ogg'  :
      ext === 'm4a'  ? 'audio/mp4'  :
      ext === 'flac' ? 'audio/flac' :
      ext === 'aac'  ? 'audio/aac'  :
      'application/octet-stream';
    return `data:${mime};base64,${buf.toString('base64')}`;
  } catch { return null; }
});

// Open native file picker for media
ipcMain.handle('open-media-dialog', async (e, mediaType) => {
  let filters = [];
  if (mediaType === 'image') filters = [{ name: 'Images', extensions: ['png','jpg','jpeg','gif','webp','svg'] }];
  else if (mediaType === 'video') filters = [{ name: 'Video', extensions: ['mp4','mov','webm','avi','m4v'] }];
  else if (mediaType === 'audio') filters = [{ name: 'Audio', extensions: ['mp3','wav','ogg','m4a','flac','aac'] }];
  else filters = [{ name: 'Media', extensions: ['png','jpg','jpeg','gif','webp','mp4','mov','webm','mp3','wav','ogg','m4a','flac'] }];

  const result = await dialog.showOpenDialog(mainWindow, {
    properties: ['openFile', 'multiSelections'],
    filters,
  });
  return result.canceled ? [] : result.filePaths;
});
