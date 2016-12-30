program MAHO;

var
  s, sb, se: string;
  c: char;
  k, i, j: integer;
begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(s);
  readln(k);
  sb := copy(s, 1, k);
  se := copy(s, k + 1, length(s) - k + 1); //abc k=2
  j := length(sb);
  for i := 1 to length(sb) div 2 do
  begin
    c := sb[i];
    sb[i] := sb[j - i + 1];
    sb[j - i + 1] := c;
  end;
  j := length(se);
  for i := 1 to length(se) div 2 do
  begin
    c := se[i];
    se[i] := se[j - i + 1];
    se[j - i + 1] := c;
  end;
  Write(sb);
  writeln(se);
  readln;
end.
