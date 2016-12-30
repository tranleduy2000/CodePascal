program TRAU;
//a b c
//a + b + c = n
//15*a + 9*b + c = 3*m
var
  n, m, i, j, k: integer;
begin
  readln(n, m);
  for i := 1 to m div 5 do
      for j := 1 to m div 3 do
          for k := 1 to n - i - j do
          begin
            if (i + j + k = n) and (15*i + 9*j + k = 3*m) then
               begin
               writeln(i,' ', j, ' ', k);
               readln;
               exit;
               end;
          end;
  write(-1);
  readln;
end.

