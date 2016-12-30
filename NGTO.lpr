program NGTO;
procedure open;
begin
{$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
end;

function ispri(x: int64): boolean;
var
  i: longint;
begin
  if x < 2 then exit(false);
  if x = 2 then exit(true);
  for i := 2 to trunc(sqrt(x)) do if x mod i = 0 then exit(false);
  exit(true);
end;
var
  n: int64;
begin
  readln(n);
  if ispri(n) then write('YES') else write('NO');
  readln;
end.

