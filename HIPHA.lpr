program HIPHA;
var
  n, res, i, t: integer;
begin
  {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  res := 0;
  for i := 1 to n do
  begin
    read(t);
    if t = 1 then dec(res) else inc(res);
  end;
  write(abs(res));
  readln;
  readln;
end.

