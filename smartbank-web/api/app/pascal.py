"""Small interpreter for the Object Pascal subset used by the AZIPS file procedures (SWIFT_MAINImpl1.pas).

Why an interpreter: PACS0008Execute alone is ~1 400 lines of string concatenation with spaces, CRLFs and branches that must
come out byte-identical. Instead of re-typing them (and risking a missed blank), the web runs the **verbatim Delphi source
fragment** (api/app/delphi_src/*.pas, copied unchanged from the repo) against runtime objects that behave like the VCL / DOA
objects the code touches (TDataSet fields, TStringList, TOraclePackage, TextFile, MessageDlg, ...). Only these constructs
are supported: begin/end, if/then/else, for/to/downto/do, while, repeat, case, try/finally/except, with, assignment,
calls, Continue/Break/Exit; expressions with Pascal precedence. Anything else raises PascalUnsupported (never silently
skipped). Identifiers are resolved like Delphi: innermost `with` object first, then the procedure locals, then Self (the
form), then the built-in RTL functions below. Nothing in here can reach the OS, SQL or network except through the
runtime objects the caller passes in.
"""
from __future__ import annotations
import datetime as dt
import math
import re


class PascalUnsupported(Exception):
    pass


class PascalError(Exception):
    """A Delphi runtime exception (EStringListError, EConvertError, EOracleError...) - message as Delphi shows it."""


class _Ctl(Exception):
    pass


class _Break(_Ctl):
    pass


class _Continue(_Ctl):
    pass


class _Exit(_Ctl):
    pass


# ------------------------------------------------------------------------------------------------ lexer
_TOK = re.compile(r"""
 (?P<ws>\s+)
|(?P<c1>\{[^}]*\})
|(?P<c2>\(\*.*?\*\))
|(?P<c3>//[^\n]*)
|(?P<str>(?:'(?:[^']|'')*'|\#\d+|\#\$[0-9A-Fa-f]+)+)
|(?P<num>\$[0-9A-Fa-f]+|\d+\.\d+(?:[eE][-+]?\d+)?|\d+)
|(?P<id>[A-Za-z_][A-Za-z0-9_]*)
|(?P<op>:=|<>|<=|>=|\.\.|[-+*/=<>()\[\],;.:^@])
""", re.S | re.X)


def _decode_str(s):
    out, k = [], 0
    while k < len(s):
        if s[k] == "'":
            j = k + 1
            buf = []
            while True:
                if s[j] == "'":
                    if j + 1 < len(s) and s[j + 1] == "'":
                        buf.append("'"); j += 2; continue
                    break
                buf.append(s[j]); j += 1
            out.append("".join(buf)); k = j + 1
        else:
            m = re.match(r"#(\$[0-9A-Fa-f]+|\d+)", s[k:])
            v = m.group(1)
            out.append(chr(int(v[1:], 16) if v[0] == "$" else int(v)))
            k += len(m.group(0))
    return "".join(out)


def tokenize(src, line0=1):
    toks, pos, line = [], 0, line0
    while pos < len(src):
        m = _TOK.match(src, pos)
        if not m:
            raise PascalUnsupported(f"lex error at line {line}: {src[pos:pos+20]!r}")
        k = m.lastgroup
        t = m.group(k)
        if k == "str":
            toks.append(("str", _decode_str(t), line))
        elif k == "num":
            toks.append(("num", int(t[1:], 16) if t[0] == "$" else (float(t) if "." in t or "e" in t.lower() else int(t)), line))
        elif k == "id":
            toks.append(("id", t.lower(), line))
        elif k == "op":
            toks.append(("op", t, line))
        line += t.count("\n")
        pos = m.end()
    toks.append(("eof", None, line))
    return toks


KW = {"begin", "end", "if", "then", "else", "for", "to", "downto", "do", "while", "repeat", "until", "case", "of", "try",
      "finally", "except", "on", "with", "and", "or", "not", "div", "mod", "xor", "var", "procedure", "function", "in",
      "raise", "const"}


