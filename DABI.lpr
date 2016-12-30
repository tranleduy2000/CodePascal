program DABI;

var
  n, t, r: qword;
begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(n);
  t := n;
  r := 0;
  while t > 0 do
  begin
    r := r + t mod 10;
    t := t div 10;
  end;
  if n mod r = 0 then
    Write(1)
  else
    Write(0);
  readln;
end.
