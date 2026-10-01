# Trillion-inspired Personal AI Co-Founder — Research & Product Blueprint

**Prepared:** 29 September 2026  
**Purpose:** Research and product direction only. This is not an implementation plan approval or a claim that the local packaged apps have been fully reverse-engineered.

## Product in one sentence

A voice-first, desktop-native AI co-founder that can observe selected business and computer signals, answer with evidence, coordinate specialist agents, perform useful work through replaceable skills and connectors, and earn narrowly scoped autonomy from verified outcomes—while keeping its core easy for its owner to extend.

## What was inspected

- **Glass AI:** Read its README, architecture and learning policies, orchestration prompt, agent and plugin code, capability registry, and inventories of actions, skills, agents, memory, voice, and dashboard modules. It has extensive Python source and a bespoke animated HUD. The local project documents web research, browser and desktop control, screen context, memory, scheduled tasks, agent delegation, skills, API configuration, and user-confirmed consequential actions. Its plugin and capability registries are metadata/folder driven; agent discovery scans recursively.
- **Brahma Echo:** Inspected packaged directory inventory, integration/migration manifests, readable runtime modules, and its substantial `agent1` runtime. This includes MCP servers and custom connectors, computer-use dispatch, specialist dispatch/swarm execution, typed task contracts, budgets, scheduler, evidence receipts, observability, and tool bridges for apps, web, memory, files, office, and Windows. The executable and many binary assets are not source-readable; claims here are limited to components actually visible on disk.
- **Jarvis (installed app):** The install directory contains a 246 MB Electron executable and a 291 MB `app.asar`; the unpacked resources were largely native dependencies, not application source. Its window was not available for UI inspection in this session. Therefore its product capabilities remain **unverified**, and this blueprint does not invent them. The app's persisted user data and credentials were not inspected.
- **Trillion:** Read the public home page, FAQ, roadmap, and published prompts. The site describes a voice-first AI co-founder with live business intelligence across revenue, code, customers, data, communications, and competitive intelligence; a team of specialist agents; concise, candid personality; a Python async harness, streaming speech components, Postgres state, FastAPI/WebSockets, browser research, and an eventual desktop shell. It also describes 18 built capabilities on its roadmap, including a fast voice loop, natural turn-taking, durable memory, stable personality, self-knowledge, orchestration, and an agent factory.
- **External patterns:** Checked first-party Home Assistant Assist pipeline docs and current open-source Jarvis/Open Interpreter search results. These reinforce the value of explicit modular voice stages and computer-use boundaries. The Trillion roadmap/prompt material was especially relevant to editable doctrine, scoped approvals, evidence-led trust, and safe orchestration.

## Strengths to carry forward

| Source | Product strengths to preserve |
|---|---|
| Glass AI | A lively desktop presence; voice and screen context; concrete desktop/browser/file actions; broad specialist library; skills and plugin discovery; memory and scheduled tasks; user-visible confirmations; live customization and personal context. |
| Brahma Echo | Treat integrations as first-class connectors; MCP compatibility; task contracts with expected output and verification; bounded parallel delegation; budgets and timeouts; action receipts and observability; explicit result/evidence/error structure; rich app, web, computer, and file tool bridges. |
| Installed Jarvis | Unknown pending source or live UI review. Keep a discovery checklist for its visible workflows, voice, skills, integrations, settings, and trust controls before claiming or porting features. |
| Trillion | Voice as the natural front door; business-wide signal monitoring; action-oriented specialist team; short, frank answers; always-on-but-selective intelligence; agent creation; human gates; editable, self-hostable product direction. |

This is a capability extraction and synthesis, not a claim that the systems have identical capabilities or that every feature is production-ready. Preserve the original projects and treat them as references; implement clean interfaces in the new project rather than copying code wholesale until licenses, dependencies, and security have been checked.

## Proposed user experience

### Main screen: the Command Deck

