# Keerthana — Portfolio (Flutter Web)

A single-page personal portfolio built with Flutter Web. Dark "developer"
theme, responsive (desktop / tablet / mobile), with smooth scroll navigation.

Sections: **Hero · About · Skills · Work · Experience · Contact**

## Run locally

```bash
cd portfolio
flutter pub get
flutter run -d chrome      # opens in Chrome with hot reload
```

## Edit your content

Almost everything you'll want to change lives in **one file**:

```
lib/data/portfolio_data.dart
```

- `Profile` — name, tagline, summary, **email / GitHub / LinkedIn / resume link**
- `About` — paragraphs + highlight bullets
- `skillGroups` — skill categories and chips
- `projects` — project cards (add a `link:` to make a card clickable)
- `experience` — experience tiles

Colors/fonts live in `lib/theme/app_theme.dart`.

### TODO before publishing
- Add your **LinkedIn** URL (`Profile.linkedIn`)
- Add a public **resume PDF** link (`Profile.resumeUrl`) — e.g. a Google Drive
  share link set to "anyone with the link"
- (Optional) Replace the "K" monogram avatar in `about_section.dart` with a real
  photo: drop the image in `assets/`, register it in `pubspec.yaml`, and use
  `Image.asset(...)`.

## Build & deploy

```bash
flutter build web --release      # output in build/web/
```

### Option A — GitHub Pages (free)
1. Build with the repo name as base href:
   `flutter build web --release --base-href /portfolio/`
2. Push the contents of `build/web/` to a `gh-pages` branch (or use a
   GitHub Action). Site goes live at `https://keerthana-GS1.github.io/portfolio/`.

### Option B — Firebase Hosting (free, custom domain support)
```bash
npm i -g firebase-tools
firebase login
firebase init hosting      # set public dir to: build/web
flutter build web --release
firebase deploy
```

### Option C — Netlify / Vercel
Drag-and-drop the `build/web` folder, or connect the repo with build command
`flutter build web --release` and publish directory `build/web`.

---
Contact: keerthana.dev1104@gmail.com
