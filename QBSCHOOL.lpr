program QBSCHOOL;
const
  maxn = 5000;
  maxC = 32000 * 20000;
var
  a: array[1..maxn ,1..maxn] of longint;
  n, m: longint;

procedure readf;
var
  f: text;
  i, u, v, c, k: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n, m);
  for u := 1 to n do
      for v := 1 to n do
          if u = v then a[u, v] := 0
          else a[u, v] := maxC;
  for i := 1 to m do
  begin
    readln(f, k, u, v, c);
    if k = 1 then a[u, v] := c
    else
      begin
        a[u, v] := c;
        a[v, u] := c;
      end;
  end;
  //for u := 1 to n do
  //begin
  //  for v := 1 to n do write(a[u, v], ' ');
  //  writeln;
  //end;
  close(F);
end;

var
  t, d: array[1..maxn] of int64;
  free: array[1..maxn] of boolean;
procedure process;
var
  u, v, min: longint;
begin
  fillchar(free, sizeof(free), true);
  for u := 1 to n do
  begin
    d[u] := maxC;
    t[u] := 0;
  end;
  d[1] := 0;
  t[1] := 1;
  repeat
    u := 0;
    min := maxC;
    for v := 1 to n do
        if free[v] and (d[v] < min) then
        begin
          u := v;
          min := d[v];
        end;

    if (u = 0) or (u = n) then break;

    free[u] := false;

    for v := 1 to n do
    begin
      if free[v] then
      begin
        if (d[v] > d[u] + a[u, v]) then
        begin
          d[v] := d[u] + a[u, v];
          t[v] := t[u];
        end
        else if (d[v] = d[u] + a[u, v]) then
        begin
          t[v] := t[u] + t[v];
        end;
      end;
    end;
  until false;
  writeln(d[n], ' ', t[n]);
  readln;
end;
begin
  readf;
  process;
end.

