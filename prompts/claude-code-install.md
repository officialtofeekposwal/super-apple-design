# 🤖 Claude Code Setup Guide: Super Apple Design

> **How to install, activate, and use Super Apple Design in Claude Code CLI**

---

## 1. Quick One-Line Setup
In your terminal, navigate to your project and run:

```bash
# Clone the repository
git clone https://github.com/officialtofeekposwal/super-apple-design.git /tmp/super-apple-design

# Run installer for Claude Code
bash /tmp/super-apple-design/scripts/install.sh --target claude --global
```

Restart Claude Code, then type `/` to see `apple-design-universal` and `design-workflow` loaded.

---

## 2. Using in Claude Code Chat

Whenever you ask Claude Code to design or code a web app or component, use this prompt:

```markdown
Use the design-workflow and apple-design-universal skills.
I want to build a landing page for my product.
Execute Phase 1 (Direction) first: analyze my domain and suggest 3 high-contrast creative directions before writing any code.
```

Claude will automatically follow the 4-phase production engine, enforce the 44px touch targets, apply authentic Liquid Glass CSS on the control layer, and run the 20-point checklist before marking the work done.
