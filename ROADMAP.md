# Art Portfolio Site — Roadmap

An art-first gallery for original work. The gallery is user-focused — art front and center, gold aesthetic, no resume content on the page. Auth/SIEM layers are added as IAM portfolio signals under the hood, not as page content.

**Stack:** Static HTML/CSS/JS · `artworks.json` · Vercel
**Data:** Artwork metadata lives in `artworks.json` — no database, no Docker, no server dependency.

---

## Phase 1 — Content & Layout ✅ Complete

Gallery is built and shipped. Art front and center.

### Done
- [x] Masonry gallery layout
- [x] Index page — Z-pattern photo layout, updated copy and voice
- [x] About page restructured — art and interests focused
- [x] Projects page rewritten
- [x] Mobile nav overhaul
- [x] Artworks 059–064 added, images in `public/images/`
- [x] Favicon added (003.jpg — MushroomGuy)
- [x] Git init, committed + pushed to GitHub

---

## Phase 1.5 — JSON Migration + Visual Direction (Current)

Strip out the database and server dependency. Make it art-first.

### Todo
- [ ] Create `artworks.json` — migrate all artwork metadata out of Postgres
- [ ] Replace `fetch('/artworks')` API call with local JSON import
- [ ] Remove Docker, Express backend, Python API layer
- [ ] Remove work experience / resume content from gallery pages — art only
- [ ] Apply gold aesthetic — typography, color, layout pass
- [ ] Test on mobile — full layout pass after style changes
- [ ] Deploy to Vercel (free static hosting)

---

## Phase 2 — Auth & Security

The gallery is currently wide open — anyone can add, edit, or delete artwork.
This phase locks it down and turns the site into a live IAM demo.

- [ ] Add login/auth layer to gallery admin routes (add, edit, delete)
- [ ] Implement OAuth 2.0 — hook into Azure Entra ID or OKTA for SSO
- [ ] Public users can view gallery, only authenticated admin can modify
- [ ] HTTPS enforced
- [ ] Input validation and sanitization on all gallery endpoints
- [ ] Rate limiting on auth routes

**Why this matters:** Direct practice for IAM roles. Azure Entra ID / OKTA integration on a real project you own.

---

## Phase 3 — SIEM & Observability

Turn the site into a live security monitoring demo.

- [ ] Log auth events (logins, failures, token issues)
- [ ] Log suspicious requests (repeated failures, unexpected routes)
- [ ] Pipe logs into a SIEM — Wazuh, Elastic, or Splunk Free
- [ ] Build a simple dashboard showing auth activity
- [ ] Document the setup as a project entry on the site itself

**Why this matters:** Most helpdesk-to-security candidates can't show a live SIEM. This is the differentiator.

---

## Phase 4 — Cloud Deploy

Get it off localhost and onto the internet properly.

- [ ] Finalize Docker Compose setup (app + any supporting services)
- [ ] Choose cloud host — Azure (preferred, matches career path), Fly.io, or VPS
- [ ] Set up CI/CD pipeline (GitHub Actions)
- [ ] Domain + HTTPS (Let's Encrypt)
- [ ] Environment variable management for secrets
- [ ] Monitor uptime

---

## Stack

| Layer | Tech |
|---|---|
| Frontend | HTML, CSS (vanilla), JS |
| Data | `artworks.json` — static, no DB |
| Hosting | Vercel (free, static) |
| Auth (Phase 2) | OAuth 2.0, Azure Entra ID / OKTA |
| SIEM (Phase 3) | Wazuh / Elastic |
| CI/CD (Phase 4) | GitHub Actions |
