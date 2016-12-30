program COUNTNUM;
var
  s: string;
  c, i: byte;

begin
  readln(s);
  while s[1] = ' ' do delete(s, 1, 1);
  while pos('  ', s) > 0 do delete(s, pos('  ', s), 1);
  while s[length(s)] = ' ' do delete(s, length(s) ,1);
  c := 0;
  for i := 1 to length(s) do if s[i] = ' ' then inc(c);
  write(c + 1);
  readln;
end.

