# Intake Questionnaires

> Condensed verbatim from `~/blueprints/heart.md` §1.4 (Project Intake) and §8.2 (Design Intake).
> Ask ALL questions before starting Phase 0. The user answers once; these shape every doc that follows.

## 1) Project Intake Questionnaire (heart.md 1.4)

1. PROJECT IDENTITY
   - Name of the product/project? One-sentence description?
   - Target audience (B2B, B2C, Internal, Enterprise)? Industry/domain (FinTech, HealthTech, EdTech, MarTech...)?

2. CORE FEATURES
   - Top 5-10 core features (MVP scope). Must-have vs nice-to-have?
   - Real-time capabilities needed? (chat, notifications, live updates)
   - Background processing needed? (email, report generation, data processing)

3. USER & ACCESS MODEL
   - User roles (Admin, Member, Viewer, Super Admin)?
   - Multi-tenant? (multiple organizations) Team/workspace functionality?
   - Authentication methods (Email/password, Google OAuth, SSO, Magic Link)?

4. INTEGRATIONS
   - Third-party APIs? Need to PROVIDE a public API?
   - Payment gateway (Stripe, Razorpay, Lemonsqueezy)? Email (Resend, SendGrid, SES)? File storage (R2, S3)?

5. AI FEATURES (if applicable)
   - Uses AI/LLM? AI-native? Agentic workflows (multi-step reasoning, tool calling)?
   - LLM providers (OpenAI, Anthropic, Google, local/Ollama)? Capabilities (chat, content gen, embeddings/RAG, image gen)?
   - Vector search / embeddings storage (PGVector, Pinecone)? Vercel AI SDK, LangChain/LangGraph, or both?

6. TECH STACK PREFERENCES
   - Backend: TypeScript/Node.js, Python/FastAPI, or "no preference — you recommend"?
   - Runtime: Node (stability) or Bun (speed)?
   - Recommend Stack Path A/B/C (see `references/stack.md`):
     - A: TypeScript Full-Stack — standard SaaS
     - B: Python + FastAPI — AI-native / agentic
     - C: Hybrid (Next.js + FastAPI) — SaaS with significant AI

7. SCALE & PERFORMANCE
   - Users at launch? In 12 months? Performance requirements (response time, concurrency)?
   - Data residency (EU, US, India)?

8. BUSINESS MODEL
   - Free tier / freemium / paid? Plan structure (Basic, Pro, Enterprise)? Usage-based billing?

9. EXISTING ASSETS
   - Existing code/repo? Brand guidelines (colors, fonts, logo)? Domain? Database/data to migrate?

10. DEPLOYMENT PREFERENCES
    - Hosting (Vercel, Railway, AWS, Docker/self-host)? Infra budget? Custom domain + SSL?

11. BRAND & POSITIONING
    - Existing brand guidelines? If not: 3 personality adjectives.
    - Top 3 competitors (for positioning + battle cards). Unfair advantage (1-2 sentences)?
    - Tone profile: 🏢 Enterprise Authoritative (Salesforce) · 🤝 Friendly & Educational (HubSpot) · ⚡ Modern & Minimal (Linear, Vercel) · 🔬 Technical & Developer-first (ClickHouse) · 🚀 Bold & Disruptive (startup) · or "recommend based on audience".
    - Raising funding? (→ investor deck in Phase 0) Tagline ideas or generate 3-5?

12. TIMELINE
    - Target launch date? Hard deadlines (demo day, investor meeting, client commitment)?

## 2) Design Intake Questionnaire (heart.md 8.2)

1. AESTHETIC DIRECTION
   - a) Clean & Minimal (Linear, Vercel, Stripe) — whitespace, sharp type, subtle depth
   - b) Bold & Expressive (Spotify, Figma) — strong colors, playful, personality
   - c) Premium & Editorial (Apple, Notion, Arc) — refined, luxury-grade polish
   - d) Warm & Human (Mailchimp, Slack) — friendly, rounded
   - e) Dark & Technical (GitHub, Warp, Raycast) — dev-focused, dark-first, monospace accents
   - f) Other — describe vision / reference URLs

2. BRAND COLORS — existing hex codes? Emotions to evoke (Trust, Energy, Calm, Innovation, Luxury, Playfulness, Authority)? BANNED colors (default: purple/violet AI gradients always banned)?

3. INDUSTRY REFERENCES — 3-5 products whose design you admire; what specifically about each?

4. COMPONENT LIBRARY STRATEGY — a) shadcn/ui + Radix + heavy custom visual layer (Recommended) · b) Fully custom from scratch (slowest, most distinctive) · c) other?

5. ILLUSTRATION & IMAGERY — photography / abstract illustrations / hand-drawn / 3D / icon-based / mixed?

6. ICON STYLE — Lucide (Recommended) / Phosphor / Heroicons / custom?

7. LOGO — existing file? Or text-based logomark for now?

8. TONE OF VOICE (UI copy) — Professional & Authoritative ("Your dashboard is ready") · Friendly ("Hey! Your dashboard is all set") · Minimal & Direct ("Dashboard") · Technical ("Dashboard loaded (12 widgets active)")?