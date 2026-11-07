import re,sys
def dec(s):
    out=[];i=0
    while i<len(s):
        c=s[i]
        if c=="'":
            j=i+1;buf=''
            while j<len(s):
                if s[j]=="'":
                    if j+1<len(s) and s[j+1]=="'": buf+="'";j+=2;continue
                    break
                buf+=s[j];j+=1
            out.append(buf);i=j+1
        elif c=='#':
            m=re.match(r'#(\d+)',s[i:]);out.append(chr(int(m.group(1))));i+=len(m.group(0))
        else:i+=1
    return ''.join(out)
def dump(path,want=None):
    lines=open(path,encoding='latin-1').read().split('\n')
    stack=[];cur=None;i=0
    res=[]
    while i<len(lines):
        L=lines[i].strip()
        m=re.match(r'(object|inherited|inline) (\w+): (\w+)',L)
        if m:
            cur={'name':m.group(2),'cls':m.group(3),'line':i+1,'props':{}};stack.append(cur);res.append(cur)
        elif L=='end' and stack:
            stack.pop();cur=stack[-1] if stack else None
        elif cur is not None:
            m=re.match(r'([\w.]+) = (.*)',L)
            if m:
                k,v=m.group(1),m.group(2)
                if v=='(':
                    items=[];i+=1
                    while True:
                        t=lines[i].strip();acc=''
                        if t=='':      # bare blank line inside a list is whitespace, not an item ('' is written quoted)
                            i+=1;continue
                        while t.endswith('+'):
                            acc+=dec(t[:-1].rstrip());i+=1;t=lines[i].strip()
                        end=t.endswith(')')
                        if end:t=t[:-1]
                        items.append(acc+dec(t));
                        if end:break
                        i+=1
                    v='\n'.join(items)
                elif v.startswith("'") or v.startswith('#'):
                    acc=''
                    while v.rstrip().endswith('+'):
                        acc+=dec(v.rstrip()[:-1]);i+=1;v=lines[i].strip()
                    v=acc+dec(v)
                cur['props'][k]=v
        i+=1
    return res
if __name__=='__main__':
    for o in dump(sys.argv[1]):
        p=o['props']
        if o['cls'] in('TOracleDataSet','TOraclePackage','TOracleQuery') or 'SQL.Strings' in p:
            if len(sys.argv)>2 and o['name'] not in sys.argv[2:]:continue
            print(f"### {o['name']} ({o['cls']}) dfm:{o['line']}")
            for k in('PackageName','SQL.Strings','MasterFields','DetailFields','Master','OnApplyRecord','AfterScroll','Tag'):
                if k in p:print(f"{k}: {p[k]}")
            print()
