program TREAT;
const
  maxn = 100000;
var
  lab: array[1..maxn] of longint;
  free: array[1..maxn] of boolean;
  n: longint;

procedure readf;
var
  u, v: integer;
  f: text;
begin
     assign(f, 'file.inp');
     reset(f);
     readln(f, n);
     for u := 1 to n do
         begin
           readln(f, v);
           lab[u] := v;
         end;
     close(f);

end;

procedure process;
var
  u, v, count: longint;
begin
     for u := 1 to n do
         begin
           count := 1;
           free[u] := false;
           v := lab[u];
           while free[v] do
           begin
             free[v] := false;
             inc(count);
             v := lab[v];
           end;
           writeln(count);
         end;
end;

begin
  readf;
  process;
  readln;
end.

