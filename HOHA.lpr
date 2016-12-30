program HOHA;
var
  n: longint;

procedure process(x: longint);
var
  sum, i: longint;
begin
  sum:= 0;
  for i := 1 to trunc(sqrt(x)) do
  begin
    if x mod i = 0 then
    begin
      sum := sum + i;
      if x div i <> i then
      begin
           sum := sum + x div i;
           writeln(x div i);
      end;
      if sum > x then
      begin
        //write('NO');
        //exit;
      end;
      writeln(i);
    end;
  end;
  writeln('sum = '
  if sum = x then write('YES') else write('NO');
  readln;
end;
begin
//  {$ifndef ONLINE_JUDGE}
//    assign(input,'input.txt'); reset(input);
//    assign(output,'output.txt'); rewrite(output);
//{$endif}
        readln(n);
        process(n);
end.

