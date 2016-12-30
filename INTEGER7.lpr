program INTEGER7;
var
  a1, b1, a2, b2: int64;
procedure process;
var
  min, xmin, ymin, i: longint;
  tmp: qword;
begin
  readln(a1, b1, a2, b2);
  min := high(longint);
  for i := 1 to 100000 do
  begin
      tmp :=  round((a1*i+b1-b2)/a2);
      if (a1*i+b1-b2)/a2 = tmp then
      begin
        if i + tmp < min then
        begin
          min :=  i + tmp;
          xmin := i;
          ymin := tmp;
        end;
      end;
  end;
  writeln(xmin, ' ', ymin);
  readln;
end;
begin
  process;
end.
{
a1 * x1 + b1 = a2 * x2 + b2 và x1 + x2
x2 = (a1*x1+b1-b2)/a2
}
