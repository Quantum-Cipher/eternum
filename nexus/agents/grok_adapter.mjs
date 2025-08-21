/**
 * Grok Adapter — xAI API (OpenAI-compatible)
 * Docs: https://docs.x.ai/docs/api-reference  (base: https://api.x.ai)
 */
const BASE = process.env.XAI_BASE_URL || 'https://api.x.ai';
const MODEL = process.env.GROK_MODEL || 'grok-4';
const KEY   = process.env.XAI_API_KEY;

if (!KEY) {
  console.error('[grok_adapter] Missing XAI_API_KEY in environment');
  process.exit(1);
}

export async function grokChat(messages, opts = {}) {
  const body = {
    model: MODEL,
    messages,
    temperature: opts.temperature ?? 0.7,
    stream: false
  };

  const res = await fetch(`${BASE}/v1/chat/completions`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  });

  if (!res.ok) {
    const errText = await res.text().catch(()=>'');
    throw new Error(`[grok_adapter] ${res.status} ${res.statusText} :: ${errText}`);
  }

  const json = await res.json();
  const text = json?.choices?.[0]?.message?.content ?? '';
  const usage = json?.usage ?? {};
  return { provider: 'xai:grok', model: MODEL, text, usage, raw: json };
}