# ------------------------------------------------------------------------------------------------ parser -> tuples
class Parser:
    def __init__(self, toks):
        self.t, self.i = toks, 0

    def peek(self, k=0):
        return self.t[self.i + k]

    def isop(self, v, k=0):
        t = self.peek(k)
        return t[0] == "op" and t[1] == v

    def iskw(self, v, k=0):
        t = self.peek(k)
        return t[0] == "id" and t[1] == v

    def next(self):
        t = self.t[self.i]; self.i += 1; return t

    def expect_op(self, v):
        t = self.next()
        if not (t[0] == "op" and t[1] == v):
            raise PascalUnsupported(f"expected {v!r} at line {t[2]}, got {t[1]!r}")

    def expect_kw(self, v):
        t = self.next()
        if not (t[0] == "id" and t[1] == v):
            raise PascalUnsupported(f"expected {v} at line {t[2]}, got {t[1]!r}")

    # procedure: header, var section, begin..end;
    def procedure(self):
        self.expect_kw("procedure")
        while not self.isop(";"):
            self.next()
        self.next()
        self.vars = {}
        if self.iskw("var"):
            self.next()
            while not self.iskw("begin"):
                names = [self.next()[1]]
                while self.isop(","):
                    self.next(); names.append(self.next()[1])
                self.expect_op(":")
                typ = self.next()[1]
                self.expect_op(";")
                for n in names:
                    self.vars[n] = typ
        body = self.compound()
        return body, self.vars

    def compound(self):
        self.expect_kw("begin")
        sts = self.stmts(("end",))
        self.expect_kw("end")
        return ("block", sts)

    def stmts(self, enders):
        sts = []
        while True:
            t = self.peek()
            if t[0] == "id" and t[1] in enders:
                return sts
            if t[0] == "eof":
                raise PascalUnsupported("unexpected end of source")
            if self.isop(";"):
                self.next(); continue
            sts.append(self.stmt())
            if self.isop(";"):
                self.next()
            else:
                t = self.peek()
                if not (t[0] == "id" and t[1] in enders):
                    raise PascalUnsupported(f"expected ; at line {t[2]}, got {t[1]!r}")

    def stmt(self):
        t = self.peek()
        ln = t[2]
        if t[0] == "op" and t[1] == ";":
            return ("nop",)
        if t[0] == "id":
            w = t[1]
            if w in ("end", "else", "until", "finally", "except"):
                return ("nop",)
            if w == "begin":
                return self.compound()
            if w == "if":
                self.next(); c = self.expr(); self.expect_kw("then")
                a = self.stmt_or_empty(); b = None
                if self.iskw("else"):
                    self.next(); b = self.stmt_or_empty()
                return ("if", c, a, b, ln)
            if w == "for":
                self.next(); v = self.next()[1]; self.expect_op(":="); a = self.expr()
                d = self.next()[1]
                if d not in ("to", "downto"):
                    raise PascalUnsupported(f"for at line {ln}")
                b = self.expr(); self.expect_kw("do")
                return ("for", v, a, b, d == "downto", self.stmt_or_empty(), ln)
            if w == "while":
                self.next(); c = self.expr(); self.expect_kw("do")
                return ("while", c, self.stmt_or_empty(), ln)
            if w == "repeat":
                self.next(); s = self.stmts(("until",)); self.expect_kw("until")
                return ("repeat", ("block", s), self.expr(), ln)
            if w == "with":
                self.next(); objs = [self.expr()]
                while self.isop(","):
                    self.next(); objs.append(self.expr())
                self.expect_kw("do")
                return ("with", objs, self.stmt_or_empty(), ln)
            if w == "try":
                self.next(); a = self.stmts(("finally", "except"))
                k = self.next()[1]
                if k == "finally":
                    b = self.stmts(("end",)); self.expect_kw("end")
                    return ("tryf", ("block", a), ("block", b), ln)
                handlers, other = [], None
                if self.iskw("on"):
                    while self.iskw("on"):
                        self.next(); n = self.next()[1]; cls = n
                        if self.isop(":"):
                            self.next(); cls = self.next()[1]
                        else:
                            n = None
                        self.expect_kw("do"); handlers.append((n, cls, self.stmt_or_empty()))
                        if self.isop(";"):
                            self.next()
                    if self.iskw("else"):
                        self.next(); other = ("block", self.stmts(("end",)))
                else:
                    other = ("block", self.stmts(("end",)))
                self.expect_kw("end")
                return ("trye", ("block", a), handlers, other, ln)
            if w == "case":
                self.next(); e = self.expr(); self.expect_kw("of")
                arms, other = [], None
                while not self.iskw("end"):
                    if self.iskw("else"):
                        self.next(); other = ("block", self.stmts(("end",))); break
                    labels = [self.expr()]
                    while self.isop(","):
                        self.next(); labels.append(self.expr())
                    self.expect_op(":")
                    arms.append((labels, self.stmt_or_empty()))
                    if self.isop(";"):
                        self.next()
                self.expect_kw("end")
                return ("case", e, arms, other, ln)
            if w in ("continue", "break", "exit") and not self.isop("(", 1):
                self.next(); return (w,)
            if w == "raise":
                raise PascalUnsupported(f"raise at line {ln}")
        lhs = self.designator()
        if self.isop(":="):
            self.next()
            return ("assign", lhs, self.expr(), ln)
        return ("call", lhs, ln)

    def stmt_or_empty(self):
        if self.isop(";") or self.iskw("else") or self.iskw("end"):
            return ("nop",)
        return self.stmt()

    # expressions
    def expr(self):
        a = self.simple()
        while self.peek()[0] == "op" and self.peek()[1] in ("=", "<>", "<", ">", "<=", ">=") or self.iskw("in"):
            op = self.next()[1]
            a = ("bin", op, a, self.simple())
        return a

    def simple(self):
        a = self.term()
        while self.isop("+") or self.isop("-") or self.iskw("or") or self.iskw("xor"):
            op = self.next()[1]
            a = ("bin", op, a, self.term())
        return a

    def term(self):
        a = self.factor()
        while self.isop("*") or self.isop("/") or self.iskw("div") or self.iskw("mod") or self.iskw("and"):
            op = self.next()[1]
            a = ("bin", op, a, self.factor())
        return a

    def factor(self):
        t = self.peek()
        if t[0] == "str":
            self.next(); return ("lit", t[1])
        if t[0] == "num":
            self.next(); return ("lit", t[1])
        if self.iskw("not"):
            self.next(); return ("not", self.factor())
        if self.isop("-"):
            self.next(); return ("neg", self.factor())
        if self.isop("+"):
            self.next(); return self.factor()
        if self.isop("("):
            self.next(); e = self.expr(); self.expect_op(")")
            return self.postfix(("paren", e))
        if self.isop("["):
            self.next(); items = []
            while not self.isop("]"):
                items.append(self.expr())
                if self.isop(","):
                    self.next()
            self.next()
            return ("set", items)
        return self.designator()

    def designator(self):
        t = self.next()
        if t[0] != "id" or t[1] in KW:
            raise PascalUnsupported(f"unexpected {t[1]!r} at line {t[2]}")
        return self.postfix(("name", t[1], t[2]))

    def postfix(self, node):
        while True:
            if self.isop("."):
                self.next(); n = self.next()[1]; node = ("attr", node, n)
            elif self.isop("("):
                self.next(); args = []
                while not self.isop(")"):
                    args.append(self.expr())
                    if self.isop(","):
                        self.next()
                self.next(); node = ("callx", node, args)
            elif self.isop("["):
                self.next(); idx = [self.expr()]
                while self.isop(","):
                    self.next(); idx.append(self.expr())
                self.expect_op("]"); node = ("index", node, idx)
            else:
                return node


