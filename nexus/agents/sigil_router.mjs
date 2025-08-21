import { grokChat } from './grok_adapter.mjs';

const DEFAULT_SYSTEM = `You are the Kitsune Nexus Oracle. Be precise, ethical, and ToS-compliant. 
Honor lunar timing when asked. Never expose secrets.`;

export async function askGrok(prompt) {
  const messages = [
    { role: 'system', content: DEFAULT_SYSTEM },
    { role: 'user', content: prompt }
  ];
  return await grokChat(messages, { temperature: 0.6 });
}
