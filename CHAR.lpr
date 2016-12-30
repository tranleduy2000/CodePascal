program CHAR;
var
  a: array[1..255] of boolean;
  r, i: integer;
  s: string;
begin
  fillchar(a, sizeof(a), false);
  r := 0;
  readln(s);
  for i := 1 to length(s) do
  begin
    if not a[ord(s[i])] then
    begin
      inc(r);
      a[ord(s[i])] := true;
    end;
  end;
  write(r);
  readln;
end.

