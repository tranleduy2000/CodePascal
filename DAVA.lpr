program DAVA;
var
  a, s: array[0..1001, 0..1001] of longint;
  n, k: longint;

procedure readf;
var
  i, j:longint;
begin
  readln(n, k);
  for i := 1 to n do
      for j := 1 to n do read(a[i, j]);
end;

procedure init;
var
  i, j: longint;
begin
  for i := 1 to n do
      for j := 1to n do
            s[i, j] := s[i-1, j] + s[i, j-1] - s[i-1, j-1] + a[i, j];
end;

procedure process;
var
  i, j: longint;
  max, tmp: longint;
begin
  max := 0;
  for i := 1 to n - k + 1 do
      for j := 1 to n - k + 1 do
          begin
            tmp := s[i+k-1, j+k-1] - s[i-1, j+k-1] - s[i+k-1, j-1] + s[i-1, j-1];
            if tmp > max then max := tmp;
          end;
  writeln(max);
  readln;
  readln;
end;
begin
  readf;
  init;
  process;
  readln;
end.

