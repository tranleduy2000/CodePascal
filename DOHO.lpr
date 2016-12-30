program DOHO;

var
  a, b, t, c, r: integer;
begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(a, b, c);

  r := 0;
  c := c + 1;
  r := c div 60;
  c := c mod 60;

  t := b + r;
  b := (b + r) mod 60;
  r := t div 60;

  a := (a + r) mod 24;

  Write(a, ' ', b, ' ', c);
  readln;
end.
