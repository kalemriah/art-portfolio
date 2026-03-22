# Changelog

---

## 2026-03-21 — Phase 1 Polish (full session)

### Infrastructure
- Got Docker Compose + WSL2 running cleanly (Node :8084, FastAPI :8000, PostgreSQL)
- Seeded database via `init.sql` with 58 artworks
- Added artworks 059–064 via FastAPI POST endpoints
- Copied new artwork images to `public/images/`

### Gallery
- Masonry layout — CSS `columns: 3 280px` with `break-inside: avoid`
- Featured artwork ordering — custom JS sort using `featuredOrder` array, unfeatured fall through by ID ascending
- Favicon set to `003.jpg` (MushroomGuy) across all pages

### Index Page (`index.html`)
- Replaced placeholder images with real photos: `hello.jpg`, `whatimuptо.jpg`
- Z-pattern button alignment (right / left / right) via `section:nth-of-type(2)` CSS
- `object-fit: cover` + per-image `object-position` for correct crops
- Buttons larger, bold, uppercase
- Copy rewritten to match natural voice

### About Page (`about.html`)
- Full restructure — person first, IT second
- Added sections: Art, Interests, What I'm Building
- Fixed Systems Administration tools field (was blank)
- Work experience: all 5 jobs with real bullets
  - Nordstrom Ebar (Dec 2025–Present)
  - TX HHSC Consolidated Help Desk (Jan 2024–Apr 2025)
  - FreddoATX (Feb 2023–Jan 2024)
  - Medici Café (Feb 2022–Sept 2022)
  - Chick-fil-A (Aug 2021–Feb 2022)
- Fixed inaccurate "2 years IT experience" → "about a year" throughout

### Projects Page (`projects.html`)
- Reorganized into main section and Misc section
- Main: Portfolio Website, AD Lab, Jira Lab, Google Cert Exercises
- Misc: YT to Vault, SSH on 3DS, Wheatly, BMO Skater, YT Downloader
- All copy rewritten to sound natural

### Mobile
- Navbar fixed — compact single row, 58px buttons, smaller font, no wrapping

### Docs
- `ROADMAP.md` updated — all completed items ticked, accurate notes
- `Resume Portfolio.md` — Nordstrom Ebar added as current job
- `CHANGELOG.md` created (this file)

---

## Phase 1 — Remaining Open Items

- [ ] 3DS SSH GitHub writeup + update placeholder link
- [ ] Consider linking Google Cert files/PDF
- [ ] Mobile layout — full pass still recommended on real device

---

## Upcoming

- **Phase 2** — OAuth/SAML auth, Azure Entra ID / OKTA SSO, lock down gallery admin routes
- **Phase 3** — SIEM integration, auth event logging
- **Phase 4** — Cloud deploy (Azure), CI/CD, domain + HTTPS
