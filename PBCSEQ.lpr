program PBCSEQ;
var
  a, b, c: array[0..100000] of longint;
  n: longint;

procedure swap(var x, y: longint);
var
  tmp: longint;
begin
  tmp := x;
  x := y;
  y := tmp;
end;

procedure sort(d, c: longint);
var
  i, j, k1, k2: longint;
begin
  i := d;
  j := c;
  k1 := a[(d + c) div 2];
  k2 := b[(d + c) div 2];
  repeat
    while (a[i] < k1) or ((a[i] = k1) and (b[i] > k2)) do inc(i);
    while (a[j] > k1) or ((a[j] = k1) and (b[j] < k2)) do dec(j);
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

procedure readf;
var
  f: text;
  i: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(F, N);
  for i := 1 to N do readln(F, A[i], B[i]);
  close(f);
end;

function bs(i, res: longint): longint;
var
  l, r, m: longint;
begin
  l := 1;
  r := res;
  while l < r do
  begin
    m := (l +r) div 2;
    if b[c[m]] >= b[i] then l := m + 1
    else r := m;
  end;
  exit(l);
end;

procedure optimize;
var
  i, res: longint;
begin
  //for i := 1 to n do writeln(a[i], ' ', b[i]);
  res := 1;
  c[1] := 1; //c[i] la vi tri cua phan tu lon nhat
  for i := 2 to n do
  begin
    if b[i] <= b[c[res]] then
      begin
        inc(res);
        c[res] := i;
      end
    else
        c[bs(i, res)] := i;
  end;
  write(res);
end;

begin
  readf;
  sort(1, N);
  optimize;
  readln;
end.

