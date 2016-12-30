program TIGU;
var
  c, n, m: longint;
begin
  readln(n, m);
  c := 0;
  while n < m do
  begin
    n := n + round(n / 10);
    inc(c);
  end;
  write(c);
  readln
end.