# ------------------------------------------------------------------------------------------------ runtime
class PObj:
    """Base for runtime objects: members are looked up by lower-case name (props + methods)."""

    def has(self, name):
        return hasattr(self, "p_" + name) or hasattr(self, "m_" + name)

    def get(self, name):
        if hasattr(self, "p_" + name):
            return getattr(self, "p_" + name)
        if hasattr(self, "m_" + name):
            return Bound(getattr(self, "m_" + name), name)
        raise PascalUnsupported(f"{type(self).__name__}.{name}")

    def set(self, name, v):
        if not hasattr(self, "p_" + name):
            raise PascalUnsupported(f"set {type(self).__name__}.{name}")
        setattr(self, "p_" + name, v)

    def index(self, i):
        raise PascalUnsupported(f"{type(self).__name__}[...]")


class Bound:
    def __init__(self, fn, name):
        self.fn, self.name = fn, name

    def __call__(self, *a):
        return self.fn(*a)


class Sink(PObj):
    """A VCL control whose state does not influence the result (Memo1.Text, ProcessMessages...): accepts anything."""

    def __init__(self, name):
        self.name, self.props = name, {}

    def has(self, name):
        return True

    def get(self, name):
        if name in self.props:
            return self.props[name]
        return Bound(lambda *a: None, name)

    def set(self, name, v):
        self.props[name] = v