- Full-screen, deep-space visual identity: a responsive voice-reactive orb/face in the center, inspired by Trillion's cosmic assistant direction and Glass AI's animated HUD. It subtly breathes while idle, brightens while listening, shifts into a focused “thinking” state, and reacts while speaking. Motion is restrained and can be reduced or disabled.
- A compact status strip shows **Listening / Ready / Working / Needs you**, enabled signal sources, last sync time, and whether the assistant is online. No implied “24/7” monitoring unless a source is connected and its monitor is actually running.
- A concise conversation transcript and universal command field sit at the bottom. Push-to-talk is the default; wake word is an explicit opt-in with a visible mic state. Text remains a first-class alternative.
- Specialist agents appear as a small orbit/crew strip. Selecting one opens its scope, tools, instructions, recent work, and authority level. During a job, the relevant agent lights up and shows a plain status and evidence/artifacts.
- Right-side “Signal Board” cards summarize only configured sources: Revenue, Code, Customers, Data, Comms, and Intel. Each card reports source, freshness, health, and notable changes. A disconnected source is shown as disconnected, never inferred.
- A single **Needs You** inbox presents approval requests, failed tasks, agent questions, and important alerts. Each approval identifies the proposed action, target, data affected, cost (if any), reversibility, and evidence. Approve, reject, or edit are explicit.

### Other workspaces

- **Crew:** create, configure, test, version, enable, pause, and inspect specialist agents.
- **Skills & Integrations:** install skills, connect MCP servers, configure API providers and OAuth, set scopes, test health, and see exactly which agent can use each capability.
- **Routines:** schedule recurring briefs and jobs, edit their prompt and schedule, see run history, and pause them. Local-only schedules disclose that the app/device must be running.
- **Memory:** inspect durable facts with source, confidence, date, scope, expiry/freshness, and delete/edit controls; distinguish conversation history from remembered facts.
- **Activity & Evidence:** searchable run timeline with plans, tool calls, receipts, citations, cost, model, agent, approvals, and final verification. Secrets and unnecessary personal content are redacted.
- **Settings:** models, API credentials, voice, privacy, permissions, themes/accessibility, data storage/export, logging, and update/maintenance health.

## The operating model

1. **Capture:** user speaks/types or an explicitly enabled monitor emits a signal. Audio should be streamed through separable wake-word → STT → intent/agent → TTS stages, so each provider can be replaced.
2. **Understand:** coordinator checks conversation context, retrieves relevant memory with freshness, inspects available connectors and agent skills, and classifies task risk.
3. **Plan:** simple tasks run directly; multi-step tasks get a short visible plan, acceptance criteria, deadline, and bounded resource budget.
4. **Route:** coordinator picks the least expensive capable model/provider for the job, subject to user policy. Specialist sub-agents receive a typed contract and least-privilege tools. Independent research or verification may run in parallel; external side effects never silently cascade between agents.
5. **Act:** prefer official APIs and deterministic tools; use browser/computer vision when necessary. Treat external page/email/document content as untrusted input, not as authority to change instructions or permissions.
6. **Gate:** read-only and reversible low-risk work can proceed within configured scopes. Sending, deleting, purchasing, publishing, granting access, or other consequential changes enter the approval inbox unless the user has separately configured narrow authority.
7. **Verify:** each action returns structured success/error/evidence and a receipt. The assistant checks the resulting state, not merely whether a tool returned. Uncertain outcomes are surfaced instead of blindly retried.
8. **Report and learn:** concise answer first, then supporting sources, artifacts, cost, and caveats on demand. Propose durable learning only when verified, non-secret, useful, and non-duplicative; give the user memory controls.

## Specialist team proposal

