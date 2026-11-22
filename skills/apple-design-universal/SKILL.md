---
name: apple-design-universal
description: Apple Human Interface Guidelines (HIG) turned into stack-neutral design rules for any website, web app, mobile app or desktop software. Use whenever you build, review or restyle UI - layout, typography, color, dark mode, accessibility, motion, icons, Liquid Glass materials, forms, navigation, UX writing. Works with any stack (HTML/CSS, React, Next.js, Tailwind, Flutter, React Native, SwiftUI, Electron).
---

# Apple Design Universal

Based on Apple's Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/
The ideas below are written in our own words. They come from Apple platforms but work on any platform. On Apple platforms with SwiftUI/UIKit, prefer native components. On web or other stacks, copy the principles, not the exact look.

## How to use
1. Read "Core principles" and the section for what you are building.
2. Build with the rules and code hints.
3. Run the "Final checklist" before saying done. Fix every failure.
4. **The user's brand and instructions win over these rules.** If they conflict, follow the user and say so in one line.
5. Do not copy Apple trademarks, SF Pro font files, SF Symbols or app icons into a project unless the license allows it. Use system font stacks or open fonts.

## Core principles
- **Clarity**: each element has a clear job. Text is readable, icons are understood, nothing is decoration only.
- **Deference**: the UI steps back so content is the hero. Quiet chrome, restrained branding.
- **Depth**: layers (shadow, blur, motion) show what sits on top and what is interactive.
- **Hierarchy**: in two seconds the user sees what matters most, what is secondary, what is an action.
- **Consistency**: same thing looks and behaves the same everywhere. Prefer familiar patterns.
- **Accessibility**: designed in from the start for everyone, not added at the end.
- **User control**: people can cancel, undo and go back.
- **Feedback**: every tap or click gets a visible response.

## 1. Layout and spacing
- Use a 4px base scale: 4, 8, 12, 16, 20, 24, 32, 48, 64. No random values.
- Align to a grid. Related items close together, unrelated items further apart.
- Design mobile-first. Layout must hold from 320px phones to large monitors, portrait and landscape, and at 200% text size.
- Respect safe areas on phones: `viewport-fit=cover` and `env(safe-area-inset-*)`.
- Margins: 16px phone, 24px tablet. On desktop use a centered max-width container (about 1100-1280px) and keep text lines 60-75 characters.
- Put the primary content and action where the eye lands first. Keep controls near what they affect.
- One primary action per screen. If there are two, demote one.
- Use flexible layout (flex, grid, `clamp()`, `min()`) not fixed widths.

## 2. Typography
- System font stack by default:
  `font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", Inter, system-ui, "Segoe UI", Roboto, sans-serif;`
- Few text styles, no random sizes. Suggested scale (px): caption 12, footnote 13, body 16-17, headline 17 semibold, title3 20, title2 22, title1 28, large title 34.
- Apple's phone defaults: 17pt body, 11pt absolute minimum. On web keep body at 16px or more and avoid text under 12px.
- Hierarchy through size and weight. Thin weights need bigger sizes. Avoid thin weight on small text.
- Line height 1.4-1.6 for body, 1.1-1.3 for large titles.
- Use `rem`/`em`. Users must be able to enlarge text by at least 200% without clipping or overlap.
- Left-align body text (start-align for RTL). Center only short text.
- Prefer wrapping over truncation for important text.

## 3. Color
- Use semantic tokens, never raw hex in components: `--bg`, `--bg-elevated`, `--text`, `--text-secondary`, `--separator`, `--accent`, `--success`, `--warning`, `--danger`.
- One accent color for interactive things. Do not spend it on decoration.
- Contrast (WCAG AA): 4.5:1 for normal text, 3:1 for large text (18px+ or bold) and for UI parts like icons, input borders and focus rings.
- **Never use color alone** for meaning. Add an icon, shape or label (red/green and blue/orange are commonly confused).
- Support Dark Mode from day one with its own token values, not inverted colors. Check contrast in both light and dark. Offer higher contrast when `prefers-contrast: more`.
  ```css
  :root { color-scheme: light dark; --bg:#ffffff; --text:#1d1d1f; --accent:#0a66ff; }
  @media (prefers-color-scheme: dark) { :root { --bg:#000000; --text:#f5f5f7; --accent:#4d94ff; } }
  @media (prefers-contrast: more) { :root { --text:#000; } }
  ```
- Small palette: neutrals + 1 accent + 3-4 status colors. Brand color in logo, accent and key moments only.

