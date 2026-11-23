# 🔄 The 4-Phase Production Engine: Deliverables & Milestones

> **A systematic, gated loop that guarantees zero AI-slop and verifiable, production-ready interfaces.**

---

## 🧭 Phase 1: Direction (Art Direction & Token Locking)

### 🛑 Hard Gate: Never Write Code Blindly
Before writing any HTML, JSX, CSS, or Flutter/SwiftUI code, you must establish creative alignment with the user.

### Step-by-Step Execution:
1. **Domain Context Analysis**:
   - Analyze user domain (e.g. Fintech, Personal Productivity, Spiritual/Reflection, Creative Studio, DevTool).
   - Identify visual density requirements (high density for developer tools, airy/spacious for wellness/reflection).
2. **Formulate 3 Contrasting Creative Directions**:
   - **Direction A: Restrained Cupertino Monochrome**:
     - *Palette*: Absolute `#000000` / `#FFFFFF` with muted secondary labels.
     - *Vibe*: Clean, architectural, quiet deference, minimal tint.
     - *Typography*: Strict SF Pro / Inter typographic scale with negative tracking.
   - **Direction B: Luminescent Editorial Vibrancy**:
     - *Palette*: Deep sapphire / electric indigo `#007AFF` accent, warm tinted neutrals, rich dark mode luminescence.
     - *Vibe*: Premium editorial, high visual energy, colored back-reflections.
   - **Direction C: Neo-visionOS Spatial Depth**:
     - *Palette*: Multi-layered glassmorphic surfaces, subtle radial specular spotlights, elevated floating navigation docks.
     - *Vibe*: Tactile, floating, futuristic, interactive spring feedback.
3. **Lock Design Tokens**:
   - Require user confirmation or declare selected direction.
   - Lock colors, continuous squircle radius scale (`10px`, `14px`, `20px`, `28px`), and font scale.

---

## 🏗️ Phase 2: Build (Tactile Craft & Systematic Restraint)

### Step-by-Step Execution:
1. **Layout Grid Foundation**:
   - Build mobile-first starting at `375px` width.
   - Strictly apply the 4px rhythm (`8px`, `12px`, `16px`, `20px`, `24px`, `32px`, `48px`).
   - Pad hardware safe areas (`env(safe-area-inset-top)` / `bottom`).
2. **Interactive Controls & 44px Bounds**:
   - Ensure every button, chip, tab, and input has $\ge 44\times 44\text{px}$ hit target bounds.
   - Provide complete 5-state coverage: `default`, `hover`, `active (scale 0.97)`, `focus-visible`, and `disabled`.
3. **Liquid Glass Control Layer**:
   - Apply frosted glass strictly to navigation bars, floating docks, and modal sheets.
   - Zero glass-on-glass stacking.
   - Provide solid fallback under `@media (prefers-reduced-transparency: reduce)`.
4. **Motion Physics**:
   - Apple spring physics (`cubic-bezier(0.25, 0.1, 0.25, 1)`), duration `150ms-350ms`.
   - Wrap in `@media (prefers-reduced-motion: no-preference)`.

---

## 🧪 Phase 3: Test (Autonomous Multi-Viewport QA)

### Step-by-Step Execution:
1. **Automated Viewport Screenshot Matrix**:
   - Launch preview server and run visual captures across 6 essential states:
     - **Mobile Phone** (`375 x 812`): Light Mode & Dark Mode
     - **Tablet** (`768 x 1024`): Light Mode & Dark Mode
     - **Desktop** (`1280 x 800`): Light Mode & Dark Mode
2. **Defect Triage Checklist**:
   - Check horizontal scroll at `320px` (must be zero).
   - Check text wrapping and clipping on small cards.
   - Verify keyboard focus traversal (`Tab` order).
   - Verify contrast ratios in both Light and Dark modes.

---

## 💎 Phase 4: Review (Senior Designer Critique Gate)

### Step-by-Step Execution:
1. **Objective Design Critique**:
   - Scrutinize visual hierarchy: Does the eye immediately land on the primary action?
   - Check optical balance: Are icons centered with typography?
   - Verify tracking: Did display titles receive negative letter-spacing?
2. **Categorize Issues**:
   - **Critical (Must fix before completion)**: Contrast failure, clipped text, broken mobile layout, touch targets $< 44\text{px}$.
   - **Important (Fix before shipping)**: Missing hover state, slight misalignment, inconsistent corner radii.
   - **Suggestions (Optional future enhancement)**: Advanced micro-animations or localized translations.
3. **Run 20-Point Pre-Flight Shipping Checklist**:
   - Ensure all items in `skills/apple-design-universal/CHECKLIST.md` are 100% green.
