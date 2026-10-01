# Trillion AI

Trillion keeps Trillion's interface and product identity. Brahma Echo is the underlying assistant core: its `ChatEngine` owns turn handling, memory recall, guardrails, safe local tool registry, startup recovery, and auto-heal. Brahma also owns the per-user API-key store and Gemini connection/model discovery through Google's GenAI SDK. Other supported services use their matching provider SDK behind Brahma's ChatEngine seam.

This is a separate build under `Trillion AI`. It does not modify the installed Brahma Echo, Glass AI, or Mark58 applications. Brahma smart-home features are excluded.

## Start on Windows

1. Install Node.js 20+ and Python 3.11+.
2. Run [`install_and_run.bat`](install_and_run.bat). It installs dependencies, builds the interface, and opens Trillion in its desktop window.
3. In **Settings → Model & providers**, enter a supported API key. Brahma detects the provider, validates the key, discovers accessible Gemini models, and saves Gemini credentials in Brahma Echo's existing key store at `%LOCALAPPDATA%\BrahmaAI\config\api_keys.json`. Trillion preferences stay in `%LOCALAPPDATA%\TrillionAI`. Keys are not bundled with the project.
4. In **Settings → Knowledge & vault**, select the folder for your existing Obsidian vault.

The local service binds to `127.0.0.1`. `npm run desktop` builds and opens the desktop shell; `npm start` starts the browser development UI.

## What runs through Brahma

- **Main assistant turns:** Trillion's chat endpoint delegates turn lifecycle, memory recall, and response guardrails to Brahma `ChatEngine`. Brahma local tools and auto-heal are loaded from the copied Brahma core inside this build.
- **API keys, Gemini connection, and voice:** Gemini credentials are read from and written to the same `%LOCALAPPDATA%\BrahmaAI\config\api_keys.json` used by the installed Brahma Echo app, with a current-user Windows ACL. Trillion preferences and its Settings interface stay in `%LOCALAPPDATA%\TrillionAI` and the Trillion UI. Gemini key validation, accessible-model discovery, chat generation, Live microphone transcription, recorded-audio fallback, and Google-voice TTS all use Brahma's Google GenAI client. Provider authentication failures are recorded as non-secret fingerprints in Brahma's key store; keys are retained and stop being skipped when replaced. Other providers use their corresponding clients called through Brahma's ChatEngine adapter.
- **Workers:** each worker receives its own doctrine and only the real tools allowed by its manifest. Worker turns also use Brahma `ChatEngine`. Unknown or unimplemented integrations are not granted. Workers cannot delegate further, run shell commands, or modify code through this tool layer.
- **Local actions:** Brahma's safe registry supplies app launch, opening URLs/folders, file-name search, system status, and web search/fetch when Brahma's web permission allows it. Trillion adds Playwright-backed Chrome actions, Obsidian search, and installed plugin tools.
- **Auto-heal and extensions:** Brahma's recovery and auto-heal code is included and pointed at Trillion's project and user-data directories. Forge adds package diagnostics, safe metadata repair with backups, a reviewed install catalog, and agent doctrine revisions with recoverable backups. Code patches are limited to the project root and use syntax preflight, backup, and rollback on failed writes.
- **Phone link:** the pairing gateway runs as a separate local service on port `8766`; Trillion's API uses `8765`. No paired personal-device data is copied from the original Brahma installation.

## Trillion features retained

The existing Trillion UI is the source of truth: its navigation, orb/HUD, chat layout, voice and conversation modes, colors, liquid-glass appearance controls, crew, memory, Obsidian settings, and desktop shell remain in place. Forge and phone pairing are added as pages in that interface. Trillion Settings is the visual control surface; Brahma's key store and provider runtime own credential persistence and Gemini connectivity underneath.

## Extension boundaries

- **Installable catalog:** Glass AI skill and agent documents are copied as local prompt packages. A reviewed allowlist of Mark58 Python plugins is copied into the installed plugin directory and exposed through Trillion's plugin adapter.
- **Create and improve:** Trillion can create local skill/agent instruction packages and improve an installed agent's doctrine. Improvements preserve a timestamped backup and update the revision in the manifest.
- **MCP:** profiles can be discovered and displayed, but launching MCP processes, discovering their tools, OAuth, and worker-specific MCP grants are not implemented yet. An MCP profile is not an active connection.
- **External integrations:** integrations such as connected email, analytics, and support systems are not available until configured adapters are added. Worker labels alone do not make those integrations operational.
- **Workspace coding:** the built-in worker tool layer can search local files and open folders, but it does not provide code editing or arbitrary terminal execution to workers.
- **Speech:** Trillion keeps the voice interface and customization controls; Brahma owns Gemini Live, transcription, TTS, provider keys, and the Google GenAI connection. Voice availability still depends on model permissions, quotas, and the Windows audio stack.

See [`AGENT.md`](AGENT.md) for product principles and [`PRODUCT_BLUEPRINT.md`](PRODUCT_BLUEPRINT.md) for the longer design and source research.
