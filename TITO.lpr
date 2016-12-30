program TITO;

var
  a1, b1: real;
  t, a, b: int64;
begin
  readln(a1, b1);
  b := trunc(b1);
  a := round(a1);
  if a1 - a > 0 then
    a := a + 1;
  //writeln(a, ' ', b);
  t := ((a + b) * (b - a + 1)) div 2 ;
  Write(t);
  readln;
end.
