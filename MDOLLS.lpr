program MDOLLS;
var
  a, b, c: array[0..100000] of integer;
  n, res: integer;

procedure swap(var x, y: integer);
var
  tmp: integer;
begin
  tmp := x;
  x := y;
  y := tmp;
end;

procedure sort(d, c: integer);
var
  i, j, k1, k2: integer;
begin
  i := d;
  j := c;
  k1 := a[(d + c) div 2];
  k2 := b[(d + c) div 2];
  repeat
    while (A[i] < k1) or ((a[i] = k1) and (b[i] > k2)) do inc(i);
    while (A[j] > k1) or ((a[j] = k1) and (b[j] < k2)) do dec(j);
    if i <= j then
    begin
      swap(a[i], a[j]);
      swap(b[i], b[j]);
      inc(i);
      dec(j);
    end;
  until i > j;
  if (d < j) then sort(d, j);
  if (i < c) then sort(i, c);
end;

function bs(i: integer): integer;
var
  l, r, m: integer;
begin
   l := 1;
   r := res;
   while l < r do
   begin
      m := (l + r) div 2;
      if b[c[m]] >= b[i] then
         l := m + 1
      else r := m;
   end;
   exit(l);
end;

procedure optimize;
var
  i: integer;
begin
  //for i := 1to n do writelN(a[i], ' ', b[i]);
  res := 1;
  c[1] := 1;
  for i := 2 to n do
  begin
     if b[i] <= b[c[res]] then
     begin
       inc(res);
       c[res] := i;
     end
     else c[bs(i)] := i;
  end;
  writeln(res);
end;

procedure process;
var
  t, i: integer;
  f: text;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(F, t);
  while t > 0 do
  begin
    readln(f, n);
    for i := 1 to n do read(f, a[i], b[i]);
    sort(1, n);
    optimize;
    dec(t);
  end;
  close(f);
end;

begin
  process;
  readln;
end.

