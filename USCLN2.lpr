program USCLN2;

var
  x, y: QWord;

  function u(a, b: qword): QWord;
  begin
    if a mod b = 0 then
      exit(b)
    else
      exit(u(b, a mod b));
  end;

begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(x, y);
  Write(u(x, y));
  readln;
end.
