# Install in Antigravity

**Hinglish me:** Pehle `<your-username>` ko apne GitHub username se badlo. Phir neeche wala English prompt Antigravity me paste karo. Wo repo clone karega, skills install karega, aur check karega ki dono SKILL.md maujood hain. Antigravity abhi sirf 3 design directions dikhayega, kuch build nahi karega.

## Prompt

```
Clone https://github.com/<your-username>/super-design-skills.git into a new folder outside my current project.
Read README.md first. Then, from my project folder, run the installer from the cloned repo:
  chmod +x install.sh && ./install.sh --target antigravity --project --with-upstream
If any upstream repo cannot be cloned, tell me which one and continue with the rest.
After install, list the folders inside .agent/skills/ and confirm that apple-design-universal and design-workflow each contain a SKILL.md.
Then test: "Use design-workflow. Suggest 3 design directions for a simple landing page for a book review website." Show only the 3 directions. Do not build anything yet.
```

## Fallback: skills folder is different

**Hinglish me:** Agar skills nahi dikh rahe, to Antigravity ke is version me folder alag ho sakta hai. Ye prompt do:

```
Find where this version of Antigravity loads workspace skills from (check its docs or settings). Copy the folders skills/apple-design-universal and skills/design-workflow from the super-design-skills repo into that location, restart the agent session, and confirm both skills appear.
```

## Option: install for all projects (global)

**Hinglish me:** Har project me chahiye to ye prompt do. Skills `~/.gemini/antigravity/skills/` me jayenge.

```
Clone https://github.com/<your-username>/super-design-skills.git into ~/.super-design-skills-repo.
Run: cd ~/.super-design-skills-repo && bash install.sh --target antigravity --global --with-upstream
Confirm that ~/.gemini/antigravity/skills/apple-design-universal/SKILL.md and ~/.gemini/antigravity/skills/design-workflow/SKILL.md exist.
```
