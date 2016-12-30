var
  f: text;
  n: longint;
  a, b: array[1..10000] of longint;

procedure readf;
var
  i: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  for i := 1 to n do read(f, a[i]);
  for i := 1 to n do read(f, b[i]);
  close(f);
end;

procedure sorta(d, c: longint);
var
  i, j, key, tmp: longint;
begin
  i := d;
  j := c;
  key := a[(d + c) div 2];
  repeat
    while a[i] < key do inc(i);
    while a[j] > key do dec(j);
    if i <= j then
    begin
      if i < j then
      begin
        tmp := a[i];
        a[i] := a[j];
        a[j] := tmp;
      end;
      inc(i);
      dec(j);
    end;
  until i > j;

  if (i < c) then sorta(i, c);
  if (d < j) then sorta(d, j);
end;

procedure sortb(d, c: longint);
var
  i, j, key, tmp: longint;
begin
  i := d;
  j := c;
  key := b[(d + c) div 2];
  repeat
    while b[i] < key do inc(i);
    while b[j] > key do         dec(j);
    if i <= j then
    begin
      if i < j then
      begin
        tmp := b[i];
       b[i] :=b[j];
        b[j] := tmp;
      end;
      inc(i);
      dec(j);
    end;
  until i > j;
  if (i < c) then sortb(i, c);
  if (d < j) then sortb(d, j);
end;

function getmax(a, b: longint): longint;
begin
  if a > b then getmax := a else getmax := b;
end;


procedure process;
var
  count , i, j, max: longint;
begin
  sorta(1, n);
  sortb(1, n);
  i := 1;
  j := 1;
  count := 1;
  max := getmax(a[1], b[1]);
  while (i <= n) and (j <= n) do
  begin
    while (a[i] <= max) and (i <= n) do inc(i);
    while (b[j] <= max) and (j <= n) do inc(j);
    if (i > n) or (j > n) then break;
    inc(count);
    max := getmax(a[i], b[j]);
  end;
  write(count);
  readln;
end;

begin
  readf;
  process;
end.

