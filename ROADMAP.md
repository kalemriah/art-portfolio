# Portfolio Site — Roadmap

A personal portfolio and art gallery built with Node.js, Express, and Docker.
This document tracks what's been done, what's in progress, and where the project is heading.

---

## Phase 1 — Polish & Content (Current)

Get the site looking solid and all content accurate before touching security or deployment.

### Done
- [x] Overhauled projects.html — replaced weak entries with real projects
- [x] h1 tags consistent across all pages (outside section-card, after nav)
- [x] card1 h1 centered via CSS
- [x] Removed empty About sections (My Interests, My Background) from TOC
- [x] Fixed stale id="react-native-app" on contact page
- [x] Wheatly description rewritten to reflect hardware limitations and GPU research
- [x] Google Cybersecurity cert exercises added as a grouped project entry

### Todo
- [ ] Finish 3DS SSH GitHub writeup, update the placeholder link
- [x] Fill in About page content — Interests, Art, and What I'm Building sections
- [x] Fix empty Tools field in Skills table (Systems Administration)
- [x] Verify TxHHSC end date — confirmed Apr 2025
- [ ] Test on mobile — nav wraps but full layout needs checking
- [x] Add a favicon (003.jpg — MushroomGuy)
- [x] Swap placeholder techsupport.png images on index cards — hello.jpg (self) and whatimuptо.jpg (skating)
- [x] Index cards redesigned — masonry layout, Z-pattern button alignment, object-fit cover, updated copy and voice
- [x] Work experience updated — Nordstrom Ebar added (Dec 2025–Present), all 5 jobs with real bullets
- [x] Experience claim fixed — "2 years" corrected to "over a year" / "about a year" across site
- [x] New artworks added (059–064), images in public/images/
- [ ] Consider linking Google Cert .txt files or a PDF so people can read the actual work

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
| Backend | Node.js, Express |
| Frontend | HTML, CSS (vanilla) |
| Container | Docker |
| Auth (Phase 2) | OAuth 2.0, Azure Entra ID / OKTA |
| SIEM (Phase 3) | Wazuh / Elastic |
| Deploy (Phase 4) | Azure / GitHub Actions |
