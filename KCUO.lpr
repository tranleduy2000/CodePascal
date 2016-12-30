program KCUO;

var
  n, x, y, t, s, c, i, j: integer;

begin
 readln(n);
  s := -1;
  c := 2;
  for i := 1 to n do
  begin
    if i > n div 2 + 1 then c := -2;
    s := s + c;
    t := s div 2;
    x := (n div 2 + 1) - t;
    y := (n div 2 + 1) + t;
    for j := 1 to n do
    begin
      if (x <= j) and (j <= y) then
        Write('D')
      else
        Write('*');
    end;
    writeln;
  end;

  readln;
end.
