program GITHU;
var
  n, i: byte;
  res: qword;
begin
               {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
        readln(n);
  res := 1;
  for i := 2 to n do res := res * i;
  write(res);
  readln;
end.

