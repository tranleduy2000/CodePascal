program MKC;

var
  s, c: string;
  r, t, e, i: integer;
begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(s);
  r := 0;
  for i := 1 to length(s) do
  begin
    val(s[i], t, e);
    r := r + t;
  end;
  Write(r);
  readln;
end.
