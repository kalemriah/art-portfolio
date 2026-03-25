# art-portfolio-website

Art-first gallery site. Static HTML pages served from a JSON data source — no database, no Docker. The gallery is for the art. Auth/SIEM/cloud layers are added on top as IAM portfolio signals, not as resume content on the page.

**Stack:** Vanilla HTML/CSS/JS · `artworks.json` · Vercel (static deploy)
**Images:** `public/images/` — 58+ pieces
**Aesthetic goal:** Gold — clean, minimal, art front and center

---

## Phases

- [x] Phase 1 — Scaffold, images loaded, content + layout (masonry gallery, mobile nav, pages)
- [x] Phase 1.5 — Migrate from Postgres/Docker to `artworks.json` + Vercel static deploy
- [ ] Phase 2 — OAuth/auth layer (IAM portfolio signal — admin-only edit routes)
- [ ] Phase 3 — SIEM integration (auth event logging, security dashboard)
- [ ] Phase 4 — Cloud deploy (Vercel + CI/CD)
