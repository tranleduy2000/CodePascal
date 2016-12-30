program TILE;
var
  n, i, j, t: integer;
  r: longint;
  a: array[1..100] of byte;

begin
  readln(n);
  for i := 1 to n do read(a[i]);

  for i := n-1 downto 1 do
      for j := 1 to i do
          if a[j] > a[j+1] then
          begin
               t := a[j];
               a[j] := a[j+1];
               a[j+1] := t;
          end;

  r := 1;

  for i := 1 to n do write(a[i]);
   i := 2;
  writeln;
  while i <= n do
  begin
    //writeln(r, ' ', i);
    if r <= a[i] then inc(r);
    inc(i);
  end;
  write(r);
  readln;
  readln;
end.

