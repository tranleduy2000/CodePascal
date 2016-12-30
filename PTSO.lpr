program PTSO;
var
  n, i: longint;
  s, c: string;
begin
  readln(n);
  i := 2;
  while n > 1 do
  begin
    if (n mod i = 0) then
    begin
      str(i, c);
      s := s + c + '*';
      n := n div i;
    end
    else inc(i);
  end;
  write(copy(s, 1, length(S) - 1));
  readln;
end.

