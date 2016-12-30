program NHGA;
var
  n: longint;
  a: array[1..100000] of longint;

procedure readf;
var
  i: longint;
begin
  readln(n);
  for i := 1 to n do read(a[i]);
end;

procedure qs(l, r: longint);
var
  i, j, k, tmp: longint;
begin
  i := l;
  j := r;
  k := a[(l +r ) div 2];
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
  if i < r then qs(i, r);
  if l < j then qs(l, j);
end;

procedure process;
var
  min, i: longint;
begin
  min := high(longint);
  for i := 2 to n do
      if abs(a[i] - a[i-1]) < min then min := abs(a[i] - a[i-1]);
  writeLn(min);
  readln;
  readln;
end;

begin
  readf;
  qs(1,n);
  process;
end.

