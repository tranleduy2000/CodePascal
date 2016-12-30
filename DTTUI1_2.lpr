program DTTUI1_2;
var
  n, m: longint;
  w, v: array[0..40] of longint;
  s, t: array[0..40] of longint;
  max: longint;
procedure readf;
var
  f: text;
  i: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n, m);
  for i := 1 to n do readln(f, w[i], v[i]);
  close(f);
end;

procedure find(i: byte);
begin
  writeln(i, ' ',s[i-1], ' max = ', max);
  if w[i] <= m - s[i-1] then
  begin
    if i = n then
    begin
      if max < t[i] then max := t[i];
    end else
    begin
      if max < t[i] then max := t[i];
      find(i + 1);
    end;

    // choose
    t[i] := t[i-1] + v[i];
    s[i] := s[i-1] + w[i];
    if i = n then
    begin
      if max < t[i] then max := t[i];
    end else
    begin
      if max < t[i] then max := t[i];
      find(i + 1);
    end;
  end
  else
  begin
    if i = n then
    begin
      if max < t[i] then max := t[i];
    end else
    begin
      find(i + 1);
    end;
  end;
end;
begin
  readf;
  max := 0;
  find(1);
  write(max);
  readln;
end.
