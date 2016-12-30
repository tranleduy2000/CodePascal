program FLOYD;
const
  maxn = 101;
  maxC = 10000213;
var
  trace, c: array[1..maxn, 1..maxn] of longint;
  n, k: longint;     f: text;
procedure readf;
var

  u, v, m,mc,  i: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n, m, k);
  for u := 1 to n do
      for v := 1 to n do
          if u = v then c[u, v] := 0 else c[u, v] := maxC;
  for i := 1 to m do
  begin
    readln(f, u, v, mc);
    c[u, v] := mc;
    c[v, u] := mc;
  end;
end;

procedure floyd;
var
  u, v, k: longint;
begin
  for u := 1 to n do
      for v := 1to n do trace[u, v] := v;
  for k := 1 to n do
      for u := 1 to n do
          for v :=1 to n do
              if c[u, k] + c[k, v] < c[u, v] then
              begin
                c[u, v] := c[u, k] + c[k, v];
                trace[u, v] := trace[u, k];
              end;

end;

procedure tracef(u, v: longint);
var
  a: array[1..maxn] of longint;
  count, i: longint;
begin
  count := 0;
  inc(count);
  a[count] := u;
  repeat
    u := trace[u, v];
    inc(count);
    a[count] := u;
  until u = v;
  write(count, ' ');
  for i := 1 to count do write(a[i], ' ');
  writeln;
end;

procedure answer;
var
  cmd, u, v: longint;
begin
  while k > 0 do
  begin
    read(f, cmd, u, v);
    if cmd = 0 then writeln(c[u, v])
    else tracef(u, v);
    dec(k);
  end;
end;
begin
  readf;
  floyd;
  answer;
  close(f);
  readln;
end.

