import 'dotenv/config';
import { askGrok } from '../agents/sigil_router.mjs';

const prompt = process.argv.slice(2).join(' ') || 'Reply with the single word: BLINK.';
try {
  const { text, model, provider } = await askGrok(prompt);
  console.log(`\n[${provider} :: ${model}]`);
  console.log(text.trim(), '\n');
} catch (e) {
  console.error('Error:', e.message);
  process.exit(1);
}
