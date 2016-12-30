program project2;
var
  n: integer;
begin
  readln(n);
  writeln((n div 100) + (n mod 10) * 100 + (n mod 100 - n mod 10));
  readln;
end.

