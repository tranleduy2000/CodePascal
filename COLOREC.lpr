program COLOREC;
const
  maxn = 200;
var
  a: array[-maxn..maxn, -maxn..maxn] of byte;
  c: array[1..4, 1..4] of longint;
  n: longint;
  res: int64;
procedure readf;
var
  f: text;
  i, u, v, m: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  fillchar(a, sizeof(a), 0);
  for i := 1 to n do
  begin
    readln(f, u, v, m);
    a[u, v] := m;
  end;
  close(f);
end;

function min(x, y: byte): byte;
begin
  if x < y then exit(x) else exit(y);
end;

function max(x, y: byte): byte;
begin
  if x > y then exit(x) else exit(y);
end;

procedure process;
var
  x1, x2, y: longint;
begin
  res := 0;
  for x1 := -maxn to maxn - 1 do
      for x2 := x1 + 1 to maxn do
      begin
        //c[i, j] sl diem co 2 mau i, j;
        fillchar(c, sizeof(c), 0);
        for y := -maxn to maxn do
        begin
          if a[x1, y] * a[x2, y] > 0 then
             inc(c[min(a[x1, y], a[x2, y]), max(a[x1, y], a[x2, y])]);
        end;
        inc(res,c[1, 2]*c[3, 4] +  c[1, 4]*c[2, 3] + c[1, 3]*c[2, 4]);
      end;
  writeln(res);
  readln;
end;

begin
  readf;
  process;
end.


