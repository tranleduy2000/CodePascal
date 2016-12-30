program FIBO;
var
  f: array[1..30] of longint;
var
  n, i: byte;
begin              {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  f[1] := 1;
  f[2] := 1;
  for i := 3 to n do f[i] := f[i-2] + f[i-1];
  for i := 1 to n do write(f[i], ' ');
  readln;
end.

