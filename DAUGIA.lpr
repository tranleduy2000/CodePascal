program DAUGIA;
var
  a, b: longint;

function ip(x: longint): boolean;
var
  i: longint;
begin
  for i := 2 to trunc(sqrt(x)) do
      if x mod i = 0 then exit(false);
  exit(true);
end;

function ok(x: longint): boolean;
var
  s: string;
  i, n: integer;
begin
  str(x, s);
  n := length(s);
  for i := 1 to n div 2 do
  begin
    if s[i] <> s[n-i+1] then exit(false);
  end;
  exit(true);
end;

procedure process;
var
  r, i: longint;
begin
  r := 0;
  for i := a to b do
     if ip(i) and ok(i) then inc(r);
  write(r);
  readln;
end;

begin
  readln(a, b);
  process;
end.

