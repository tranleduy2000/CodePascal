program BINAS;

var
  n: byte;
  a: array[1..20] of byte;

  procedure print;
  var
    i: byte;
  begin
    for i := 1 to n do
      Write(a[i]);
    writeln;
  end;

  procedure find(i: byte);
  var
    j: byte;
  begin
    for j := 0 to 1 do
    begin
      a[i] := j;
      if i = n then
        print
      else
        find(i + 1);
    end;
  end;

begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  readln(n);
  find(1);
  readln;
end.
