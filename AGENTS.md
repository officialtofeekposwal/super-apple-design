# 🤖 Universal Instructions for AI Coding Agents

> **Applies to**: Antigravity, Claude Code, Cursor, Codex, Windsurf, OpenCode, and all LLM agents.

When designing, styling, building, or reviewing any user interface or software component in this project, you must adhere strictly to these engineering laws:

---

## 1. The Ponytail Decision Ladder (Lazy Senior Developer Rule)
The best code is the code you never wrote. Before writing any CSS, HTML, or component logic, evaluate in order:
1. **YAGNI**: Does this feature or wrapper actually need to exist? If not, skip it.
2. **Reuse**: Is it already in the codebase? Check existing components and tokens.
3. **Stdlib**: Can the language standard library / browser native API do it?
4. **Native**: Is there a native platform/browser feature? (e.g., HTML5 `<dialog>`, CSS `clamp()`, View Transitions API).
5. **Existing Deps**: Is there an already installed dependency covering this?
6. **One Line**: Can it be done in one readable line?
7. **Minimum Code**: Write only the simplest, smallest implementation that works.

---

## 2. Follow the 4-Phase Production Engine
Always execute according to `skills/design-workflow/SKILL.md`:
1. **Direction**: Never code blindly. Propose 3 contrasting design concepts first. Lock tokens (palette, typography, radii, spacing) once confirmed.
2. **Build**: Construct clean, responsive, accessible components adhering to Apple HIG foundations on the 4px rhythm.
3. **Test**: Perform responsive verification (375px mobile, 768px tablet, 1280px desktop) in both Light Mode and Dark Mode.
4. **Review**: Critique visual hierarchy and alignment. Fix Critical and Important issues.

---

## 3. Apply Apple HIG Foundations
Adhere strictly to `skills/apple-design-universal/SKILL.md`:
- **Brand Wins**: User's brand guidelines and identity always take precedence over defaults.
- **No IP Infringement**: Never copy Apple trademarks, icons, or proprietary font binaries.
- **4px Scale / 8pt Grid**: Align all spacing, margins, and dimensions to the 4px scale (`8, 12, 16, 20, 24, 32, 48px`).
- **44px Touch Targets**: Interactive controls must meet minimum 44x44px hit bounds.
- **Typography**: Use native system font stacks and `rem` units with optical tracking.
- **Color & Contrast**: Enforce WCAG AA (4.5:1 body, 3:1 display). Never communicate state through color alone.
- **Liquid Glass Discipline**: Use glass strictly on control surfaces (navbars, tab bars, sheets). **No glass-on-glass stacking**. Provide reduced-transparency fallback.
- **Motion**: Use natural spring curves (`150ms-350ms`) and respect `prefers-reduced-motion`.

---

## 4. Pre-Flight Checklist
Before reporting a task complete or saying "Done", run this checklist:
- [ ] 3 design directions were offered and one was confirmed.
- [ ] Spacing aligns with the 4px scale.
- [ ] All touch targets $\ge$ 44x44px.
- [ ] Contrast meets WCAG 4.5:1 (normal text) and 3:1 (large text / UI components).
- [ ] Liquid Glass is restricted to the control layer with zero glass-on-glass stacking.
- [ ] Reduced-motion and reduced-transparency fallbacks are provided.
- [ ] Responsive layouts verified across mobile (375px), tablet (768px), and desktop (1280px).
- [ ] Chat replies are kept concise and structured.
