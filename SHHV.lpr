program SHHV;
var
  s, a, c: array[0..12] of longint;
  b: array[1..12] of boolean;
  k, n: longint;

procedure readf;
var
  f: text;
begin
  assign(f, 'file.inp');
  reset(f);
  n := 0;
  while not SEEKEOLN(f) do
  begin
    inc(n);
    read(f, a[n]);
  end;
  readln(f, k);
  close(f);
end;

procedure init;
var
  i: byte;
begin
  s[0] := 1;
  for i := 1 to n do s[i] := s[i-1] * i;
  fillchar(b, sizeof(b), true);
end;

procedure process;
var
  count, res, i, j, ii: longint;
begin
  res := 0;
  for i := 1 to n do
  begin
    count := 0;
    for j := 1 to n do if b[j] and (j < a[i]) then inc(count);
    res := res + count * s[n-i];
    b[a[i]] := false;
  end;
  writeln(res + 1);


  res := 0;
  fillchar(b, sizeof(b), true);
  for i := 1 to n do
  begin
    for j := 1 to n do if b[j] then
    begin
         ii := j;
         break;
    end;
    while res + s[n-i] < k do
    begin
      inc(ii);
      while not b[ii] do inc(ii);
      res := res + s[n-i];
    end;
    b[ii] := false;
    c[i] := ii;
  end;

  for i := 1 to n do write(c[i], ' ');
  readln;
end;
begin
  readf;
  init;
  process;
end.

