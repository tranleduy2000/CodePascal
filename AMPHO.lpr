program AMPHO;
var
  m, n: longint;
  a: array[1..100] of longint;
procedure readf;
var
  i: longint;
begin
  readln(n, m);
  for i := 1to n do read(a[i]);
end;

procedure process;
var
  i, j: longint;
begin
  for i := m downto 1 do
  begin
      for j := 1 to n do
          if i - a[j] <= 0 then write('#') else write('.');
      writeln;
  end;
  readln;
  readln;
end;
begin
  readf;
  process;
end.

