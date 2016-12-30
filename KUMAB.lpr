program KUMAB;
var
  res, n, a, b: integer;
begin        {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  res := 0;
  b := n div 10;
  while n > 0 do
  begin
    res := res + b * 10;
    n := n mod 10 + b * 3;
    b := n div 10;
    if n < 10 then
    begin
      res := res + n;
      break;
    end;
  end;
  write(res);
  readln;
end.
