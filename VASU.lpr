program NHGA;

var
  n: longint;
  a: array[1..100000] of longint;

  procedure readf;
  var
    i: longint;
  begin
    readln(n);
    for i := 1 to n do
      Read(a[i]);
  end;

  procedure qs(l, r: longint);
  var
    i, j, k, tmp: longint;
  begin
    i := l;
    j := r;
    k := a[(l + r) div 2];
    repeat
      while a[i] > k do
        Inc(i);
      while a[j] < k do
        Dec(j);
      if i <= j then
      begin
        tmp := a[i];
        a[i] := a[j];
        a[j] := tmp;
        Inc(i);
        Dec(j);
      end;
    until i > j;
    if i < r then
      qs(i, r);
    if l < j then
      qs(l, j);
  end;

  procedure process;
  var
    r, i, c: longint;
  begin
    r := 0;
    c := 0;
    for i := 1 to n do
      begin
        if a[i] - c < 0 then break;
        r := r + a[i] - c;
        c := c + 1;
      end;
    write(r);
    readln;
    readln;
  end;

begin
  readf;
  qs(1, n);
  process;
end.
