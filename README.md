# FlashPoint

A desktop presentation builder for macOS, inspired by the original Adobe Flash authoring tool (2004).

Built with Electron. No subscription, no cloud, no browser — just open it and make something.

---

## Features

- **Slides** — add, duplicate, reorder, delete slides with per-slide backgrounds
- **Objects** — text, images, video, audio, and draw objects on a freeform canvas
- **Draw tools** — freehand lines, shapes (circle, rectangle), arrows, with stroke and fill
- **Motion** — per-object animation with start/end position locking and speed control
- **Play mode** — full-screen presentation playback with fade transitions and auto-advance
- **Music** — background audio track with loop support
- **Grid** — 10px/50px grid with rule-of-thirds viewfinder overlay
- **Undo/Redo** — full history stack
- **File format** — saves as `.fpx` (JSON), open and portable

---

## Installation (macOS)

1. Download `FlashPoint-v1.0-mac-arm64.zip` from [Releases](../../releases)
2. Unzip and move `FlashPoint.app` to your Applications folder
3. **First launch:** right-click → Open (required to bypass Gatekeeper on unsigned apps)

> Requires Apple Silicon (M1/M2/M3). macOS 12 Monterey or later recommended.

---

## Building from source

```bash
cd app
npm install
npm start          # run in dev mode
npm run build      # build FlashPoint.app
```

Requires Node.js 18+ and npm.

---

## Background

Flash was killed by Adobe in 2020. Nothing that came after it captured the same hands-on, object-on-stage, multimedia authoring feel. This app is a personal attempt to preserve that workflow — the same model of placing objects, adding motion, layering audio, and hitting play.

---

## Author

Colm McKeon — [github.com/ColmMcKeon](https://github.com/ColmMcKeon)
