#!/usr/bin/env node

import fetch from 'node-fetch';
import readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("🔑 Enter your GitHub username: ", username => {
  fetch(`https://api.github.com/users/${username}`)
    .then(res => res.json())
    .then(user => {
      if (!user || !user.login) {
        console.error("⚠️ Invalid GitHub user.");
        process.exit(1);
      }
      console.log(`\n🧠 User found: ${user.login}`);
      console.log(`🔒 2FA enforcement must be managed via GitHub UI.`);
      console.log(`\n👉 Visit: https://github.com/settings/security\n`);
    })
    .catch(err => console.error("❌ API call failed:", err))
    .finally(() => rl.close());
});
