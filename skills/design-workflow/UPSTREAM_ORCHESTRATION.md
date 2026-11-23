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
