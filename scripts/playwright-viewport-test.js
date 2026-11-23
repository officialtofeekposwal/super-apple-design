#!/usr/bin/env node
/**
 * Headless Multi-Viewport Screenshot Runner
 * Captures 6 essential states (3 viewports x 2 color schemes)
 */

const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const TARGET_URL = process.argv[2] || 'http://localhost:3000';
const OUTPUT_DIR = path.join(process.cwd(), 'playwright-screenshots');

const VIEWPORTS = [
  { name: 'mobile', width: 375, height: 812 },
  { name: 'tablet', width: 768, height: 1024 },
  { name: 'desktop', width: 1280, height: 800 },
];

const THEMES = ['light', 'dark'];

async function run() {
  console.log(`🍎 [Playwright QA] Testing URL: ${TARGET_URL}`);
  if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
  }

  const browser = await chromium.launch({ headless: true });

  for (const vp of VIEWPORTS) {
    for (const theme of THEMES) {
      const context = await browser.newContext({
        viewport: { width: vp.width, height: vp.height },
        colorScheme: theme,
        deviceScaleFactor: 2, // Retina resolution
      });

      const page = await context.newPage();
      try {
        await page.goto(TARGET_URL, { waitUntil: 'networkidle', timeout: 15000 });
        const filename = `${vp.name}-${theme}.png`;
        const filepath = path.join(OUTPUT_DIR, filename);
        await page.screenshot({ path: filepath, fullPage: true });
        console.log(`📸 Captured: ${filename} (${vp.width}x${vp.height}, ${theme})`);
      } catch (err) {
        console.error(`❌ Failed capturing ${vp.name} (${theme}): ${err.message}`);
      } finally {
        await context.close();
      }
    }
  }

  await browser.close();
  console.log(`✅ All screenshots saved to: ${OUTPUT_DIR}`);
}

run().catch((err) => {
  console.error('Fatal Playwright Error:', err);
  process.exit(1);
});
