program GACHO;
{
m + n = 3a + 5b;
}

var
   dx, dy, d, n, m, i: longint;
   x, y: real;
begin
{$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n, m);
  d := 2;
  dx := 4 * n - m;
  dy := m - 2 * n;
  x := dx / d;
  y := dy / d;
  if (x = round(x)) and (y = round(y)) and (x >= 0) and (y >= 0) then write(round(x),' ', round(y))
  else
  write(-1);
  readln;
end.

