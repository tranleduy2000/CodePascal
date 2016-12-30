program LIQ2;
const
  maxn = 10000;
var
  n: integer;
  a, h: array[1..maxn] of integer;

procedure readf;
var
  f: text;
  i: integer;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(F, n);
  for i := 1to n do read(f, a[i]);
  close(f);
end;

function bs(i, l, r: integer): longint;
var
  m: integer;
begin
  while l < r do
  begin
    m := (l + r) div 2;
    if (a[h[m]] < a[i]) then l := m + 1
    else r := m;
    //writeln(m, ' ', ' l = ', l, ' r = ', r);
  end;
  //writeln(m);
  exit(l);
end;

procedure process;
var
  res, i: integer;
begin
  res := 1;
  h[1] := 1;
  //h[res];
  //max
  //index
  //...
  for i := 2 to n do
  begin
    if a[i] > a[h[res]] then
    begin
      inc(res);
      h[res] := i;
    end
    else h[bs(i, 1, res)] := i;
  end;
  writeln(res);
  readln;
end;
begin
  readf;
  process;
end.

