const
    maxn = 1000000;
type
    edge = record
        u, v, c: longint;
        mark: Boolean;
    end;

var
    base: array[1..maxn] of edge;
    n, m, k: longint;
    lab, id: array[1..maxn] of longint;

procedure  swap( x, y: longint);
var
    tmp: longint;
begin
    tmp := id[x];
    id[x] := id[y];
    id[y] := tmp;
end;

procedure  sort(l, r: longint);
var
    i, j, key: longint;
    tmp: edge;
    t2: LongInt;
begin
    i := l;
    j := r;
    key := base[(l + r) div 2].c;
    repeat
        while base[i].c < key do inc(i);
        while base[j].c > key do Dec(j);
        if i <= j then
        begin
            tmp := base[i];
            base[i] := base[j];
            base[j] := tmp;

            swap(i, j);

            inc(i);
            dec(j);
        end;
    until i > j;
    if i < r then sort(i, r);
    if j < l then sort(l ,j);
end;

procedure  init();
var
    i: longint;
begin
    for i := 1to n do lab[i] := -1;
end;

function getroot(v: longint): longint;
begin
    while lab[v] > 0 do v := lab[v];
    exit(v);
end;

procedure union( r1: longint; r2: longint);
var
    tmp: LongInt;
begin
    tmp := lab[r1] + lab[r1];
    if lab[r1] < lab[r2] then
    begin
        lab[r1] := tmp;
        lab[r2] := r1;
    end
    else
    begin
        lab[r1] := r2;
        lab[r2] := tmp;
    end;
end;

procedure  krushkal();
var
    i, r1, r2, count: longint;
begin
    sort(1, m);
    init;
    while (base[id[k]].c = base[id[k] - 1].c) and (id[k - 1] >= 1) do
        swap(id[k], id[k] - 1);
    count := 0;
    //  for i := 1 to m do write(id[i], ' ');
    for i := 1 to m do
    begin
        r1 := getroot(base[i].u);
        r2 := getroot(base[i].v);
        if r1 <> r2 then
        begin
            inc(count);
            union(r1, r2);
            base[i].mark := true;
            if count = n - 1 then break;
        end;
    end;
end;

procedure process;
var
    f: text;
    e: array[1..maxn] of edge ;
    i, s, u, v, c, q, t, j : LongInt;
begin
    assign(f, 'file.inp');
    reset(f);
    readln(f, t);
    while t > 0 do
    begin
        readln(f, n, m, q);
        for i := 1 to m do
        begin
            readln(f, u, v, c);
            e[i].u := u;
            e[i].v := v;
            e[i].c := c;
            e[i].mark := false;
            id[i] := i;
        end;
        for i := 1 to q do
        begin
            base := e;
            read(f, k, s);
            for j := 1to s  do
            begin
                read(f, u, v);
                base[u].c := v;
            end;
            krushkal;
            if base[id[k]].mark then writeln('NO') else WriteLn('YES');
        end;
        dec(t);
    end;
    close(f);
end;

begin
    process();
end.