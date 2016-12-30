program Capxach;

var
  n, m: longint;
  c: array[1..1000] of longint;
  f: array[0..10000, 0..100] of int64;

  procedure readf;
  var
    i: longint;
  begin
    readln(n, m);
    for i := 1 to m do
      Read(c[i]);
  end;

  procedure process;
  var
    i, j: longint;
  begin
    for i := 0 to m do
      f[0, i] := 1;
    for i := 1 to n do
      for j := 1 to m do
        if i >= c[j] then
          f[i, j] := f[i - c[j], j] + f[i, j - 1]
        else
          f[i, j] := f[i, j - 1];
    write(f[n, m]);
    readln;
    readln;
  end;

begin
  readf;
  process;
end.
