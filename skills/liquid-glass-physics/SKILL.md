---
name: liquid-glass-physics
description: Specialized physics and shader engine for authentic Apple Liquid Glass and tactile spring responses. Defines exact cubic-bezier spring curves, mass-damping parameters, WebGL/Skia shaders, and accessibility fallbacks.
---

# 🌊 Apple Liquid Glass & Tactile Physics

> **Mathematical formulas, spring curves, and shader matrices that turn sterile screens into physical, tactile glass surfaces.**

---

## 1. Apple Spring Physics Curves

Never use linear or standard ease-in-out easing curves for interactive UI. Apple interfaces are driven by harmonic oscillator spring physics with mass, stiffness, and damping ratio:

| Interaction Role | CSS Transition Curve | Duration | Equivalent Spring Config |
| :--- | :--- | :--- | :--- |
| **Buttons / Toggles** | `cubic-bezier(0.175, 0.885, 0.32, 1.275)` | `200ms` | `{ stiffness: 450, damping: 28, mass: 0.8 }` |
| **Segmented Thumb** | `cubic-bezier(0.25, 1, 0.5, 1)` | `240ms` | `{ stiffness: 420, damping: 30, mass: 0.9 }` |
| **Modal Sheet Entrance** | `cubic-bezier(0.32, 0.72, 0, 1)` | `350ms` | `{ stiffness: 240, damping: 28, mass: 1.0 }` |
| **visionOS Spatial Hover** | `cubic-bezier(0.22, 1, 0.36, 1)` | `300ms` | `{ stiffness: 180, damping: 22, mass: 1.2 }` |

---

## 2. Liquid Glass Backdrop Pipeline

To produce the authentic depth of Apple Liquid Glass without blur halos:
1. **Saturation Boost**: Standard blur washes out vibrant colors. You must always boost saturation by `180%` to `190%` alongside Gaussian blur:
   ```css
   backdrop-filter: blur(25px) saturate(190%);
   -webkit-backdrop-filter: blur(25px) saturate(190%);
   ```
2. **Specular Top Highlight**: Glass surfaces catch ambient top-down light. Simulate this with an inset hairline:
   ```css
   box-shadow: 
     0 1px 2px rgba(0, 0, 0, 0.04),
     0 12px 32px -4px rgba(0, 0, 0, 0.08),
     inset 0 1px 1px 0 rgba(255, 255, 255, 0.85);
   ```
3. **Continuous Squircle Mask**: Always combine with squircle curvature (`corner-smoothing: 60%` or SVG masks) to avoid sharp circular corners.

---

## 3. Shader Recipes & Custom Shaders
See [SHADERS.md](SHADERS.md) for GLSL fragment shaders and Skia shader code.
