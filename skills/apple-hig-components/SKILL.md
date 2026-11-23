---
name: apple-hig-components
description: Universal component blueprints adhering strictly to Apple Human Interface Guidelines. Provides architecture, behavior patterns, state machines, and code recipes for Navigation Bars, Segmented Controls, Floating Docks, Glass Cards, Modal Sheets, and Action Buttons across Web, Mobile, and Desktop.
---

# 🧩 Apple HIG Component Blueprints & Architecture

> **Stack-neutral component blueprints with complete interactive states and tactile feedback.**

---

## 🔘 1. Apple Action Button (`AppleButton`)

### Ergonomics & States:
- **Minimum Target Bounds**: Always $\ge 44\times 44\text{px}$ (or $44\text{pt}$).
- **Corner Radius**: Pill shape (`9999px`) or continuous squircle (`12px` to `14px`).
- **Tactile Feedback**:
  - `Hover`: Subtle luminance increase (+5% brightness).
  - `Active/Pressed`: Immediate spring compression (`scale(0.97)`).
  - `Focus-Visible`: 2px accent outline ring with 2px offset.
  - `Disabled`: Opacity reduced to `0.38`, non-interactive (`pointer-events: none`).

---

## 🎛️ 2. Apple Segmented Control (`AppleSegmentedControl`)

### Behavior & Physics:
- A horizontal container with a continuous background surface (`--apple-canvas-secondary`).
- An active sliding thumb pill with realistic elevation shadow (`0 2px 8px rgba(0,0,0,0.12)`).
- When switching tabs, the thumb moves with spring physics (`stiffness: 420, damping: 30`).
- Text in the active tab is bold and primary; inactive tabs are secondary with hover feedback.

---

## 🧭 3. Apple Navigation Bar (`AppleNavigationBar`)

### Structural Rules:
- **Collapsible Large Title**: Starts with `34pt` Bold title. Upon upward scroll, it transitions smoothly into a compact `17pt` Semi-bold centered title.
- **Surface Material**: Liquid Glass with `backdrop-filter: blur(25px)` and specular bottom hairline separator (`1px solid var(--apple-separator)`).
- **Navigation Actions**: Left action reserved for "Back" navigation or "Cancel". Right action reserved for primary actions (e.g. "Save", "Edit", "Done").

---

## 📜 4. Apple Modal Sheet (`AppleModalSheet`)

### Interaction Physics:
- Slides up from the bottom of the viewport with gentle spring damping (`stiffness: 240, damping: 28`).
- Dims the background canvas behind it (`rgba(0, 0, 0, 0.4)`).
- Features a top-centered grab handle pill (`36px x 5px`, rounded full, secondary label tint).
- Dismissible via downward drag gesture or explicit top-right "Done" button.

---

## 💻 Stack Implementations:
- **React 19 + Tailwind v4**: [web-react-tailwind.md](web-react-tailwind.md)
- **Flutter & Jetpack Compose**: [flutter-compose.md](flutter-compose.md)
- **SwiftUI Native**: [swiftui-native.md](swiftui-native.md)
