---
name: design-workflow
description: Master workflow for building any website, web app or software UI with high design quality in 4 phases - Direction, Build, Test, Review. Uses apple-design-universal plus optional helper skills (taste-skill, designlang, react-bits, gsap-skills, playwright-cli, impeccable, transitions.dev, hallmark) when installed. Use for build, design, redesign, landing page, dashboard, app UI, or "make it look better".
---

# Design Workflow

Direction first, then design. Never rush to "just build it".
Foundations (layout, type, color, accessibility, motion, and anti-AI-slop gates) come from the `apple-design-universal` skill. Always apply it.

## Helper skills (optional)
Use each only if it is installed. If one is missing, continue without it and say so once: `Note: <skill> is not installed; using built-in rules.`

| Skill | Use it for |
|---|---|
| taste-skill | Art direction, reference images, browser check |
| designlang | Extract a reference site's design system |
| react-bits | Animated React / Next.js components |
| gsap-skills | Scroll and timeline animation with GSAP |
| playwright-cli | Open the site, click through, take screenshots |
| impeccable | Critique and audit |
| transitions.dev | UI and page transitions |
| hallmark | Anti-AI-slop engine, 3-tier quality gates (Floor, Reflex, Finish), sloplint, redesign & audit |

## Phase 0 - Brief & Real Materials
1. Ask at most 3 short questions only if missing: what is it, who is it for, what is the one main action. Otherwise assume and state the assumptions in one line.
2. **Real Material Rule (Hallmark)**: Request real photos, screenshots, and genuine numbers. Never invent fake testimonials, placeholder logos, or generic stock-photo placeholders. If assets are needed, use legal open photography (Wikimedia Commons CC0/CC-BY).

## Phase 1 - Direction
1. Propose **3 different design directions**. For each: name, mood, palette idea, type idea, one signature detail (3 lines max).
2. Pick the best one, or let the user pick (if told to decide, choose and give the reason in one sentence). Lock a small design brief: color tokens (light and dark), accent, type scale in rem, spacing, radius scale (e.g. 12/20/28px), motion style.
   Useful contrasting directions: (a) restrained neutral with deep whitespace and hairline borders, (b) vibrant editorial with rich accents and strong type, (c) layered spatial depth with floating controls and careful glass.
3. With a reference site: extract its design system (designlang if installed), then create an original palette and typography inspired by it. Never copy another brand's logo, name, exact layout or assets.
4. Use taste-skill here for art direction if installed.

## Phase 2 - Build
1. Mobile-first, using the locked tokens, semantic colors and the 4px spacing scale.
2. Components: React Bits for animated pieces (React/Next.js only), and only where they help the content. Max 1-2 "wow" effects per page.
3. Motion: GSAP for scroll/timeline, transitions.dev patterns for transitions. Otherwise plain CSS on transform/opacity.
4. Always include every state (hover, focus, pressed, disabled, loading, empty, error), dark mode, reduced-motion fallback, alt text, semantic HTML.
5. Performance: lazy-load images, avoid layout shift, `font-display: swap`, no heavy libraries for small effects.
6. **Anti-AI-Slop Reflex Enforcement (Hallmark)**: Strictly eliminate the 7 AI tells: no purple gradients, no meaningless eyebrow badges above every heading, no widely tracked uppercase microcopy (`W I D E L Y`), no single-colored word in titles, no empty bento boxes, no viewport-clipped hero, and no dummy non-functioning forms.

## Phase 3 - Test
1. With Playwright: open every page. Check console errors, links, buttons, form validation, Tab order, no horizontal scroll at 320px.
2. Take screenshots at 375x812, 768x1024 and 1280x800 in light and dark (6 shots). Look at them and fix visible problems: wrapping or overlap, horizontal overflow, low contrast on glass, clipped inputs.
3. No Playwright: run the dev server and review the code against the checklist in `apple-design-universal`.
4. **Hallmark Sloplint**: Run `python scripts/audit-design.py <path>` or `sloplint` across mobile and desktop viewports to catch regressions.

## Phase 4 - Review
1. Critique like a senior designer (impeccable if installed): hierarchy, spacing rhythm, contrast, consistency, copy, motion.
2. **Hallmark 3-Tier Gate Sign-off**:
   - **Floor Gates (Never Ships)**: WCAG AA $\ge 4.5:1$, visible focus rings, reduced motion/transparency fallbacks, zero invented data, zero mobile overflow at 320px. If one fails, the build does not ship.
   - **Reflex Gates**: Confirm all 7 AI slop tells are eliminated (or explicitly justified on the record).
   - **Finish Gates**: Polish tactile spring damping, optical icon balance, and Liquid Glass specular edge framing.
3. Run the final 20-point checklist from `apple-design-universal/CHECKLIST.md`. Do not say "done" until it passes.

## Hallmark Commands
- **Audit**: `/apple-design audit <path>` or `/hallmark audit <path>` — scans without changing files, reporting slop tells and gate failures.
- **Redesign**: `/apple-design redesign <path>` or `/hallmark redesign <path>` — rebuilds layout while strictly preserving wiring, links, and content (`sloplint --kept`).

## Output format
- Start with one line: what you will build and which direction you chose.
- End with 3-5 bullets: what was built, key decisions, what was tested, one next step.
- Keep chat replies short. Put detail in files.

## Rules
- The user's brand and instructions win. Mention conflicts in one line.
- Never copy another brand's design. Never invent stats, testimonials or logos.
- Respect licenses. Do not copy third-party code or assets unless the license allows it.
