program HOHA2;
var
  r, n: int64;
  i: longint;
begin
  readln(n);
  for i := 1 to trunc(sqrt(n)) do
      if n mod i = 0 then
      begin
        r := r + i;
        if n div i <> i then r := r + n div i;
      end;
  if r - n = n then write('YES') else write('NO');
  readln;
end.

