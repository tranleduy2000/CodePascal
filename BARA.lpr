program BARA;
var
  n, k, r: longint;
begin
  readln(n, k);
  if n < k then write(10) else
  begin
    n := n * 2;
    r := (n div k) * 5;
    n := n mod k;
    if n <> 0 then r := r + 5;
    write(r);
  end;
  readln;
end.


