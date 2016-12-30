program BABE;
var
  a, b: longint;

function u(x: longint): longint;
var
  sum, i: longint;
begin
  sum := 0;
  for i :=1  to trunc(sqrt(x)) do
  begin
    if x mod i = 0 then
    begin
      sum := sum + i;
      if x div i <> i then sum := sum + x div i;
    end;
  end;
  exit(sum - x);
end;

begin {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(a, b);
  if (u(a) = b) and (u(b) = a) then
     write('YES')
  else write('NO');
  readln;
end.

