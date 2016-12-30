program NAUAN;

var
  n, i, m, tmp: longint;
  a, b: array[0..10000] of longint;

  function bs(key: longint): longint;
  var
    l, r, mi: longint;
  begin
    l := 1;
    r := n;
    while l <= r do
    begin
      mi := (l + r + 1) div 2;
      if a[mi] = key then
        exit(mi);
      if a[mi] > key then
        r := mi - 1
      else
        l := mi + 1;
    end;
    if a[l] < key then
      exit(r)
    else
      exit(l);
  end;

begin
  readln(n);
  a[0] := 0;
  for i := 1 to n do
  begin
    Read(a[i]);
    a[i] := a[i - 1] + a[i];
  end;
  readln(m);
  for i := 1 to m do
  begin
    Read(b[i]);
    Write(bs(b[i]), ' ');
  end;
  readln;
  readln;
end.