## 3b. Controls, touch and interaction
- Hit target 44x44px (Apple default for touch). Absolute minimum about 28px. WCAG 2.2 floor is 24px. Desktop pointer UI can be about 28px. Android uses 48dp.
- Spacing matters as much as size: about 12px padding around bordered controls, about 24px around borderless ones.
- Every control needs states: default, hover (pointer only), focus-visible, pressed, disabled, loading. Focus ring 2-3px, 3:1 contrast.
- Buttons: one filled primary, secondary tinted/outlined, tertiary text. Verb labels ("Save", "Send message"), not "OK".
- Destructive actions: danger styling plus confirm or undo. Hard-to-recover actions deserve a second confirmation.
- Full keyboard support: logical Tab order, Enter/Space activate, Esc closes. Do not override system shortcuts.
- Gestures are shortcuts only. Always give a visible alternative (e.g. a delete button besides swipe-to-delete). Avoid complex multi-finger gestures.
- Do not hijack scroll, zoom, text selection or the back button.
- Avoid auto-dismissing UI on timers. Let people dismiss with an explicit action.
- Forms: visible labels (not placeholder only), correct `type`/`inputmode`, `autocomplete`, inline errors that say how to fix, keep entered data after an error.

## 4. Navigation and structure
- Phone: bottom tab bar (3-5 sections) plus back navigation. Tablet/desktop: sidebar or top nav. Content sites: simple top nav and clear footer.
- User always knows where they are, how they got there, how to go back. Highlight the current section.
- Sheets and modals only for short, focused tasks. Clear close/cancel. Do not stack them.
- Onboarding minimal. Ask permissions only when needed, with a one-line reason.

## 5. Materials and Liquid Glass
- Glass or blur belongs to the **control and navigation layer** that floats above content (tab bars, toolbars, sidebars, floating buttons). Not the content layer.
- Use it sparingly on custom controls. Overuse distracts from the content.
- Never stack glass on glass.
- Two flavors: *regular* (blurs and adjusts for legibility, use for text-heavy parts such as popovers, alerts, sidebars) and *clear* (very translucent, only over rich media like photos/video). For clear glass over bright media, add a dark dim layer of about 35% opacity.
- Legibility beats style. If transparency hurts text, use a more opaque surface.
- Put vibrant or high-contrast foreground colors on top of materials. Thicker material = better contrast for fine text. Thinner = more context.
- Provide a solid fallback for users who reduce transparency:
  ```css
  .glass { background: color-mix(in srgb, var(--bg) 70%, transparent); backdrop-filter: blur(20px) saturate(1.4); border: 1px solid rgb(255 255 255 / .18); }
  @media (prefers-reduced-transparency: reduce) { .glass { background: var(--bg-elevated); backdrop-filter: none; } }
  @supports not (backdrop-filter: blur(1px)) { .glass { background: var(--bg-elevated); } }
  ```
- Consistent, concentric corner radius (inner radius = outer radius minus padding). Soft, subtle shadows.

## 6. Icons and images
- One icon family and one stroke weight (SF Symbols on Apple platforms; Lucide, Phosphor or Material Symbols elsewhere). Do not mix styles.
- Match icon weight to nearby text. Standard sizes 16, 20, 24px. Label unfamiliar icons.
- Prefer SVG. Meaningful images get `alt`; decorative ones get `alt=""`.
- Images sharp on high-density screens, correct aspect ratio, lazy-loaded below the fold, no text baked into images.
- App icon: one simple focal shape, full-bleed square, no text, no photo.

## 7. Motion
- Motion explains cause and effect (where something came from, where it went). Never decoration only.
- 150-300ms for most transitions. Ease-out entering, ease-in leaving. Animate `transform` and `opacity`.
- Give instant feedback first (under 100ms), then animate.
- Respect Reduce Motion: replace movement with a fade, tighten springs, avoid animating depth/zoom and blurs.
  ```css
  @media (prefers-reduced-motion: reduce) {
    *, *::before, *::after { animation-duration: .01ms !important; animation-iteration-count: 1 !important; transition-duration: .01ms !important; scroll-behavior: auto !important; }
  }
  ```
- No flashing more than 3 times per second. Autoplay audio/video must have controls and be pausable.

## 8. UX writing
- Short, plain, active voice. Verb-first labels. Be consistent with capitalization.
- Errors: what happened, how to fix. Never blame the user. No bare error codes.
- Empty states: say what belongs here and offer one action.
- Inclusive language. Avoid idioms that do not translate. No ALL CAPS shouting.
- Prepare for localization: no hard-coded strings in layout, allow 30-40% longer text, support RTL with logical CSS (`margin-inline-start`, `padding-inline`, `text-align: start`), format dates, numbers and currency by locale.

