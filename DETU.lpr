program DETU;
var
  s: string;
  c, i: byte;

begin
  readln(s);
  while (length(s) > 0) and (s[1] = '.') do delete(s, 1, 1);
  while pos('..', s) > 0 do delete(s, pos('..', s), 1);
  while (length(s) > 0) and (s[length(s)] = '.') do delete(s, length(s) ,1);
  c := 0;
  //write(s);
  for i := 1 to length(s) do if s[i] = '.' then inc(c);
  if length(s) = 0 then write(0) else
  write(c + 1);
  readln;
end.

