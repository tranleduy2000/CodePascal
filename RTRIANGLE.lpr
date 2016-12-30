program RTRIANGLE;
var
  n, a: int64;
  c: longint;
begin
  readln(n);
  c := 0;
  while (n > 0) do
  begin
    n := n - c;
    c := c+ 1;
  end;
  if n = 0 then write('YES') else write('NO');
  readln;
end.