## 9. Accessibility
- Semantic HTML first (`button`, `nav`, `main`, `label`, ordered headings). ARIA only to fill gaps.
- Every control has an accessible name. Icon-only buttons need `aria-label`. Announce changes with `aria-live`.
- Reading order matches visual order. Test main flows with a screen reader (VoiceOver, TalkBack, NVDA).
- Support: larger text, bold text, increased contrast, reduced motion, reduced transparency, dark mode, keyboard only, voice control (visible label matches accessible name).
- Do not depend on sound or color alone. Provide captions, transcripts and audio descriptions where relevant. Pair audio cues with visual (and haptic on mobile) cues.
- Keep actions simple; reduce complexity for everyone.
- For each key flow, switch on one accessibility feature (screen reader, large text, reduce motion) and confirm the flow can still be completed.

## 10. Privacy and trust
- Ask for permissions (camera, location, notifications, tracking) at the moment they are needed, with a plain reason. App still works if refused.
- Collect the least data possible. Easy sign-out and account deletion.
- Offer passkeys or "Sign in with" options. Do not force an account before showing value.
- No dark patterns: hidden cancel, fake urgency, pre-ticked consent.

## 11. Platform notes
- **iOS/iPadOS**: tab bar at bottom, large titles, sheets, swipe back, Dynamic Type, iPad multitasking, safe areas.
- **macOS**: menu bar, keyboard shortcuts for common actions, resizable windows, sidebar, context menus, smaller controls (about 28px).
- **tvOS/visionOS/watchOS**: glanceable, big targets (about 66px tvOS, 60px visionOS), focus or gaze input, comfortable ergonomics.
- **Web**: responsive, fast, works without hover, URL reflects state, back button works, no layout shift, honors system settings.
- **Android/cross-platform**: follow platform back behavior and navigation. Keep hierarchy, spacing and contrast principles. Targets 48dp.

## Reference snippets (copy and adapt)

Ready-to-use values. Rules above always win if they conflict with a snippet.

### Mobile-First Responsive Hierarchy
- Design the mobile viewport (`375px` - `390px`) first to establish pure essential priority.
- Expand outward fluidly:
  - **Compact (Mobile)** `< 768px`: Single-column, sticky navigation, bottom action sheets, full-width inputs.
  - **Medium (Tablet)** `768px - 1024px`: Split navigation, 2-column responsive cards, floating popovers.
  - **Expanded (Desktop)** `> 1024px`: Sidebar navigation, multi-column density, floating docks.

### Safe Areas & Viewport Boundaries
- Respect platform hardware boundaries: status bars, dynamic islands, camera cutouts, home indicator home bars, and browser chrome.
- On the web, always integrate CSS safe area environment variables:
  ```css
  .viewport-container {
    padding-top: env(safe-area-inset-top, 0px);
    padding-bottom: env(safe-area-inset-bottom, 0px);
    padding-left: env(safe-area-inset-left, 0px);
    padding-right: env(safe-area-inset-right, 0px);
  }
  ```

### Type Scale & Optical Hierarchy
Express all typography in `rem` units to automatically honor user accessibility font size preferences:

| Semantic Role | Size (`rem` / `px`) | Weight | Line Height | Tracking |
| :--- | :--- | :--- | :--- | :--- |
| **Large Title** | `2.125rem` (34px) | Bold (700) | 1.2 | `-0.022em` |
| **Title 1** | `1.75rem` (28px) | Bold (700) | 1.25 | `-0.019em` |
| **Title 2** | `1.375rem` (22px) | Bold (700) | 1.3 | `-0.015em` |
| **Title 3** | `1.25rem` (20px) | Semi-bold (600) | 1.35 | `-0.012em` |
| **Headline** | `1.0625rem` (17px) | Semi-bold (600) | 1.4 | `-0.01em` |
| **Body** | `1.0625rem` (17px) | Regular (400) | 1.5 | `-0.008em` |
| **Callout** | `1rem` (16px) | Regular (400) | 1.45 | `-0.005em` |
| **Subheadline** | `0.9375rem` (15px) | Regular (400) | 1.4 | `0em` |
| **Footnote** | `0.8125rem` (13px) | Regular (400) | 1.35 | `+0.005em` |
| **Caption 1** | `0.75rem` (12px) | Medium (500) | 1.3 | `+0.01em` |
| **Caption 2** | `0.6875rem` (11px) | Regular (400) | 1.3 | `+0.015em` |

