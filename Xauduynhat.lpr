program Xauduynhat;
var
  s: AnsiString;
  i, j, max, n: longint;
  a: array['A'..'z'] of boolean;
begin
  readln(s);
  max := 1;
  i := 1;
  n := length(s);
  while i <= n do
  begin
    fillchar(A, sizeof(a), true);
    j := i;
    while (a[s[j]]) and (j <= n) do
    begin
      a[s[j]] := false;
      inc(j);
    end;
    dec(j);
    if j - i  + 1> max then
    begin
         max := j - i + 1;
         //writeln(i, ' ',j, ' ', max);
    end;
    i := i + 1;
  end;
  write(max);
  readln;
end.

