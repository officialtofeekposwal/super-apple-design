# 🍎 Super Apple Design

> **The Universal Apple Design System & 4-Phase Workflow Engine for AI Coding Tools**  
> Empowers **Claude Code**, **Antigravity**, **Cursor**, **Codex**, and **Windsurf** to build human-grade, accessible, and high-craft software.

[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg?style=flat-square)](LICENSE)
[![Apple HIG Compliant](https://img.shields.io/badge/Design_Standards-Apple_HIG_Compatible-white.svg?style=flat-square&logo=apple&color=000000)](https://developer.apple.com/design/)
[![Multi-Agent Ready](https://img.shields.io/badge/AI_Agents-Claude_|_Antigravity_|_Cursor_|_Codex-blue.svg?style=flat-square)](#-quick-install)
[![WCAG AA](https://img.shields.io/badge/Accessibility-WCAG_AA_Compliant-success.svg?style=flat-square)](skills/apple-design-universal/SKILL.md)
[![Workflow](https://img.shields.io/badge/Workflow-4--Phase_Production-orange.svg?style=flat-square)](#-the-4-phase-production-workflow)

---

## 🌟 Why Super Apple Design?

Most AI-generated websites look like generic "AI-slop"—flat gray boxes, uninspired typography, zero tactile physics, and broken mobile responsiveness.

**Super Apple Design** permanently elevates your coding agents into world-class design engineers by enforcing:
1. **Apple Human Interface Guidelines (HIG)**: Translated into stack-neutral, concrete engineering rules (Web, iOS, Android, Desktop).
2. **The 4-Phase Production Engine**: Eliminates blind coding by forcing **Direction ➔ Build ➔ Test ➔ Review**.
3. **Hallmark Anti-AI-Slop Architecture**: Codified 3-tier quality gates (**Floor, Reflex, Finish**) that systematically eliminate the 7 machine-generated tells (no purple gradients, no gratuitous eyebrow pills, no tracked-caps, no single-word coloring, no empty bento frames).
4. **Orchestration with Upstream Power Tools**: Seamlessly coordinates `hallmark`, `taste-skill`, `designlang`, `react-bits`, `gsap-skills`, `playwright-cli`, `impeccable`, and `transitions.dev` with graceful fallbacks.

---

## 📐 The 4-Phase Production Engine

```
┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐
│  1. DIRECTION    │ ───> │    2. BUILD      │ ───> │     3. TEST      │ ───> │    4. REVIEW     │
│  3 Concepts      │      │  4px Base Scale  │      │  Playwright CLI  │      │  Impeccable      │
│  Lock Tokens     │      │  44px Targets    │      │  Multi-Viewport  │      │  Pre-Flight      │
│  (Taste Skill)   │      │  Liquid Glass    │      │  Light & Dark    │      │  Checklist Gate  │
└──────────────────┘      └──────────────────┘      └──────────────────┘      └──────────────────┘
```

| Phase | Core Objective | Key Deliverables |
| :--- | :--- | :--- |
| **1. Direction** | Creative consensus before writing code | 3 high-contrast concepts; locked color palette, type scale, and continuous squircle radii |
| **2. Build** | High-craft execution | 4px grid rhythm, 44px hit bounds, system fonts, Liquid Glass on control layers only |
| **3. Test** | Autonomous visual verification | Automated Playwright screenshots at `375px` (mobile), `768px` (tablet), `1280px` (desktop) in Light & Dark modes |
| **4. Review** | Critique and polish before shipping | Typography tracking verification, contrast checks, and 10-point pre-flight checklist |

---

## 🚀 Quick Install

Clone the repository to get started:
```bash
git clone https://github.com/officialtofeekposwal/super-apple-design.git
cd super-apple-design
chmod +x install.sh
```

### Install by Target Tool

```bash
# 🤖 Claude Code (Global across all projects)
./install.sh --target claude --global --with-upstream

# 🌌 Antigravity (Current project scope)
./install.sh --target antigravity --project

# 🖱️ Cursor (Installs .cursor/rules/apple-design.mdc)
./install.sh --target cursor

# ⚡ Install Everywhere (Claude, Antigravity, Cursor, and Upstream tools)
./install.sh --target all --project --with-upstream
```

> **Tip**: Use `--dry-run` first to preview the exact file operations without modifying your system:  
> `./install.sh --target all --dry-run`

---

## 📂 Where Files Go

| Tool | Global Path | Project Path |
| :--- | :--- | :--- |
| **Claude Code** | `~/.claude/skills/` | `.claude/skills/` |
| **Antigravity** | `~/.gemini/antigravity/skills/` | `.agent/skills/` |
| **Cursor** | *N/A* | `.cursor/rules/apple-design.mdc` |
| **Codex / Windsurf** | *N/A* | Copy `AGENTS.md` to project root |

*(If using Antigravity and skills do not appear after restart, see the ready-to-paste fallback prompt in [`prompts/antigravity-install.md`](prompts/antigravity-install.md)).*

---

## 🎨 Apple HIG Design Specs Cheat Sheet

### 1. Liquid Glass CSS Formula
Translucent materials belong **only on control layers** (headers, tab bars, sheets)—never on main content cards or body canvases. **Never stack glass on glass.**

```css
.apple-glass {
  background-color: rgba(255, 255, 255, 0.72);
  backdrop-filter: blur(24px) saturate(190%);
  -webkit-backdrop-filter: blur(24px) saturate(190%);
  border: 1px solid rgba(255, 255, 255, 0.45);
  box-shadow: 
    0 1px 2px rgba(0, 0, 0, 0.04),
    0 12px 32px -4px rgba(0, 0, 0, 0.08),
    inset 0 1px 1px 0 rgba(255, 255, 255, 0.85);
}

@media (prefers-color-scheme: dark) {
  .apple-glass {
    background-color: rgba(28, 28, 30, 0.75);
    border: 1px solid rgba(255, 255, 255, 0.12);
    box-shadow: 
      0 1px 2px rgba(0, 0, 0, 0.4),
      0 16px 40px -4px rgba(0, 0, 0, 0.6),
      inset 0 1px 0.5px 0 rgba(255, 255, 255, 0.2);
  }
}

/* Fallback for accessibility */
@media (prefers-reduced-transparency: reduce) {
  .apple-glass {
    background-color: var(--color-surface-elevated) !important;
    backdrop-filter: none !important;
  }
}
```

### 2. Apple Spring Curves
Avoid mechanical linear easing. Use physical, interruptible springs:
```css
/* Standard Apple Spring curve */
transition-timing-function: cubic-bezier(0.25, 0.1, 0.25, 1);
transition-duration: 250ms;
```

### 3. Typography Optical Tracking
- **Large Display Titles (`> 28px`)**: Apply negative tracking (`letter-spacing: -0.02em`).
- **Body Text (`15px - 17px`)**: Apply optical tracking (`letter-spacing: -0.008em`).
- **Small Captions & Footnotes (`< 13px`)**: Apply positive tracking (`letter-spacing: +0.01em`).

---

## 💬 How to Prompt Your Agent

### 1. Build a New Interface
```markdown
Use design-workflow and apple-design-universal.
I want to build a landing page for my productivity app.
Suggest 3 high-contrast design directions first. Do not write code yet.
```

### 2. Lock & Build Components
```markdown
Let's proceed with Direction 2 (Luminescent Editorial Vibrancy).
Build the responsive Navigation Bar and Hero section using Apple HIG standards:
- Minimum 44x44px touch targets
- System font stack with optical tracking
- Liquid Glass applied strictly to the sticky control layer
```

### 3. Visual QA & Verification
```markdown
Run a Playwright visual audit on localhost:3000.
Capture responsive screenshots at 375px (mobile), 768px (tablet), and 1280px (desktop)
in both Light Mode and Dark Mode. Report any layout overflow or contrast failures.
```

### 4. Review & Pre-Flight Audit
```markdown
Review this screen against the Apple Design Universal pre-flight checklist.
Fix all Critical and Important issues before handoff.
```

---

## 🧩 Upstream Helper Skills Integration

The viral upstream skills from the developer community can be installed into your coding agent by pasting their repository link:

| # | Skill / Tool | Creator | Repository Link | What It Adds |
| :-: | :--- | :--- | :--- | :--- |
| **1** | **Hallmark** | Hassan El Mghari (`nutlope`) | [github.com/nutlope/hallmark](https://github.com/nutlope/hallmark) | Anti-AI-slop design engine, 3-tier gates & browser sloplint |
| **2** | **Taste Skill** | Leon | [github.com/Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | Art direction & 3 conceptual directions |
| **3** | **designlang** | Manav Arya | [github.com/Manavarya09/design-extract](https://github.com/Manavarya09/design-extract) | Token extraction from any reference site |
| **4** | **React Bits** | David Haz | [github.com/DavidHDev/react-bits](https://github.com/DavidHDev/react-bits) | 217+ animated React components & shaders |
| **5** | **GSAP Skills** | GreenSock | [github.com/greensock/gsap-skills](https://github.com/greensock/gsap-skills) | Professional ScrollTrigger choreographies |
| **6** | **Playwright CLI** | Microsoft | [github.com/microsoft/playwright-cli](https://github.com/microsoft/playwright-cli) | Headless browser testing & screenshot QA |
| **7** | **Impeccable** | Paul Bakaus | [github.com/pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Design critique vocabulary & polish matrix |
| **8** | **transitions.dev** | Jakub Antalík | [github.com/jakubantalik/transitions.dev](https://github.com/jakubantalik/transitions.dev) | 43+ UI motion transitions & page morphs |

> *Note: If any helper tool is not installed, `design-workflow` automatically falls back to native Apple HIG rules without throwing errors.*

---

## 🛡️ Hallmark Anti-AI-Slop 3-Tier Quality Gates

To guarantee interfaces never look machine-made or generic, every screen must clear three gate tiers:

### 1. 🛑 Floor Gates (Hard Blocker — Never Ships)
A single violation immediately blocks deployment:
- **WCAG AA Contrast**: Body text $\ge 4.5:1$, large text and controls $\ge 3:1$.
- **Visible Keyboard Focus**: Distinct `:focus-visible` ring on every interactive control.
- **Physical Hit Bounds**: Minimum $44\times 44\text{px}$ touch targets.
- **Responsive Containment**: Zero horizontal overflow at $320\text{px}$ viewport width.
- **Accessibility Fallbacks**: Functional `prefers-reduced-motion` and `prefers-reduced-transparency`.
- **Truth in Product**: Zero fake numbers, placeholder metrics, or fabricated testimonials.

### 2. 🚫 Reflex Gates (The 7 AI Slop Tells — Prohibited by Default)
1. **The Purple Gradient**: Ban default `from-purple-600 to-indigo-600` backgrounds.
2. **Gratuitous Eyebrows**: Ban decorative all-caps badges above every section title.
3. **Widely Tracked Uppercase**: Ban unnatural `tracking-widest uppercase` microcopy (`W I D E L Y`).
4. **Single-Colored Headline Word**: Ban coloring exactly one word in a headline with accent color.
5. **Empty Bento Box Frames**: Ban decorative grids of boxes holding generic icons or filler.
6. **Viewport-Missing Hero**: Hero must clearly state what the product does and fit the viewport cleanly.
7. **Dummy Forms**: Ban fake email or contact forms that fail to submit or trigger fake toasts.

### 3. ✨ Finish Gates (Apple HIG Tactile Craft)
- 4px spacing scale & continuous squircle corners (`corner-smoothing: 60%`).
- Liquid Glass restricted to control layers with 1px inset specular borders (never glass-on-glass).
- Harmonic spring physics (`cubic-bezier(0.25, 0.1, 0.25, 1)`).

### Hallmark Commands
```markdown
# Audit an existing codebase for slop tells and gate failures
python scripts/audit-design.py ./src

# Or with Hallmark CLI installed:
/hallmark audit ./src/app
/hallmark redesign ./src/app    # Rebuilds layout while preserving wiring & links (sloplint --kept)
```

---

## 📁 Repository Layout

```
super-apple-design/
├── .claude-plugin/
│   └── plugin.json                  # Claude Code plugin manifest
├── .cursor/
│   └── rules/
│       ├── apple-design.mdc         # Cursor HIG foundations rule
│       └── design-workflow.mdc      # Cursor 4-phase production rule
├── agents/                          # Specialized Agent Subsystems
│   ├── apple-design-architect.md    # High-level system design & layout strategist
│   ├── hig-accessibility-auditor.md # WCAG AA 4.5:1, keyboard nav, screen reader auditor
│   ├── liquid-glass-engineer.md     # Shader, CSS backdrop, and tactile physics specialist
│   └── visual-qa-tester.md          # Autonomous Playwright screenshot & viewport inspector
├── prompts/
│   ├── antigravity-install.md       # Multi-language quickstart (Hinglish + English)
│   ├── claude-code-install.md       # Claude Code CLI setup guide
│   └── design-brief-generator.md    # Phase 1 Direction interactive questionnaire
├── scripts/
│   ├── install.sh                   # Universal bash installer for Linux/macOS
│   ├── install.ps1                  # Native PowerShell installer for Windows
│   ├── audit-design.py              # Automated design & accessibility linter
│   └── playwright-viewport-test.js  # Headless multi-viewport screenshot runner (375, 768, 1280px)
├── skills/
│   ├── apple-design-universal/      # Master HIG Universal Specification
│   │   ├── SKILL.md                 # Core rules (4px rhythm, typography, contrast, safe areas)
│   │   ├── TOKENS.md                # Multi-stack tokens (CSS, Tailwind, Flutter, SwiftUI)
│   │   ├── MATERIALS.md             # Liquid Glass, blur, noise, and shadow elevation formulas
│   │   └── CHECKLIST.md             # 20-point pre-flight shipping gate
│   ├── design-workflow/             # The 4-Phase Production Engine
│   │   ├── SKILL.md                 # Direction -> Build -> Test -> Review loop
│   │   ├── PHASES.md                # Detailed deliverables per phase
│   │   └── UPSTREAM_ORCHESTRATION.md# Integration recipes for the 7 viral design skills
│   ├── liquid-glass-physics/        # Dedicated Tactile & Spatial Physics Skill
│   │   ├── SKILL.md                 # Spring curves, haptic timing, glass overlays, fallbacks
│   │   └── SHADERS.md               # WebGL/GLSL, CSS filter, and Skia/Flutter shaders
│   └── apple-hig-components/        # Stack-Specific Component Blueprints
│       ├── SKILL.md                 # Navigation bars, segmented controls, modal sheets, cards
│       ├── web-react-tailwind.md    # React 19 + Tailwind v4 snippets
│       ├── flutter-compose.md       # Flutter Drift/Riverpod & Jetpack Compose recipes
│       └── swiftui-native.md        # Native SwiftUI iOS/macOS patterns
├── tokens/                          # Raw Machine-Readable Design Tokens
│   ├── colors.json                  # Light & Dark semantic color palette
│   ├── typography.json              # Type scales, weights, and letter-spacing
│   └── spacing-radii.json           # 4px scale, squircle radius definitions
├── AGENTS.md                        # Master agent behavioral rules & Ponytail decision ladder
├── CREDITS.md                       # Full attribution & upstream repo links
├── LICENSE                          # MIT License
├── .gitignore                       # Clean ignore rules
└── README.md                        # Documentation
```

---

## ⚠️ Important Guardrails

- **Brand Primacy**: The user's brand identity, custom colors, and guidelines **always override** these defaults.
- **No IP Infringement**: Never copy Apple trademarks, proprietary fonts (`SF Pro` binaries), or protected icons. Use standard open system font stacks and open-source icons (Lucide, Heroicons).
- **Originality**: Use external reference sites strictly for token inspiration—never clone another brand's layout or assets.
- **Truth in Copy**: Never invent fake user statistics or fabricated testimonials.

---

## 📄 License

MIT © 2026 [Tofeek Poswal](https://github.com/officialtofeekposwal) & Open Source Contributors. See [LICENSE](LICENSE) for details.
