program COVUA;

var
  n, i, j: integer;
  c: string;
begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(n);
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      if (i mod 2 = 1) then
        if (j mod 2 = 1) then
          Write('W')
        else
          Write('B');
      if (i mod 2 = 0) then
        if (j mod 2 = 1) then
          Write('B')
        else
          Write('W');
    end;
    writeln;
  end;
  readln;
end.
