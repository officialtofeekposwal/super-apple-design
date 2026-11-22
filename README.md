# Super Apple Design

A universal design skill pack for AI coding tools (Claude Code, Antigravity, Cursor, Codex and others). It helps the agent build any website, web app or software UI with strong design and accessibility, by combining:

| Piece | What it does |
|---|---|
| `apple-design-universal` | Apple Human Interface Guidelines, rewritten as stack-neutral rules: layout, type, color, dark mode, accessibility, motion, Liquid Glass, forms, UX writing, final checklist |
| `design-workflow` | Master workflow with 4 phases: **Direction, Build, Test, Review**. Calls helper skills when installed |
| 7 upstream skills | Taste Skill, designlang, React Bits, GSAP Skills, Playwright CLI, Impeccable, transitions.dev. Fetched by `install.sh` from their original repos |

The 7 upstream skills belong to their authors. This repo does not copy their code. See `CREDITS.md`.

## Quick install

```bash
git clone https://github.com/officialtofeekposwal/super-apple-design.git
cd super-apple-design
chmod +x install.sh

# Claude Code, all projects
./install.sh --target claude --global --with-upstream

# Antigravity, current project
./install.sh --target antigravity --project

# Cursor rule, current project
./install.sh --target cursor

# Everything
./install.sh --target all --project --with-upstream
```

Options: `--target claude|antigravity|cursor|all`, `--project|--global`, `--with-upstream`, `--dry-run`, `--help`.
Use `--dry-run` first to see what would happen. Restart your tool after install, then type `/` to see the skills.

## Where files go

| Tool | Global | Project |
|---|---|---|
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Antigravity | `~/.gemini/antigravity/skills/` | `.agent/skills/` |
| Cursor | n/a | `.cursor/rules/apple-design.mdc` |
| Codex, Gemini CLI, others | n/a | copy `AGENTS.md` to the project root |

Antigravity folders can change between versions. If skills do not appear, use the fallback prompt in `prompts/antigravity-install.md`.

## How to use

Build something:
```
Use design-workflow. Build a landing page for [business].
Suggest 3 design directions first, pick the best, then build, test with Playwright, and review.
```

Review an existing page:
```
Use apple-design-universal. Review this page against the final checklist and fix every failure.
```

## The 4-phase workflow

1. **Direction**: 3 options, pick one, lock design tokens.
2. **Build**: mobile-first, semantic tokens, motion only where it helps.
3. **Test**: Playwright on every page, screenshots at 375, 768 and 1280px, light and dark.
4. **Review**: critique, fix Critical and Important issues, run the final checklist.

Direction first, then design. Not "quick build".

## Example prompts per phase

```
Phase 1: Use design-workflow and apple-design-universal. I am building a landing page for [business].
         Suggest 3 high-contrast design directions. Do not write code yet.
Phase 2: Go with direction 2. Build the responsive nav and hero (44px targets, system fonts, glass on controls only).
Phase 3: Run Playwright on localhost:3000. Screenshot 375, 768 and 1280px in light and dark. Report overflow or contrast bugs.
Phase 4: Review against the final checklist. Fix all Critical and Important issues.
```

## Install the upstream skills by hand

Some of them are libraries or CLIs, not skill folders. In Claude Code paste the repo link and this line:

```
<repo link>
Install this skill, then confirm it works.
```

Suggested order: Taste Skill, Impeccable, then designlang, React Bits, GSAP Skills, Playwright CLI and transitions.dev as needed. All links are in `skills.json`.

## Repo layout

```
super-apple-design/
  skills/
    apple-design-universal/SKILL.md
    design-workflow/SKILL.md
  cursor/rules/apple-design.mdc
  prompts/antigravity-install.md
  skills.json
  install.sh
  AGENTS.md
  CREDITS.md
  LICENSE
  .gitignore
  README.md
```

## Notes

- Take inspiration from other sites, never copy their brand, logo or assets.
- Do not commit tokens or API keys.
- Never invent statistics or testimonials. Use realistic placeholders or ask for real copy.
- Apple, SF Pro, SF Symbols and Liquid Glass are trademarks of Apple Inc. This project is not affiliated with Apple, Anthropic or any skill author.

## License

MIT for the files in this repo (see `LICENSE`). Upstream skills keep their own licenses.
