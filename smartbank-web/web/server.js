// SmartBank web front end: serves the UI, locale files, modules.json and proxies /api to FastAPI.
const express = require('express');
const helmet = require('helmet');
const fs = require('fs');
const path = require('path');
const { createProxyMiddleware } = require('http-proxy-middleware');

const API_URL = process.env.API_URL || 'http://localhost:8000';
const PORT = parseInt(process.env.PORT || '3000', 10);
const LOCALES_DIR = process.env.LOCALES_DIR || path.join(__dirname, 'locales');
const DEFAULT_LANG = process.env.DEFAULT_LANG || 'en';

const app = express();
app.disable('x-powered-by');
app.use(helmet({ contentSecurityPolicy: { directives: { 'script-src': ["'self'"], 'img-src': ["'self'", 'data:'] } } }));

app.get('/healthz', (_req, res) => res.json({ status: 'ok' }));

// API proxy (same origin -> httpOnly session cookie works, no CORS)
const proxy = createProxyMiddleware({ target: API_URL, changeOrigin: false, xfwd: true });
app.use((req, res, next) => (req.path.startsWith('/api/') || req.path === '/health') ? proxy(req, res, next) : next());

// Languages: every <code>.json in locales/ is offered automatically (no code change to add a language).
app.get('/locales/index.json', (_req, res) => {
  const langs = fs.readdirSync(LOCALES_DIR).filter(f => /^[a-z]{2,3}(-[A-Za-z]{2,4})?\.json$/.test(f)).map(f => {
    const code = f.replace(/\.json$/, '');
    let name = code;
    try { name = JSON.parse(fs.readFileSync(path.join(LOCALES_DIR, f), 'utf8'))['_meta.language_name'] || code; } catch (_) {}
    return { code, name };
  });
  res.set('Cache-Control', 'no-cache').json({ default: DEFAULT_LANG, languages: langs });
});
app.use('/locales', express.static(LOCALES_DIR, { maxAge: 0 }));
app.get('/modules.json', (_req, res) => res.set('Cache-Control', 'no-cache').sendFile(path.join(__dirname, 'modules.json')));
app.use(express.static(path.join(__dirname, 'public')));
app.get('*', (_req, res) => res.sendFile(path.join(__dirname, 'public', 'index.html')));

app.listen(PORT, () => console.log(`SmartBank web on :${PORT} -> API ${API_URL}`));
