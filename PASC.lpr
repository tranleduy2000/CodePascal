program PASC;

var
  n, i, j: byte;
  a, b: array[0..51] of longint;
begin
  readln(n);
  a[1] := 1;
  for i := 1 to n do
  begin
    b[1] := 1;
    for j := 2 to i do
      b[j] := a[j - 1] + a[j];
    for j := 1 to i do write(b[j], ' ');
    writeln;
    a := b;
  end;
  readln;
end.