class Var:
    def __init__(self, v):
        self.v = v


# Delphi string helpers (1-based, never raise like the RTL)
def d_copy(s, i, n):
    s = str(s)
    i = int(i)
    n = int(n)
    if i < 1:
        i = 1
    if n <= 0 or i > len(s):
        return ""
    return s[i - 1:i - 1 + n]


def d_trim(s):
    s = str(s)
    a, b = 0, len(s)
    while a < b and s[a] <= " ":
        a += 1
    while b > a and s[b - 1] <= " ":
        b -= 1
    return s[a:b]


def float_to_str(v, dec="."):
    v = float(v)
    s = "%.15g" % v
    if "e" in s:
        m, e = s.split("e")
        s = m + "E" + ("-" if e[0] == "-" else "") + e[1:].lstrip("0")
    return s.replace(".", dec)


def format_datetime(fmt, d):
    """FormatDateTime for the specifiers this module uses (yyyy yy mm dd hh nn ss and literals)."""
    if not isinstance(d, (dt.date, dt.datetime)):
        d = dt.datetime(1899, 12, 30) + dt.timedelta(days=float(d or 0))
    if not isinstance(d, dt.datetime):
        d = dt.datetime(d.year, d.month, d.day)
    out, i, f = [], 0, fmt
    prev_h = False
    while i < len(f):
        for tok, val in (("yyyy", "%04d" % d.year), ("yy", "%02d" % (d.year % 100)), ("hh", "%02d" % d.hour),
                         ("nn", "%02d" % d.minute), ("ss", "%02d" % d.second), ("dd", "%02d" % d.day),
                         ("mm", None), ("zzz", "%03d" % (d.microsecond // 1000))):
            if f[i:i + len(tok)].lower() == tok:
                if tok == "mm":
                    val = "%02d" % (d.minute if prev_h else d.month)
                prev_h = tok == "hh"
                out.append(val); i += len(tok); break
        else:
            c = f[i]
            if c in "\"'":
                j = f.index(c, i + 1); out.append(f[i + 1:j]); i = j + 1
            elif c.lower() in "ymdhnsz":
                raise PascalUnsupported(f"FormatDateTime {fmt!r}")
            else:
                out.append(c); i += 1
    return "".join(out)


def d_format(fmt, args):
    k = iter(args)
    return re.sub(r"%([dsf])", lambda m: str(next(k)), fmt)


class Interp:
    def __init__(self, self_obj, builtins: dict, locals_init: dict | None = None):
        self.selfobj = self_obj
        self.builtins = builtins
        self.locals = {}
        self.withs = []
        for k, v in (locals_init or {}).items():
            self.locals[k] = v

    # name resolution like Delphi scope rules
    def lookup(self, name, ln):
        for o in reversed(self.withs):
            if isinstance(o, PObj) and o.has(name):
                return o.get(name)
        if name in self.locals:
            return self.locals[name]
        if self.selfobj.has(name):
            return self.selfobj.get(name)
        if name in self.builtins:
            return self.builtins[name]
        raise PascalUnsupported(f"unknown identifier {name!r} at line {ln}")

    def assign(self, node, v):
        k = node[0]
        if k == "name":
            n = node[1]
            for o in reversed(self.withs):
                if isinstance(o, PObj) and o.has(n):
                    o.set(n, v); return
            if n in self.locals or not self.selfobj.has(n):
                self.locals[n] = v; return
            self.selfobj.set(n, v); return
        if k == "attr":
            o = self.ev(node[1]); o.set(node[2], v); return
        if k == "index":
            o = self.ev(node[1]); o.setindex(*[self.ev(x) for x in node[2]], v); return
        raise PascalUnsupported(f"assign to {k}")

    def callv(self, f, args):
        if isinstance(f, (Bound,)) or callable(f):
            return f(*args)
        if not args:
            return f
        raise PascalUnsupported(f"call of non-callable {f!r}")

    def ev(self, n):
        k = n[0]
        if k == "lit":
            return n[1]
        if k == "paren":
            return self.ev(n[1])
        if k == "set":
            return [self.ev(x) for x in n[1]]
        if k == "name":
            v = self.lookup(n[1], n[2])
            return v() if isinstance(v, Bound) or (callable(v) and not isinstance(v, PObj)) else v
        if k == "attr":
            o = self.ev(n[1])
            if not isinstance(o, PObj):
                raise PascalUnsupported(f".{n[2]} on {type(o).__name__}")
            v = o.get(n[2])
            return v() if isinstance(v, Bound) else v
        if k == "callx":
            f = n[1]
            args = [self.ev(a) for a in n[2]]
            if f[0] == "name":
                fn = self.lookup(f[1], f[2])
            elif f[0] == "attr":
                o = self.ev(f[1])
                fn = o.get(f[2])
            else:
                raise PascalUnsupported("call target")
            return self.callv(fn, args)
        if k == "index":
            o = self.ev(n[1])
            idx = [self.ev(x) for x in n[2]]
            if isinstance(o, str):
                i = int(idx[0])
                if i < 1 or i > len(o):
                    raise PascalError("Range check error")
                return o[i - 1]
            return o.index(*idx)
        if k == "not":
            v = self.ev(n[1])
            return (not v) if isinstance(v, bool) else ~int(v)
        if k == "neg":
            return -self.ev(n[1])
        if k == "bin":
            op = n[1]
            a = self.ev(n[2])
            if op == "and" and isinstance(a, bool):
                return a and bool(self.ev(n[3]))      # Delphi short-circuit boolean evaluation ($B-)
            if op == "or" and isinstance(a, bool):
                return a or bool(self.ev(n[3]))
            b = self.ev(n[3])
            if op == "+":
                if isinstance(a, str) or isinstance(b, str):
                    return str(a) + str(b) if isinstance(a, str) and isinstance(b, str) else _type_err(a, b)
                return a + b
            if op == "-": return a - b
            if op == "*": return a * b
            if op == "/": return a / b
            if op == "div": return int(a / b)
            if op == "mod": return int(math.fmod(a, b))
            if op == "and": return int(a) & int(b)
            if op == "or": return int(a) | int(b)
            if op == "xor": return a ^ b
            if op == "in": return a in b
            if isinstance(a, str) != isinstance(b, str):
                _type_err(a, b)
            return {"=": a == b, "<>": a != b, "<": a < b, ">": a > b, "<=": a <= b, ">=": a >= b}[op]
        raise PascalUnsupported(f"expr {k}")

    def run(self, s):
        k = s[0]
        if k == "nop":
            return
        if k == "block":
            for x in s[1]:
                self.run(x)
            return
        if k == "assign":
            self.assign(s[1], self.ev(s[2])); return
        if k == "call":
            n = s[1]
            if n[0] in ("name", "attr"):
                if n[0] == "name":
                    f = self.lookup(n[1], n[2])
                else:
                    f = self.ev(n[1]).get(n[2])
                if isinstance(f, Bound) or (callable(f) and not isinstance(f, PObj)):
                    f()
                return
            self.ev(n); return
        if k == "if":
            if self.ev(s[1]):
                self.run(s[2])
            elif s[3]:
                self.run(s[3])
            return
        if k == "for":
            _, v, a, b, down, body, ln = s
            i, e = int(self.ev(a)), int(self.ev(b))
            rng = range(i, e - 1, -1) if down else range(i, e + 1)
            for x in rng:
                self.assign(("name", v, ln), x)
                try:
                    self.run(body)
                except _Continue:
                    continue
                except _Break:
                    break
            return
        if k == "while":
            while self.ev(s[1]):
                try:
                    self.run(s[2])
                except _Continue:
                    continue
                except _Break:
                    break
            return
        if k == "repeat":
            while True:
                try:
                    self.run(s[1])
                except _Continue:
                    pass
                except _Break:
                    break
                if self.ev(s[2]):
                    break
            return
        if k == "with":
            objs = []
            for o in s[1]:                       # each with-expression is resolved inside the previous ones (Delphi)
                objs.append(self.ev(o)); self.withs.append(objs[-1])
            try:
                self.run(s[2])
            finally:
                del self.withs[len(self.withs) - len(objs):]
            return
        if k == "tryf":
            try:
                self.run(s[1])
            finally:
                self.run(s[2])
            return
        if k == "trye":
            try:
                self.run(s[1])
            except _Ctl:
                raise
            except PascalUnsupported:
                raise
            except Exception as e:      # noqa: BLE001 - Delphi 'on E: Exception' catches every runtime/Oracle error
                for name, cls, body in s[2]:
                    if cls == "exception" or cls == getattr(e, "cls", "exception"):
                        if name:
                            self.locals[name] = ExcObj(str(e))
                        self.run(body); return
                if s[3] is not None:
                    self.run(s[3]); return
                raise
            return
        if k == "case":
            v = self.ev(s[1])
            for labels, body in s[2]:
                if any(self.ev(x) == v for x in labels):
                    self.run(body); return
            if s[3]:
                self.run(s[3])
            return
        if k == "continue":
            raise _Continue()
        if k == "break":
            raise _Break()
        if k == "exit":
            raise _Exit()
        raise PascalUnsupported(k)

    def execute(self, body):
        try:
            self.run(body)
        except _Exit:
            pass


class ExcObj(PObj):
    def __init__(self, m):
        self.p_message = m


def _type_err(a, b):
    raise PascalUnsupported(f"type mismatch {type(a).__name__} / {type(b).__name__}")


def parse_procedure(src: str, line0: int):
    """-> (body, {var: type}) of one 'procedure ... begin ... end;' text."""
    return Parser(tokenize(src, line0)).procedure()


def init_locals(vars_: dict, factories: dict) -> dict:
    """Delphi: managed locals (string) start as ''; the others are given neutral values (0 / False / None)."""
    out = {}
    for n, t in vars_.items():
        if t in factories:
            out[n] = factories[t]()
        elif t in ("string", "widestring", "ansistring", "char"):
            out[n] = ""
        elif t in ("integer", "longint", "int64", "word", "byte", "smallint", "cardinal"):
            out[n] = 0
        elif t in ("real", "double", "extended", "currency", "single", "tdatetime", "tdate"):
            out[n] = 0.0
        elif t == "boolean":
            out[n] = False
        else:
            out[n] = None
    return out
