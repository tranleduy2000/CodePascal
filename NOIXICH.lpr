var
  a: array[1..20000] of longint;
  n: integer;

procedure readf;
var
  f: text;
  i: integer;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  for i := 1to  n do read(f, a[i]);
  close(f);
end;

procedure sort(l, r: integer);
var
  i, j, k, tmp: integer;
begin
  i := l;
  j := r;
  k := a[(l+r) div 2];
  repeat
    while a[i] < k do inc(i);
    while a[j] > k do dec(j);
    if i <= j then
    begin
      tmp := a[i];
      a[i] := a[j];
      a[j] := tmp;
      inc(i);
      dec(j);
    end;
  until i > j;
  if i < r then sort(i, r);
  if l < j then sort(l, j);
end;

procedure process;
var
  res, i: longint;
begin
  readf;
  sort(1, n);
  i := 1;  res := 0;
  //for i := 1 to n do write(a[i], ' ');
  while (n > 1) do
  begin
    if a[i] >= n - 1 then break;
    dec(n, a[i]+1);
    inc(res, a[i]);
    inc(i);
  end;
  writeln(res + n - 1);
  readln;
end;

begin
  process;
end.

