# 🔮 Liquid Glass GLSL & Skia Shaders

> **Fragment shaders for WebGL, Three.js, React Three Fiber, and Skia (Flutter / React Native Skia)**

---

## 1. WebGL / GLSL Fragment Shader (Liquid Glass Refraction)

```glsl
precision highp float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform sampler2D u_texture;

varying vec2 v_uv;

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    
    // Calculate distance to cursor for interactive specular sheen
    vec2 mouseNorm = u_mouse / u_resolution.xy;
    float dist = distance(uv, mouseNorm);
    float highlight = smoothstep(0.4, 0.0, dist) * 0.15;
    
    // Subtle normal map refraction distortion
    vec2 offset = vec2(sin(uv.y * 10.0 + u_time) * 0.002, cos(uv.x * 10.0 + u_time) * 0.002);
    vec4 texColor = texture2D(u_texture, uv + offset);
    
    // Color grading: boost saturation and blend glass tint
    vec3 glassTint = vec3(1.0, 1.0, 1.0);
    vec3 finalColor = mix(texColor.rgb, glassTint, 0.25) + vec3(highlight);
    
    gl_FragColor = vec4(finalColor, 0.85);
}
```

---

## 2. Flutter / Skia AGSL Runtime Shader

```dart
// Flutter 3.x+ ImageFilter.shader runtime AGSL snippet
const String kLiquidGlassShader = '''
uniform float2 uResolution;
uniform float uTime;
uniform shader uTexture;

half4 main(float2 fragCoord) {
    float2 uv = fragCoord / uResolution;
    
    // Specular border gradient
    float edge = step(0.01, uv.y) * step(uv.y, 0.99) * step(0.01, uv.x) * step(uv.x, 0.99);
    float border = 1.0 - edge;
    
    half4 color = uTexture.eval(fragCoord);
    half4 glassColor = half4(color.rgb * 1.15 + (border * 0.3), 0.80);
    return glassColor;
}
''';
```