*Golden Rule for Tracking*: The larger the display text, the tighter the negative letter-spacing (`-0.02em`). The smaller the footnote or caption, the wider the positive letter-spacing (`+0.01em`).

### Semantic Color Tokens
Never hardcode raw hexadecimal values into UI components. Map colors to semantic roles that automatically adapt between Light and Dark themes.

```css
:root {
  /* Canvas & Surfaces (Light) */
  --color-canvas: #ffffff;
  --color-canvas-secondary: #f2f2f7;
  --color-canvas-tertiary: #ffffff;
  --color-surface-elevated: #ffffff;

  /* Text & Labels (Light) */
  --color-text-primary: #000000;
  --color-text-secondary: rgba(60, 60, 67, 0.6);
  --color-text-tertiary: rgba(60, 60, 67, 0.3);
  --color-separator: rgba(60, 60, 67, 0.29);

  /* Accents & System Tints */
  --color-accent: #007aff;
  --color-accent-subtle: rgba(0, 122, 255, 0.12);
  --color-success: #34c759;
  --color-warning: #ff9500;
  --color-destructive: #ff3b30;
}

@media (prefers-color-scheme: dark) {
  :root {
    /* Canvas & Surfaces (Dark) */
    --color-canvas: #000000;
    --color-canvas-secondary: #1c1c1e;
    --color-canvas-tertiary: #2c2c2e;
    --color-surface-elevated: #1c1c1e;

    /* Text & Labels (Dark) */
    --color-text-primary: #ffffff;
    --color-text-secondary: rgba(235, 235, 245, 0.6);
    --color-text-tertiary: rgba(235, 235, 245, 0.3);
    --color-separator: rgba(84, 84, 88, 0.6);

    /* Accents & System Tints (Elevated Luminance) */
    --color-accent: #0a84ff;
    --color-accent-subtle: rgba(10, 132, 255, 0.2);
    --color-success: #30d158;
    --color-warning: #ffd60a;
    --color-destructive: #ff453a;
  }
}
```

### Glass Implementation & Reduced Transparency Fallback
```css
/* Standard Liquid Glass */
.liquid-glass {
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
  .liquid-glass {
    background-color: rgba(28, 28, 30, 0.75);
    border: 1px solid rgba(255, 255, 255, 0.12);
    box-shadow:
      0 1px 2px rgba(0, 0, 0, 0.4),
      0 16px 40px -4px rgba(0, 0, 0, 0.6),
      inset 0 1px 0.5px 0 rgba(255, 255, 255, 0.2);
  }
}

/* Fallback for Users Requesting Reduced Transparency */
@media (prefers-reduced-transparency: reduce) {
  .liquid-glass {
    background-color: var(--color-surface-elevated) !important;
    backdrop-filter: none !important;
    -webkit-backdrop-filter: none !important;
    border: 1px solid var(--color-separator) !important;
  }
}
```

### Reduced Motion Respect
Always respect accessibility preferences by immediately replacing positional motion with instant cross-fades:
```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

## Final checklist
- [ ] One clear primary action; hierarchy obvious at a glance
- [ ] Spacing from the scale; no overflow at 320px; works at 200% text
- [ ] Body text 16px+, contrast 4.5:1 (3:1 for large text and UI parts)
- [ ] Light and dark both checked; semantic tokens used
- [ ] Nothing communicated by color alone
- [ ] Targets 44px+ with spacing; focus ring visible; keyboard works
- [ ] States: hover, focus, pressed, disabled, loading, empty, error, success
- [ ] Reduced motion and reduced transparency handled; no flashing
- [ ] One icon family; images have alt and are sharp
- [ ] Copy short and verb-led; errors say how to fix
- [ ] Names/labels for screen readers; headings and landmarks correct
- [ ] Permissions asked in context; no dark patterns

## Official references
- HIG: https://developer.apple.com/design/human-interface-guidelines/
- Foundations: https://developer.apple.com/design/human-interface-guidelines/foundations
- Accessibility: https://developer.apple.com/design/human-interface-guidelines/accessibility
- Materials (Liquid Glass): https://developer.apple.com/design/human-interface-guidelines/materials
- Design resources: https://developer.apple.com/design/resources/
- SF Symbols: https://developer.apple.com/sf-symbols/
- What's new: https://developer.apple.com/design/whats-new/
- Meet Liquid Glass (video): https://developer.apple.com/videos/play/wwdc2025/219/
