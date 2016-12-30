const
  maxn = 100000;
var
  n, m: longint;
  w, v: array[0..40] of longint;
  c: array[0..40, 0..maxn] of longint;

procedure readf;
var
  f: text;
  i: longint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n, m);
  for i:= 1 to m do readln(f, w[i], v[i]);
  close(f);
end;

function max(x, y: longint): longint;
begin
  if x > y then max:= x else max := y;
end;

procedure dp;
var
  i, j: longint;
begin
  //c[i, j]
  //max money can collect 1..i vs j money
  for i := 1 to n do
      for j := 1 to m do
          begin
            if w[i] <= j then
              c[i, j] := max(c[i-1, j], c[i-1, j - w[i]] + v[i])
            else c[i, j] := c[i-1, j];
          end;
  writeln(c[n, m]);
  readln;
end;

begin
  readf;
  dp;
end.

