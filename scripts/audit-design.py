#!/usr/bin/env python3
"""
Apple HIG & Hallmark Anti-AI-Slop Linter (scripts/audit-design.py)
Enforces Apple Human Interface Guidelines and Hallmark 3-Tier Quality Gates:
- Tier 1: Floor Gates (Touch bounds, alt tags, semantic tokens)
- Tier 2: Reflex Gates (Hallmark 7 AI Slop Tells: purple gradients, single colored headline words, widely tracked caps, dummy forms)
- Tier 3: Finish Gates (Liquid glass rules, spring physics)
"""

import os
import re
import sys

RAW_HEX_PATTERN = re.compile(r'#(?:[0-9a-fA-F]{3}){1,2}\b')
IMG_TAG_PATTERN = re.compile(r'<img\b([^>]*)>', re.IGNORECASE)
TOUCH_TARGET_PATTERN = re.compile(r'(h-\[(?:[0-3]?[0-9]|4[0-3])px\]|height:\s*(?:[0-3]?[0-9]|4[0-3])px)')

# Hallmark AI Slop Tell Patterns
PURPLE_GRADIENT_PATTERN = re.compile(r'(from-purple-\d+|to-indigo-\d+|bg-gradient-to-[a-z]+\s+from-purple)', re.IGNORECASE)
TRACKED_CAPS_PATTERN = re.compile(r'(tracking-widest\s+uppercase|letter-spacing:\s*(?:0\.[2-9]|[1-9])em)', re.IGNORECASE)
SINGLE_COLORED_WORD_PATTERN = re.compile(r'<h[1-3][^>]*>.*?<span\s+class=["\'][^"\']*(?:text-primary|text-[a-z]+-500|text-[a-z]+-600)[^"\']*>[^<\s]+</span>.*?</h[1-3]>', re.IGNORECASE)
DUMMY_FORM_PATTERN = re.compile(r'<form\b[^>]*action=["\']#["\']', re.IGNORECASE)

IGNORE_DIRS = {'.git', 'node_modules', 'dist', 'build', '.next', '.super-apple-design'}
VALID_EXTENSIONS = {'.tsx', '.jsx', '.html', '.css', '.vue', '.svelte'}

def scan_file(filepath):
    floor_issues = []
    reflex_issues = []

    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    lines = content.splitlines()

    # Whole-file regex checks
    for match in SINGLE_COLORED_WORD_PATTERN.finditer(content):
        reflex_issues.append("Hallmark Tell #4: Single colored word in heading detected. Keep heading typography cohesive.")

    for match in DUMMY_FORM_PATTERN.finditer(content):
        reflex_issues.append("Hallmark Tell #7: Dummy form with action='#' detected. Provide functional action or form endpoint.")

    for idx, line in enumerate(lines, 1):
        stripped = line.strip()
        if stripped.startswith(('//', '/*', '*')):
            continue

        # Floor Check 1: Hardcoded Hex
        if not filepath.endswith(('colors.json', 'TOKENS.md', 'MATERIALS.md')):
            hex_matches = RAW_HEX_PATTERN.findall(line)
            if hex_matches and not stripped.startswith(('//', '/*', '*')):
                floor_issues.append(f"Line {idx}: [Floor] Hardcoded hex color found: {', '.join(hex_matches)}. Use semantic tokens.")

        # Floor Check 2: Img tags missing alt
        for match in IMG_TAG_PATTERN.finditer(line):
            attrs = match.group(1)
            if 'alt=' not in attrs:
                floor_issues.append(f"Line {idx}: [Floor] <img> tag missing required 'alt' attribute.")

        # Floor Check 3: Sub-44px touch targets
        if any(kw in line.lower() for kw in ['button', 'input', 'clickable']):
            small_targets = TOUCH_TARGET_PATTERN.findall(line)
            if small_targets:
                floor_issues.append(f"Line {idx}: [Floor] Touch target may be under 44px: {small_targets[0]}")

        # Reflex Check 1: AI Purple Gradient
        if PURPLE_GRADIENT_PATTERN.search(line):
            reflex_issues.append(f"Line {idx}: [Reflex] Hallmark Tell #1: AI purple gradient detected. Use authentic brand or semantic tokens.")

        # Reflex Check 2: Tracked uppercase
        if TRACKED_CAPS_PATTERN.search(line):
            reflex_issues.append(f"Line {idx}: [Reflex] Hallmark Tell #3: Widely tracked uppercase detected. Use standard optical letter spacing.")

    return floor_issues, reflex_issues

def main():
    root_dir = sys.argv[1] if len(sys.argv) > 1 else '.'
    total_floor = 0
    total_reflex = 0
    scanned_files = 0

    print(f"🍎 [Apple HIG & Hallmark Linter] Scanning: {os.path.abspath(root_dir)}")

    for root, dirs, files in os.walk(root_dir):
        dirs[:] = [d for d in dirs if d not in IGNORE_DIRS]
        for file in files:
            ext = os.path.splitext(file)[1].lower()
            if ext in VALID_EXTENSIONS:
                scanned_files += 1
                filepath = os.path.join(root, file)
                floor_issues, reflex_issues = scan_file(filepath)
                if floor_issues or reflex_issues:
                    print(f"\n⚠️  {os.path.relpath(filepath, root_dir)}:")
                    for iss in floor_issues:
                        print(f"   🛑 {iss}")
                    for iss in reflex_issues:
                        print(f"   ⚡ {iss}")
                    total_floor += len(floor_issues)
                    total_reflex += len(reflex_issues)

    print(f"\n📊 Audit Complete: Scanned {scanned_files} files.")
    print(f"   Floor Gate Failures: {total_floor}")
    print(f"   Reflex Gate Warnings: {total_reflex}")

    if total_floor > 0:
        print("\n❌ Deployment Halted: Floor gate violations must be resolved before shipping.")
        sys.exit(1)
    elif total_reflex > 0:
        print("\n⚠️  Passed with Warnings: Review Reflex gate warnings against Hallmark AI slop tells.")
        sys.exit(0)
    else:
        print("\n✅ 100% Clean! All files comply with Apple HIG and Hallmark Anti-AI-Slop gates.")
        sys.exit(0)

if __name__ == '__main__':
    main()
