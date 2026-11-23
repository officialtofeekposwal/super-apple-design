# 🧩 The 7 Viral Design Skills: Orchestration & Fallback Guide

> **How `design-workflow` coordinates the community's top 7 design tools without hard dependencies.**

---

## 🛠️ The Upstream Suite Matrix

| Skill / Tool | Author | GitHub Repository | Primary Workflow Responsibility |
| :--- | :--- | :--- | :--- |
| **1. Taste Skill** | Leon | `https://github.com/Leonxlnx/taste-skill` | Phase 1 Art Direction & 3 conceptual design directions |
| **2. designlang** | Manav Arya | `https://github.com/Manavarya09/design-extract` | Reverse-engineer color palettes & spacing from reference URLs |
| **3. React Bits** | David Haz | `https://github.com/DavidHDev/react-bits` | 217+ animated React & Next.js components & background shaders |
| **4. GSAP Skills** | GreenSock | `https://github.com/greensock/gsap-skills` | Smooth scroll choreographies & timeline ScrollTrigger physics |
| **5. Playwright CLI** | Microsoft | `https://github.com/microsoft/playwright-cli` | Autonomous headless browser screenshot runner & test audit |
| **6. Impeccable** | Paul Bakaus | `https://github.com/pbakaus/impeccable` | Phase 4 Design vocabulary, critique matrix, and contrast audit |
| **7. transitions.dev** | Jakub Antalík | `https://github.com/jakubantalik/transitions.dev` | 43+ UI motion transitions & View Transitions API |
| **8. Hallmark** | Hassan El Mghari (`nutlope`) | `https://github.com/nutlope/hallmark` | Anti-AI-slop design engine, 3-tier quality gates (Floor, Reflex, Finish), browser sloplint |

---

## ⚡ The Fallback Protocol (Graceful Degradation)

Every agent must follow this rule:
> **If any of the 7 upstream skills is not installed in the current environment, NEVER abort the task.**  
> Simply output one short line:  
> `Note: [skill-name] is not installed; proceeding with built-in Apple design rules.`  
> and continue immediately using the native guidelines in `apple-design-universal`.

---

## 📋 Phase-by-Phase Integration Recipes

### 1. In Phase 1: Direction
- **With `taste-skill`**:
  ```markdown
  Activate taste-skill. Analyze domain requirements and suggest 3 high-contrast design directions.
  ```
- **With `designlang`**:
  ```markdown
  Run designlang on reference URL [link] to extract color tokens, fonts, and spacing into CSS variables.
  ```

### 2. In Phase 2: Build
- **With `react-bits`**:
  - Pull text shaders, spotlight cards, or dynamic background waves directly into the React/Next.js layout.
- **With `gsap-skills`**:
  - Apply GreenSock ScrollTrigger timelines to smoothly pin hero banners and stagger card entrance opacity.
- **With `transitions.dev`**:
  - Implement smooth page morphs using the native Web View Transitions API.

### 3. In Phase 3: Test
- **With `playwright-cli`**:
  ```bash
  # Autonomous multi-viewport capture
  npx playwright screenshot --viewport-size 375,812 http://localhost:3000 mobile-light.png
  npx playwright screenshot --viewport-size 768,1024 http://localhost:3000 tablet-light.png
  npx playwright screenshot --viewport-size 1280,800 http://localhost:3000 desktop-light.png
  ```

### 4. In Phase 4: Review
- **With `impeccable`**:
  ```markdown
  Run impeccable critique on the generated screen. Audit typographic rhythm, contrast ratios, and element alignment.
  ```
- **With `hallmark`**:
  ```markdown
  Run hallmark audit on the generated page to inspect for the 7 AI tells and verify the 3-Tier Quality Gates:
  - Floor Gates: Zero contrast failures, active keyboard focus, reduced motion fallbacks, no broken viewports.
  - Reflex Gates: Hunt and eliminate purple gradients, gratuitous eyebrow pills, tracked-caps, and single colored words.
  - Finish Gates: Verify 4px rhythm, 44px hit bounds, and Liquid Glass specular edge framing.
  ```

---

## 🛡️ Hallmark Anti-AI-Slop Command Patterns

When Hallmark is installed, invoke these commands directly:
- **Audit existing screen**:
  ```markdown
  /hallmark audit ./src/app
  # or using the local linter:
  python scripts/audit-design.py ./src
  ```
- **Redesign while preserving wiring & links**:
  ```markdown
  /hallmark redesign ./src/app
  # Enforces that all links, form handlers, and data bindings remain intact (sloplint --kept).
  ```
- **Custom Mode (No Template / Pure Original Craft)**:
  ```markdown
  /hallmark custom "Build a spatial banking dashboard using Cupertino Dark glass tokens"
  ```
