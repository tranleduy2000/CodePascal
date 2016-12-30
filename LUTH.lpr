program LUTH;
const e = 10000;
var
  x, n: int64;
function f(x, y: int64): int64;
begin
  if y = 1 then exit(x mod e);
  exit(x * f(x, y-1) mod e);
end;

begin
  readln(x, n);
  x := x mod e;
  n := n mod e;
  write(f(x, n));
  readln;
end.

