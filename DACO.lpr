program DACO;
var
  a: array[0..1000] of longint;
  n: longint;
procedure readf;
var
  i: longint;
begin
  readln(n);
  for i := 1 to n do read(a[i]);
end;

var
  f, trace: array[0..1001] of longint;
procedure dp;
var
  i, j, max, jmax: longint;
begin
  a[n+1] := high(longint);
  f[n+1] := 1;
  a[0] := low(longint);
  for i := n downto 0 do
  begin
    max := 0;
    for j := n + 1 downto i do
        if (a[i] < a[j]) and (max < f[j] + 1) then
        begin
          max := f[j] + 1;
          jmax := j;
        end;
    f[i] := max;
    trace[i] := jmax;
  end;

  writeln(f[0] - 2);
  i := 0;
  i := trace[i];
  repeat
    write(a[i], ' ');
    i := trace[i];
  until i = n + 1;
  readln;
  readln;
end;

begin
  readf;
  dp;
end.

