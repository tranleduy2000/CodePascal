const
  maxC = 1000002;
  maxn = 102;
var
  n: longint;
  c(*trace*): array[1..maxn, 1..maxn] of longint;
procedure readf;
var
  f: text;
  u, v: shortint;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  for u := 1 to n do
      for v := 1 to n do
      begin
          read(f, c[u, v]);
          if (u <> v) and (c[u, v] = 0) then c[u, v] := maxC;
      end;
  close(f);
end;

procedure floyd;
var
  u, v, k: shortint;
begin
  //for u := 1 to n do
      //for v := 1 to n do trace[u, v] := v;
  for k := 1 to n do
      for u := 1 to n do
          for v := 1 to n do
          if c[u, k] + c[k, v] < c[u, v] then
          begin
            c[u, v] := c[u, k] + c[k, v];
            //trace[u, v] := trace[u, k];
          end;
end;

//procedure tracef(u, v: longint);
//begin
//  repeat
//    write(u, ' ');
//    u := trace[u, v];
//  until u = v;
//  write(v);
//  writeln;
//end;

procedure process;
var
  free: array[1..maxn] of boolean;
  sum, min: int64;
  u, v, i: shortint;
  stop: boolean;
begin
  readf;
  floyd;
  sum := 0; u := 1;
  for i := 1 to n do free[i] := true;
  repeat
    stop := true;
    min := maxC;
    for i := 2 to n-1 do
        if free[i] and (c[u, i] < min) then
        begin
          v := i;
          min := c[u, i];
          stop := false;
        end;
    if stop then break;
    sum := sum + min;
    free[v] := false;
    u := v;
  until false;
  sum := sum + c[u, n];
  writeln(sum);
end;

begin
  process;
  readln;
end.
