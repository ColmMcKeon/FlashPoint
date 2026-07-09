const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('electronAPI', {
  loadData:          ()         => ipcRenderer.invoke('load-data'),
  saveData:          (data)     => ipcRenderer.invoke('save-data', data),
  setDirty:          (dirty)    => ipcRenderer.send('set-dirty', dirty),
  saveComplete:      ()         => ipcRenderer.send('save-complete'),
  onSaveAndQuit:     (cb)       => ipcRenderer.on('save-and-quit', cb),
  openPresoDialog:   ()         => ipcRenderer.invoke('open-preso-dialog'),
  openFileByPath:    (filePath) => ipcRenderer.invoke('open-file-by-path', filePath),
  listPresentations:    ()           => ipcRenderer.invoke('list-presentations'),
  deletePresentation:   (filePath)   => ipcRenderer.invoke('delete-presentation', filePath),
  newPresentation:      ()           => ipcRenderer.invoke('new-presentation'),
  openMediaDialog:   (type)     => ipcRenderer.invoke('open-media-dialog', type),
  readFileAsDataUrl: (filePath) => ipcRenderer.invoke('read-file-as-dataurl', filePath),
});