- **Conductor** — request understanding, task decomposition, routing, delegation, and final synthesis. It does not own every tool.
- **Flux (Engineering)** — code, issue/CI/deploy inspection, patches, and review. Uses a workspace allowlist, branch/snapshot strategy, tests only when requested, and explicit commit/publish gates.
- **Relay (Comms & Support)** — triages inbox/tickets and drafts responses. Read/draft can be separate from sending; external send requires approval by default.
- **Scout (Research & Product QA)** — sourced research, competitor monitoring, and structured browser walkthroughs with reproducible evidence.
- **Prism (Design)** — designs screens using the actual component system and creates reviewable mockups/artifacts.
- **Atlas (Analyst)** — joins configured revenue, customer, code, calendar, and product signals; marks source freshness and uncertainty; explains changes rather than guessing causes.
- **Lift (Retention & Customer Health)** — identifies at-risk accounts from permitted product/support data and recommends interventions; does not contact customers autonomously by default.
- **Forge (Agent/Skill Builder)** — drafts new agents, skills, connector manifests, and tests; stages them in a disabled sandbox for review. It cannot grant itself production permissions.
- **Sentinel (Safety & Verification)** — checks task contracts, requested scopes, secret handling, tool result evidence, spend ceilings, and whether the goal really completed.

Agents should be configurations plus capability grants, not bespoke hard-coded branches. Each manifest declares role, trigger/use cases, prompt/doctrine files, allowed skills/connectors, model preferences, risk class, budget/time limits, output schema, verification method, and version. Every run is tied to its agent version and policy version.

## Upgradeable architecture

```text
Desktop UI / Voice shell
        │ typed events + WebSocket
Conversation & Task API
        │
Coordinator ── Model Router ── Provider adapters
   ├── Memory service (local store, optional Postgres/vector index)
   ├── Agent runtime (manifest-driven, bounded jobs)
   ├── Skill runtime (versioned packages, schemas, permissions)
   ├── Connector hub (MCP + native adapters + OAuth/API credentials)
   ├── Scheduler & event monitors
   ├── Approval / policy engine
   └── Evidence, audit, and verification ledger
```

Recommended design: an async local-first core with a typed API and event stream; desktop UI isolated from the runtime; a stable provider interface for LLM/STT/TTS/wake-word; MCP for compatible tools; native connector adapters for better UX; SQLite initially for uncomplicated local installs, with a supported Postgres mode if multi-device/business scale needs it. Keep vendor choices in adapters, not the coordinator. Secrets belong in the OS credential store, with per-provider/per-connector entries, scopes, rotation and delete controls—never in committed JSON or prompts.

### Drop-in capability package

```text
skills/<skill-id>/
  skill.yaml              # id, version, description, entrypoint, schemas
  SKILL.md                # when to use, workflow, limits
  permissions.yaml       # filesystem/network/app/API scope
  tests/                  # contract and sandbox checks
```

Agents live in `agents/<agent-id>/agent.yaml` plus editable doctrine and output schemas. Integrations live in `integrations/<provider>/manifest.yaml` or are registered MCP servers. The runtime scans folders, validates manifests, reports collisions/missing dependencies, and hot reloads **configuration**. New executable code is staged, reviewed, and enabled explicitly; “hot reload” must not become “run arbitrary downloaded code automatically.” Use a compatibility version and migration check before enabling packages.

### Provider and credential matrix

Support multiple named credentials for each service, each with health, intended use, cost policy, model/region, limits, and allowed agents. Examples: Claude/OpenAI/Gemini/local LLM for reasoning; Deepgram/local Whisper for STT; ElevenLabs/local Piper for TTS; GitHub/Stripe/calendar/support/data systems as connectors. Per-task routing can select cheap/fast/local or stronger models and fall back only under configured rules. Show estimated and actual spend, set daily/job caps, and stop before a new paid path exceeds the cap. Avoid managing or automating consumer subscriptions unless the provider supports an authorized integration.

## Innovative features to explore

