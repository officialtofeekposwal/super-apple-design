# 🍎 SwiftUI Native Component Patterns

> **Production patterns for iOS 18+, macOS 15+, and visionOS using native SwiftUI and materials**

---

## 1. Apple Floating Glass Dock / Bar

```swift
import SwiftUI

public struct AppleFloatingDock<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        HStack(spacing: 16) {
            content
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial, in: Capsule())
        .overlay(
            Capsule()
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.12), radius: 20, x: 0, y: 8)
    }
}
```

---

## 2. Interactive Spring Button

```swift
import SwiftUI

public struct AppleHapticButton: View {
    let title: String
    let icon: String?
    let action: () -> Void

    public init(_ title: String, icon: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button(action: {
            #if os(iOS)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            #endif
            action()
        }) {
            HStack(spacing: 8) {
                if let icon {
                    Image(systemName: icon)
                }
                Text(title)
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(minHeight: 44)
            .padding(.horizontal, 24)
            .background(Color.accentColor, in: Capsule())
            .shadow(color: Color.accentColor.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(AppleSpringButtonStyle())
    }
}

public struct AppleSpringButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.65), value: configuration.isPressed)
    }
}
```
