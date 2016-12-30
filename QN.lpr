program QN;

var
  n: longint;
  a: array[1..10000] of longint;

  procedure sort(l, r: longint);
  var
    i, j, k, t: longint;
  begin
    i := l;
    j := r;
    k := a[(l + R) div 2];
    repeat
      while a[i] < k do
        Inc(i);
      while a[j] > k do
        Dec(j);
      if i <= j then
      begin
        t := a[i];
        a[i] := a[j];
        a[j] := t;
        Inc(i);
        Dec(j);
      end;
    until i > j;

    if i < r then
      sort(i, r);
    if j > l then
      sort(l, j);
  end;

  procedure readf;
  var
    i: longint;
  begin
    readln(n);
    for i := 1 to n do
      Read(a[i]);
  end;

  function bs(k: longint): boolean;
  var
    l, r, m: longint;
  begin
    l := 1;
    r := n;
    while l <= r do
    begin
      m := (l + r + 1) div 2;
      if a[m] = k then
        exit(True);
      if a[m] > k then
        r := m - 1
      else
        l := m + 1;

    end;
    exit(false);
  end;

  procedure process;
  var
    i: longint;
  begin
    i := 0;
    while True do
    begin
      while sqr(round(sqrt(i))) <> i do Inc(i);
      if not bs(i) then
      begin
        Write(i);
        readln;
        exit;
      end;
      inc(i);
    end;

  end;

begin
  readf;
  sort(1, n);
  process;
  readln;
end.
