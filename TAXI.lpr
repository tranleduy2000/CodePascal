program TAXI;

var
  n, i, j, t, s: longint;
  a: array[1..4] of longint;

  function min(x, y: longint): longint;
  begin
    if x < y then
      exit(x)
    else
      exit(y);
  end;

begin
  readln(n);
  for i := 1 to 4 do
    a[i] := 0;
  for i := 1 to n do
  begin
    Read(t);
    Inc(a[t]);
  end;
  s := a[4];
  a[4] := 0;
  s := s + min(a[1], a[3]);
  t := min(a[1], a[3]);
  a[1] := a[1] - t;
  a[3] := a[3] - t;
  if a[3] > 0 then
    s := s + a[3];

  t := min(a[2], a[1] div 2);
  s := s + min(a[2], a[1] div 2);

  a[2] := a[2] - t;
  a[1] := a[1] - 2 * t;

  if a[2] > 0 then
    begin
      s := s + a[2] div 2;
      a[2] := a[2] mod 2;
    end;

  if a[2] = 1 then
    begin
      s := s + 1;
      a[2] := 0;
      a[1] := a[1] - 2;
    end;
  if a[1] > 0 then
    begin
      s := s + a[1] div 4;
      a[1] := a[1] mod 4;
      if a[1] > 0 then s := s + 1;
    end;
  writeln(s);
  readln;
  readln;
end.
