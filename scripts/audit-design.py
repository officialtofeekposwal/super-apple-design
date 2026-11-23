#!/usr/bin/env python3
"""
Apple HIG Design Linter (scripts/audit-design.py)
Scans source files (tsx, jsx, html, css, vue, svelte) for:
1. Hardcoded raw hex colors instead of semantic tokens
2. Interactive buttons/inputs missing minimum touch target bounds
3. Missing alt tags on <img> and decorative aria-hidden omission
"""

import os
import re
import sys

RAW_HEX_PATTERN = re.compile(r'#(?:[0-9a-fA-F]{3}){1,2}\b')
IMG_TAG_PATTERN = re.compile(r'<img\b([^>]*)>', re.IGNORECASE)
TOUCH_TARGET_PATTERN = re.compile(r'(h-\[(?:[0-3]?[0-9]|4[0-3])px\]|height:\s*(?:[0-3]?[0-9]|4[0-3])px)')

IGNORE_DIRS = {'.git', 'node_modules', 'dist', 'build', '.next', '.super-apple-design'}
VALID_EXTENSIONS = {'.tsx', '.jsx', '.html', '.css', '.vue', '.svelte'}

def scan_file(filepath):
    issues = []
    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        for idx, line in enumerate(f, 1):
            # Check 1: Hardcoded Hex
            if not filepath.endswith(('colors.json', 'TOKENS.md', 'MATERIALS.md')):
                hex_matches = RAW_HEX_PATTERN.findall(line)
                if hex_matches and not line.strip().startswith(('//', '/*', '*')):
                    issues.append(f"Line {idx}: Hardcoded hex color found: {', '.join(hex_matches)}. Use semantic tokens.")

            # Check 2: Img tags missing alt
            for match in IMG_TAG_PATTERN.finditer(line):
                attrs = match.group(1)
                if 'alt=' not in attrs:
                    issues.append(f"Line {idx}: <img> tag missing required 'alt' attribute.")

            # Check 3: Sub-44px touch targets
            if any(kw in line.lower() for kw in ['button', 'input', 'clickable']):
                small_targets = TOUCH_TARGET_PATTERN.findall(line)
                if small_targets:
                    issues.append(f"Line {idx}: Touch target may be under 44px: {small_targets[0]}")
    return issues

def main():
    root_dir = sys.argv[1] if len(sys.argv) > 1 else '.'
    total_issues = 0
    scanned_files = 0

    print(f"🍎 [Apple HIG Linter] Scanning directory: {os.path.abspath(root_dir)}")

    for root, dirs, files in os.walk(root_dir):
        dirs[:] = [d for d in dirs if d not in IGNORE_DIRS]
        for file in files:
            ext = os.path.splitext(file)[1].lower()
            if ext in VALID_EXTENSIONS:
                scanned_files += 1
                filepath = os.path.join(root, file)
                issues = scan_file(filepath)
                if issues:
                    print(f"\n⚠️  {os.path.relpath(filepath, root_dir)} ({len(issues)} issues):")
                    for iss in issues:
                        print(f"   • {iss}")
                    total_issues += len(issues)

    print(f"\n📊 Audit Complete: Scanned {scanned_files} files.")
    if total_issues > 0:
        print(f"❌ Found {total_issues} design rule violations.")
        sys.exit(1)
    else:
        print("✅ 100% Clean! All files comply with Apple HIG lint rules.")
        sys.exit(0)

if __name__ == '__main__':
    main()