1. **Trust dial per action, not per agent:** a skill/action can move from Observe → Propose → Confirm → Bounded Execute only after a user chooses that level. Track outcomes for that exact agent version, model, tool, and action type. Any material version/policy change resets authority to a safer state.
2. **Signal-to-decision briefs:** turn event streams into a daily “three things that matter” brief with metric movement, underlying evidence, uncertainty, and a suggested next action. Ask the user for only decisions that truly need them.
3. **Task capsules:** a portable, inspectable bundle with goal, plan, allowed tools, budget, source links, decisions, artifacts, and verification receipt. Resume, audit, or hand work to a different model without losing the trail.
4. **Connector simulator and recipe studio:** test a new integration against sample/scrubbed data, preview which agent sees which fields, and visually compose a routine from trigger → filters → agent/skill → approval → result.
5. **Personalization without prompt drift:** tone sliders, concise/detail preference, interruption behavior, and editable doctrine overlays with version history and rollback. Keep stable identity separate from task instructions and retrieved content.
6. **Maintenance mode:** periodically check provider health, stale OAuth, broken skill contracts, schedule failures, and outdated packages; propose repair actions but never silently expand permissions.
7. **Voice-first but not voice-only:** barge-in, cancellation, fast partial transcription, push-to-talk fallback, quiet hours, headphone/drive mode, accessibility controls, and transcript correction. Wake word remains optional and visibly active.
8. **Portable personal/business boundary:** separate personal memory and business workspace, with per-agent data partitioning and explicit cross-workspace bridges.

## Initial build phases

1. **Foundation:** establish package/layout and documentation; command deck shell; typed coordinator; provider interface; local sessions; redacted structured logs.
2. **Useful assistant:** text interaction, one model provider, memory review, web research with citations, deterministic local actions, and a verifiable activity timeline.
3. **Extensibility:** validated skill/agent/integration manifests, UI manager, secrets vault adapter, MCP support, credential tests, and hot reload for safe configuration.
4. **Voice:** modular STT/TTS and streaming turn-taking, push-to-talk, interruption/cancel, explicit wake-word opt-in, device selection.
5. **Work team:** bounded specialist delegation, typed contracts, artifact handoff, budgets, progress UI, and verification agent.
6. **Signals and automation:** connectors one by one (calendar, code, customers, business metrics); scheduled routines and event monitors; concise daily brief; approval inbox.
7. **Earned autonomy and polish:** per-action trust tracking, spend controls, installer/update flow, optional remote companion/phone approvals, accessibility, backup/export, and maintenance mode.

## Decisions for the build stage

- Which actual Glass AI or Jarvis experience is the visual reference if their installed UI differs from the Trillion website's cosmic language?
- Does the first version target only Windows, and should it be a local desktop application or a local web app packaged as desktop?
- Should first-run default to cloud providers configured by the user, a local model, or an onboarding choice?
- Which top three use cases should drive v1 (desktop assistant, business co-founder, coding, personal admin, research, or something else)?
- What should be connected first, if anything? Start with read-only integrations and synthetic/sample data until selected.

## Source notes

- [Trillion home and FAQ](https://hellotrillion.ai/) — product framing, six monitoring domains, agents, voice-first loop, stack details, and personality.
- [Trillion roadmap](https://hellotrillion.ai/roadmap) — built capabilities, ideas, earned autonomy, customizable model routing, approvals, monitoring, local/offline/privacy ideas, and docs/install goals.
- [Trillion start-here prompt](https://hellotrillion.ai/p/start-here) — staged build direction for conversation, tools, voice, memory, background loop, and safety.
- [Trillion orchestration prompt](https://hellotrillion.ai/p/orchestration) — least-privilege scopes, bounded execution, failure isolation, approval gates, typed handoffs, and hot-reloaded config.
- [Trillion agent-factory prompt](https://hellotrillion.ai/p/agent-factory) — drafted agents, human approval, hot-reload, and explicit tool wishlist.
- [Trillion cosmic UI prompt](https://hellotrillion.ai/p/cosmic-orb-ui) — voice-reactive orb and specialist constellation visual concept.
- [Home Assistant voice pipeline docs](https://developers.home-assistant.io/docs/voice/pipelines/) — explicit wake word, STT, intent, TTS pipeline stages.
- [Open Interpreter quickstart](https://www.openinterpreter.com/docs/terminal/quickstart) — local workspace and access-boundary pattern.

Product pages and roadmap may evolve. Trillion references above describe the public site and prompts, not a source-code audit of Trillion itself.
