# 🚀 Apple Design 20-Point Pre-Flight Shipping Checklist

> **Mandatory Quality Gate**: No agent or engineer may mark an interface, feature, or pull request as "complete" or "ready to ship" without passing all 20 verification criteria.

---

## 📐 I. Layout, Touch & Spacing
- [ ] **1. 4px Rhythm**: All margins, paddings, and heights align to the 4px scale (`4, 8, 12, 16, 20, 24, 32, 48, 64px`).
- [ ] **2. 44px Touch Bounds**: Every clickable button, icon link, tab, and input provides at least `44x44px` hit area.
- [ ] **3. Safe Area Insets**: Hardware notches, home indicators, and system navigation bars are properly padded using `env(safe-area-inset-*)`.
- [ ] **4. Zero Horizontal Scroll**: Layout is fully contained at `320px`, `375px`, `768px`, and `1280px` viewports without accidental overflow.
- [ ] **5. Optical Balance**: Icons are visually centered relative to adjacent text baselines, using square bounding boxes.

---

## 🔤 II. Typography & Contrast
- [ ] **6. System Font Stack**: Uses native operating system typography (`-apple-system`, `SF Pro`, `Inter`, `system-ui`).
- [ ] **7. Optical Tracking Rules**: Large titles (`> 28px`) use negative tracking (`-0.02em`); small captions (`< 13px`) use positive tracking (`+0.01em`).
- [ ] **8. WCAG AA Contrast**: Normal text satisfies $\ge$ 4.5:1; display text and UI controls satisfy $\ge$ 3.0:1 in both Light and Dark modes.
- [ ] **9. No Color Alone**: Status, errors, and validation states always pair color changes with an icon or clear text label.
- [ ] **10. 200% Zoom Compatibility**: Text reflows cleanly and remains fully readable when browser font scaling is set to 200%.

---

## 🧊 III. Materials, Glass & Elevation
- [ ] **11. Control Layer Exclusivity**: Liquid Glass is placed only on navigation headers, tab bars, sheets, and floating control docks.
- [ ] **12. Zero Glass-on-Glass**: No translucent surface is stacked directly over another translucent surface.
- [ ] **13. Specular Border Framing**: Every glass surface features a 1px continuous border with inset specular light reflection.
- [ ] **14. Reduced Transparency Fallback**: Solid opaque fallback (`@media (prefers-reduced-transparency: reduce)`) is implemented and verified.
- [ ] **15. Shadow Elevation Layering**: Shadows are diffused and natural, never harsh black silhouettes.

---

## 🏃 IV. Motion, States & Accessibility
- [ ] **16. Apple Spring Physics**: Transitions use natural spring curves (`cubic-bezier(0.25, 0.1, 0.25, 1)`) within `150ms-350ms`.
- [ ] **17. Complete 5-State Coverage**: All interactive controls define `default`, `hover`, `active (scale: 0.97)`, `focus-visible`, and `disabled`.
- [ ] **18. Reduced Motion Respect**: `@media (prefers-reduced-motion: reduce)` replaces all positional shifts with instant fades.
- [ ] **19. Keyboard Navigation**: Every action is fully reachable and executable via `Tab`, `Shift+Tab`, `Enter`, and `Space`.
- [ ] **20. Brand Overrides Intact**: The user's custom brand identity, bespoke colors, and tone have taken priority without being overwritten by generic defaults.
