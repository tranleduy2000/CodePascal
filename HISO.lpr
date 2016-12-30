program HISO;

var
  n, m: longint;
  a, b, c: array[1..100000] of longint;
  i, j: longint;

  function min(X, y: longint): longint;
  begin
    if x < y then
      exit(x)
    else
      exit(y);
  end;

  function max(X, y: longint): longint;
  begin
    if x > y then
      exit(x)
    else
      exit(y);
  end;

begin
  readln(n);
  for i := 1 to n do
    Read(a[i]);
  m := 0;

  b[1] := a[1];
  for i := 2 to n do
    b[i] := min(b[i - 1], a[i]);

  c[n] := a[n];
  for i := n - 1 downto 1 do
    c[i] := max(c[i + 1], a[i]);
  m := 0;
  for i := 2 to n do
  begin
    m := max(m, c[i] - b[i - 1]);
    m := max(m, c[i + 1] - b[i]);
  end;
  Write(m);
  readln;
  readln;
end.
