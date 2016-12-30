program DEMSO0;

var
  n: longint;

  function f(x: longint): longint;
  begin
   if x = 0 then
      exit(0)
   else
      exit(x div 5 + f(x div 5));
  end;

begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(n);
  Write(f(n));
  readln;
end.
