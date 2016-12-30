program USCLN;
procedure open;
begin
{$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
end;
var
  a, b: longint;

function lcm(x, y: longint): longint;
begin
     if x mod y = 0 then exit(y)
     else exit(lcm(y, x mod y));
end;

begin
  //open;
  readln(a, b);
  write(lcm(a, b));
  READLN;
end.

