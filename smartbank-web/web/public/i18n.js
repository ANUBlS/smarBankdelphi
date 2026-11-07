// i18n: all UI strings live in /locales/<code>.json. Languages are discovered from /locales/index.json.
(function () {
  const I = { lang: 'en', dict: {}, fallback: {}, languages: [] };
  I.t = (key, vars) => {
    let s = I.dict[key] ?? I.fallback[key] ?? key;
    if (vars) s = s.replace(/\{(\w+)\}/g, (_, k) => (vars[k] ?? `{${k}}`));
    return s;
  };
  I.load = async (lang) => {
    const idx = await fetch('/locales/index.json').then(r => r.json());
    I.languages = idx.languages;
    I.fallback = await fetch(`/locales/${idx.default}.json`).then(r => r.json());
    const wanted = lang || localStorage.getItem('sb.lang') || idx.default;
    const code = I.languages.some(l => l.code === wanted) ? wanted : idx.default;
    I.dict = code === idx.default ? I.fallback : await fetch(`/locales/${code}.json`).then(r => r.json());
    I.lang = code; localStorage.setItem('sb.lang', code); document.documentElement.lang = code;
    document.title = I.t('app.title');
  };
  window.I18N = I; window.t = I.t;
})();
