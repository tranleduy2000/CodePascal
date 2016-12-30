program project3;
var
  x, y, n: integer;
  a, b: array[1..1001] of integer;
procedure readf;
var
  f: text;
  i: integer;
begin
  assign(f, 'file.inp'); reset(f);
  readln(f, n, x, y);
  for i := 1 to n do readln(f, a[i], b[i]);
  close(f);
end;

function max(x, y: real): real;
begin
  if x > y then exit(x) else exit(y);
end;

procedure process;
var
  i, j: integer;
  res: real;
begin
  res := 0;
  for i := 1 to n - 1 do
      for j := i + 1 to n do
          begin
            res := max(res, x / a[i] + y / b[j]);
            res := max(res, x / a[i] + y / b[j]);
            res := max(res, y / b[i] + x / a[i]);
            res := max(res, y / b[i] + x / a[j]);
          end;
  writeln(res:0:2);
  readln;
end;

begin
  readf;
  process;
end.

