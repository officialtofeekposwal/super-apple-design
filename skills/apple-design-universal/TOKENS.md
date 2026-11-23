# 🎨 Apple HIG Multi-Stack Design Tokens

> **Cross-Platform Implementation Guide**  
> Direct drop-in token definitions for **CSS/Web**, **Tailwind CSS v4**, **Flutter (Dart)**, and **SwiftUI (Swift)**.

---

## 1. Web & CSS Custom Properties

Include these semantic variables in your global stylesheet (e.g. `globals.css` or `theme.css`):

```css
:root {
  /* Canvas & Base Layers (Light) */
  --apple-canvas-primary: #FFFFFF;
  --apple-canvas-secondary: #F2F2F7;
  --apple-canvas-tertiary: #FFFFFF;
  --apple-surface-elevated: #FFFFFF;

  /* Typography & Labels (Light) */
  --apple-label-primary: #000000;
  --apple-label-secondary: rgba(60, 60, 67, 0.60);
  --apple-label-tertiary: rgba(60, 60, 67, 0.30);
  --apple-label-quaternary: rgba(60, 60, 67, 0.18);
  --apple-separator: rgba(60, 60, 67, 0.29);

  /* Semantic Accent Tints */
  --apple-blue: #007AFF;
  --apple-purple: #AF52DE;
  --apple-green: #34C759;
  --apple-red: #FF3B30;
  --apple-orange: #FF9500;
  --apple-yellow: #FFCC00;

  /* Touch & Squircle Radii */
  --apple-touch-min: 44px;
  --apple-radius-sm: 10px;
  --apple-radius-md: 14px;
  --apple-radius-lg: 20px;
  --apple-radius-xl: 28px;
  --apple-radius-full: 9999px;
}

@media (prefers-color-scheme: dark) {
  :root {
    /* Canvas & Base Layers (Dark) */
    --apple-canvas-primary: #000000;
    --apple-canvas-secondary: #1C1C1E;
    --apple-canvas-tertiary: #2C2C2E;
    --apple-surface-elevated: #1C1C1E;

    /* Typography & Labels (Dark) */
    --apple-label-primary: #FFFFFF;
    --apple-label-secondary: rgba(235, 235, 245, 0.60);
    --apple-label-tertiary: rgba(235, 235, 245, 0.30);
    --apple-label-quaternary: rgba(235, 235, 245, 0.18);
    --apple-separator: rgba(84, 84, 88, 0.65);

    /* Accents with Elevated Dark Mode Luminance */
    --apple-blue: #0A84FF;
    --apple-purple: #BF5AF2;
    --apple-green: #30D158;
    --apple-red: #FF453A;
    --apple-orange: #FF9F0A;
    --apple-yellow: #FFD60A;
  }
}
```

---

## 2. Tailwind CSS v4 Theme Extension

Add this configuration preset in your `tailwind.config.ts`:

```typescript
import type { Config } from 'tailwindcss';

const config: Config = {
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        apple: {
          canvas: {
            DEFAULT: 'var(--apple-canvas-primary)',
            secondary: 'var(--apple-canvas-secondary)',
            tertiary: 'var(--apple-canvas-tertiary)',
          },
          label: {
            primary: 'var(--apple-label-primary)',
            secondary: 'var(--apple-label-secondary)',
            tertiary: 'var(--apple-label-tertiary)',
          },
          tint: {
            blue: 'var(--apple-blue)',
            purple: 'var(--apple-purple)',
            green: 'var(--apple-green)',
            red: 'var(--apple-red)',
          }
        }
      },
      borderRadius: {
        'apple-sm': '10px',
        'apple-md': '14px',
        'apple-lg': '20px',
        'apple-xl': '28px',
      },
      minHeight: {
        'apple-touch': '44px',
      },
      minWidth: {
        'apple-touch': '44px',
      }
    }
  }
};
export default config;
```

---

## 3. Flutter (Dart) ThemeData Definition

```dart
import 'package:flutter/material.dart';

class AppleTheme {
  static const Color lightCanvas = Color(0xFFFFFFFF);
  static const Color lightSecondaryCanvas = Color(0xFFF2F2F7);
  static const Color darkCanvas = Color(0xFF000000);
  static const Color darkSecondaryCanvas = Color(0xFF1C1C1E);

  static const Color appleBlue = Color(0xFF007AFF);
  static const Color appleBlueDark = Color(0xFF0A84FF);

  static const double minTouchTarget = 44.0;
  static const BorderRadius radiusMedium = BorderRadius.all(Radius.circular(14.0));
  static const BorderRadius radiusLarge = BorderRadius.all(Radius.circular(20.0));

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightCanvas,
    colorScheme: const ColorScheme.light(
      primary: appleBlue,
      surface: lightSecondaryCanvas,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkCanvas,
    colorScheme: const ColorScheme.dark(
      primary: appleBlueDark,
      surface: darkSecondaryCanvas,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
```

---

## 4. SwiftUI (Native iOS/macOS)

```swift
import SwiftUI

public extension Color {
    static let appleCanvas = Color(UIColor.systemBackground)
    static let appleSecondaryCanvas = Color(UIColor.secondarySystemBackground)
    static let appleLabel = Color(UIColor.label)
    static let appleSecondaryLabel = Color(UIColor.secondaryLabel)
    static let appleTint = Color.accentColor
}

public struct AppleTouchBounds: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .frame(minWidth: 44, minHeight: 44)
            .contentShape(Rectangle())
    }
}

public extension View {
    func appleTouchTarget() -> some View {
        modifier(AppleTouchBounds())
    }
}
```
