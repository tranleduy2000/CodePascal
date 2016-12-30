program GIDA;

var
  a, b: array[1..100000] of longint;
  n: longint;

  procedure sorta(l, r: longint);
  var
    i, j, t, k: longint;
  begin
    i := l;
    j := r;
    k := a[(l + r) div 2];
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
      sorta(i, r);
    if l < j then
      sorta(l, j);
  end;

  procedure sortb(l, r: longint);
  var
    i, j, t, k: longint;
  begin
    i := l;
    j := r;
    k := b[(l + r) div 2];
    repeat
      while b[i] < k do
        Inc(i);
      while b[j] > k do
        Dec(j);
      if i <= j then
      begin
        t := b[i];
        b[i] := b[j];
        b[j] := t;
        Inc(i);
        Dec(j);
      end;
    until i > j;
    if i < r then
      sortb(i, r);
    if l < j then
      sortb(l, j);
  end;

  procedure readf;
  var
    i: longint;
  begin
    readln(n);
    for i := 1 to n do
      Read(a[i]);
    for i := 1 to n do
      Read(b[i]);
  end;

  function bs(k, l, r: longint): longint;
  var
    m: longint;
  begin
    if l > r then
      exit(-1);
    //writeln('Search ', k, ' ', l, ' > ', r);
    while l < r do
    begin
      m := (l + r + 1) div 2;
      if a[m] >= k then r := m - 1
      else l := m;
      //writeln(l, ' ', r, ' ', m, ' ', a[m]);
    end;
    //writeln(l);
    if a[l] < k then
      exit(l);
    exit(-1);
  end;

  procedure process;
  var
    i, t, j, c: longint;
  begin
    //for i := 1 to n do
    //  Write(a[i], ' ');
    //writeln;
    //for i := 1 to n do
    //  Write(b[i], ' ');
    //writeln;
    i := n;
    c := 0;
    for j := n downto 1 do
    begin
      t := bs(b[j], 1, i);
     // writeln(' t = ', t);
      if t <> -1 then
      begin
        i := t - 1;
        Inc(c);
      end
      else
        break;
    end;
    writeln(c);
    readln;
    readln;
  end;

begin
  readf;
  //writeln;
  sorta(1, n);
  sortb(1, n);
  process;
end.
