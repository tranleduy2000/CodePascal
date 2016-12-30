program VMMTFIVE;
var
  a, t, t2: array[0..6, 0..6] of integer;
  rh, rc: array[0..5] of integer;
  free: array[1..25] of boolean;
    stop : boolean;
procedure readf;
var
  f: text;
  i: integer;
begin
  assign(f, 'file.inp');
  reset(f);
  for i := 1 to 5 do read(f, rh[i]);
  for i := 1 to 5 do read(f, rc[i]);
  close(f);
end;


procedure print;
var
  i, j: integer;
begin
  for i := 1 to 5 do
  begin
    for j := 1 to 5 do write(a[i, j], ' ');
    writeln;
  end;  writeln;
end;

procedure find(x, y: integer);
var
  x1, y1, i: integer;
begin
  if stop then exit;
  for i := 1 to 25 do
      if free[i] then
      begin

      end;
end;
begin
  readf;
  fillchar(free, sizeof(free), true);
  fillchar(t, sizeof(t), 0);
  stop := false;
  find(1, 1);
  readln;
end.

