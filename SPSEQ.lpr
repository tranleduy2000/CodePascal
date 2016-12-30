program SPSEQ;
const
  maxn = 100000;
var
  a, h1, h2, r1, r2: array[1..maxn] of longint;
  n: longint;
//a input
//h1, h2 length;
//r1 r2 index;
function bs1(i, l, r: longint): longint;
var
  m: longint;
begin
  while l < r do
  begin
    m := (l + r) div 2;
    if a[h1[m]] < a[i] then l := m + 1
    else r := m;
  end;
  exit(l);
end;

//tang
procedure lis1;
var
  i, res, tmp: longint;
begin
  res := 1;
  r1[1] := 1;
  h1[1] := 1;
  for i := 2 to n do
  begin
    if a[i] > a[h1[res]] then
    begin
      inc(res);
      h1[res] := i;
      r1[i] := res;
    end
    else
    begin
      tmp := bs1(i, 1, res);
      h1[tmp] := i;
      r1[i] := tmp;
    end;
  end;
  //for i := 1 to n do write(r1[i], ' ');
//  writeln;
end;

function min(x, y: longint): longint;
begin
  if x < y then exit(x) else exit(y);
end;

procedure swap(var x, y: longint);
var
  tmp: longint;
begin
  tmp :=x ;
  x := y;
  y := tmp;
end;

function bs2(i, l, r: longint): longint;
var
  m: longint;
begin
  while l < r do
  begin
    m := (l + r) div  2;
    if a[h2[m]] < a[i] then l := m + 1
    else r := m ;
  end;
  exit(l);
end;

procedure lis2;
var
  i, res, tmp: longint;
begin
  for i := 1 to n div 2 do swap(a[i], a[n-i+1]);

  res := 1;
  r2[1] := 1;
  h2[1] := 1;

  for i := 2 to n do
  begin
    if a[i] > a[h2[res]] then
    begin
      inc(res);
      h2[res] := i;
      r2[i] := res;
    end
    else
    begin
      tmp := bs2(i, 1, res);
      h2[tmp] := i;
      r2[i] := tmp;
    end;
  end;

  for i := 1 to n div 2 do swap(r2[i], r2[n-i+1]);
  //for i := 1 to n do write(a[i], ' ');
  //writeln;
  //for i := 1 to n do write(r2[i], ' ');
  //writeln;
end;

procedure readf;
var
  f: text;
  i: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  for i := 1 to n do read(f, a[i]);
  close(f);
end;



procedure process;
var
  max, i: longint;
begin
  max := 0;
  for i := 1 to n do
      if 2 * min(r1[i], r2[i]) - 1 > max then max :=  2 * min(r1[i], r2[i]) - 1;
  writeln(max);
end;

begin
  readf;
  lis1;
  lis2;
  process;
  readln;
end.

