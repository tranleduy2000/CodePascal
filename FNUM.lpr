program FNUM;
var
  a: byte;
  s, i, t: longint;
  e: byte;
  st: AnsiString;
begin
  readln(st);
  s := 0;
  for i := 1 to length(st) do
  begin
    val(st[i], a, e);
    s := s + a;
  end;
  while s div 10 > 0 do
  begin
    t := 0;
    while s > 0 do
    begin
      t := t + s mod 10;
      s := s div 10;
    end;
    s := t;
  end;
  write(s);
  readln;
end.

