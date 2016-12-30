program KUMA;
var
  m,i, j ,n, t: longint;
  res: int64;
begin
  readln(m, n, t);
  res := 0;
  i := 0;
  j := 0;
  while i < n do
  begin
    inc(i);
    res := res + t;
    inc(j);
    if j = m then
    begin
      j := 0;
      inc(i);
    end;
  end;
  write(res);
  readln;
end.

