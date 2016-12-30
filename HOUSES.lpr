program HOUSES;
const
  maxl = 100+10;
  maxn = 100+10;
var
  a: array[0..maxn] of integer;
  x, last: array[0..maxl] of integer;
  l, n, s: integer;
  count: integer;
  free: array[0..maxl] of boolean;

function compare: boolean;
var
  i: integer;
begin
  //for i := 1 to n + l - s do write(a[last[i]]); writeln;
  //for i := 1 to n + l - s do write(a[x[i]]); writeln;
  for i := 1 to n + l - s do
      if a[last[i]] > a[x[i]] then exit(true);
  exit(False);
end;

procedure print;
var
  i, j: integer;
begin
  //if compare then exit;
  for i := 1 to n + l - s do
      begin
           for j := 1 to a[x[i]] do write(x[i], ' ');
           if a[x[i]] = 0 then write('0 ');
      end;
  inc(count);
  writeln;
  last := x;
  if count = 1000 then halt;
end;

procedure find(i: integer);
var
  j: integer;
begin
  for j := 1 to n + l - s do
      if free[j] then
      begin
        x[i] := j;
        if i < n + l - s then
        begin
          free[j] := false;
          find(i + 1);
          free[j] := true;
        end
        else print;
      end;
end;

procedure readf;
var
  i: integer;
  f: text;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, l, n);
  s := 0;
  for i := 1 to n do
      begin
        read(f, a[i]);
        s := s + a[i];
      end;
  for i := n + 1 to n + l - s do a[i] := 0;
  close(f);
end;

procedure process;
var
  i: integer;
begin
  fillchar(free, sizeof(free), true);
  fillchar(last, sizeof(last), 0);
  for i := 1 to n do
      begin
           x[1] := i;
           free[i] := false;
           find(2);
           free[i] := true;
      end;
  readln;
end;

begin
  count := 0;
  readf;
  process;
end.

