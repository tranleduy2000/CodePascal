program CODEN;
var
  r, n, m: longint;
begin
  readln(n, m);
  r := n div 2 + m div 2;
  n := (n mod 2)* m;
  m := (m mod 2)* n;

end.

