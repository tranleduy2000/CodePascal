program GAGI;
var
  c, a, b: longint;
begin
  {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(a, b);
  c := 0;
  while a * 2 <= b do
  begin
    inc(c);
    a := a * 2;
  end;
  write(c);
  readln;
end.

