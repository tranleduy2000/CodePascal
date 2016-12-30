program TGVU;
var
  n, i, j: longint;
begin
  {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  for i := n downto 1 do
  begin
    for j := 1 to i do write('*');
    writeln;
  end;
  readln;
end.

