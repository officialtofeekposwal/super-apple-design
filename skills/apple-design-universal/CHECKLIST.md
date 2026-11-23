# 🚀 Apple Design & Hallmark 3-Tier Pre-Flight Shipping Checklist

> **Mandatory Quality Gate**: No agent or engineer may mark an interface, feature, or pull request as "complete" or "ready to ship" without passing all Tier 1 (Floor) and Tier 2 (Reflex) criteria.

---

## 🛑 Tier 1: Floor Gates (Non-Negotiable · Never Ships)
*A single violation halts deployment immediately.*
- [ ] **1. WCAG AA Contrast**: Normal text satisfies $\ge$ 4.5:1; display text and UI controls satisfy $\ge$ 3.0:1 in both Light and Dark modes.
- [ ] **2. Visible Keyboard Focus**: Distinct `:focus-visible` ring on every clickable and focusable element (`Tab` / `Shift+Tab`).
- [ ] **3. 44px Hit Bounds**: Every clickable button, link, icon action, and input provides at least `44x44px` physical touch area.
- [ ] **4. Zero Horizontal Scroll**: Layout is strictly contained at `320px`, `375px`, `768px`, and `1280px` viewports without accidental sideways overflow.
- [ ] **5. Accessibility Fallbacks**: Both `@media (prefers-reduced-motion: reduce)` and `@media (prefers-reduced-transparency: reduce)` are verified and functional.
- [ ] **6. Safe Area Insets**: Hardware notches, home bars, and dynamic status bars use `env(safe-area-inset-*)`.
- [ ] **7. Truth in Product**: Zero fabricated numbers, invented testimonials, or fake placeholder statistics.

---

## 🚫 Tier 2: Reflex Gates (Hallmark Anti-AI-Slop Checks)
*Eliminates the 7 machine-generated tells that give AI away.*
- [ ] **8. No Default Purple Gradient**: Prohibit generic `from-purple-600 to-indigo-600` backgrounds. Use authentic semantic palettes or locked project tokens.
- [ ] **9. No Gratuitous Eyebrows**: Prohibit decorative all-caps pill badges floating above every section heading unless communicating functional metadata.
- [ ] **10. No Widely Tracked Caps**: Prohibit unnatural `tracking-widest uppercase` microcopy (`W I D E L Y  S P A C E D`).
- [ ] **11. No Single-Colored Headline Word**: Prohibit coloring exactly one word in a headline with primary accent (`<span class="text-blue-500">word</span>`).
- [ ] **12. No Empty Bento Box Frames**: Prohibit grids of decorative cards containing placeholder icons, generic buzzwords, or missing functionality.
- [ ] **13. Hero Lands Message**: The hero section clearly communicates the product's job and fits its viewport without awkward cropping.
- [ ] **14. Functional Forms Only**: Prohibit dummy newsletter signup or contact forms that fail to submit or display fake success toasts without backend handling.

---

## ✨ Tier 3: Finish Gates (Apple HIG Tactile Craft)
*Fine-tuning craftsmanship and harmonic physics.*
- [ ] **15. 4px Rhythm**: All margins, paddings, and heights align to the 4px base scale (`4, 8, 12, 16, 20, 24, 32, 48, 64px`).
- [ ] **16. System Typography & Optical Tracking**: Native font stacks (`-apple-system`, `SF Pro`, `Inter`); large titles (`> 28px`) use negative tracking (`-0.02em`), captions use positive tracking (`+0.01em`).
- [ ] **17. Continuous Squircles**: Card borders and modal sheets use Apple continuous squircle curvature (`corner-smoothing: 60%`).
- [ ] **18. Control Layer Exclusivity**: Liquid Glass is placed only on navigation headers, tab bars, sheets, and floating control docks (never glass-on-glass).
- [ ] **19. Specular Border Framing**: Every glass surface features a 1px border with inset specular light reflection.
- [ ] **20. Apple Spring Physics**: Dynamic interactions use harmonic spring curves (`cubic-bezier(0.25, 0.1, 0.25, 1)`) within `150ms-350ms`.
- [ ] **21. Complete 5-State Coverage**: All interactive controls define `default`, `hover`, `active (scale: 0.97)`, `focus-visible`, and `disabled`.
- [ ] **22. Brand Overrides Intact**: The user's custom brand identity, bespoke colors, and guidelines have priority over generic defaults.
