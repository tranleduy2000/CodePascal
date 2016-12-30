program BINA;
var
  n: longint;
  res, c: string;
begin
{$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  res := '';
  if n = 0 then res := '0';
  while n > 0 do
  begin
    str(n mod 2, c);
    res := c + res;
    n := n div 2;
  end;
  write(res);
  readln;
end.

