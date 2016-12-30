const
  maxp = 10000000;
var
  p: array[1..maxp] of boolean;

function pow(x, y: integer): longint;
var
  i: integer;
begin
  pow := 1;
  for i := 1 to y do pow := pow * x;
end;

procedure seive(max: longint);
var
  i, j: longint;
begin
  fillchar(p, sizeof(p), true);
  p[1] := false;
  for i := 2 to max do
  begin
    if p[i] then
    begin
      j := i + i;
      while j <= max do
      begin
        p[j] := false;
        j := j + i;
      end;
    end;
  end;
end;

function symmetry(x: longint): boolean;
var
  s: string;
  n, i: integer;
begin
  str(x, s);
  n := length(s);
  for i := 1 to n div 2 do
    if s[i] <> s[n-i+1] then exit(false);
  exit(true);
end;

procedure process;
var
  i, count, a, b: longint;
  tmp: string;
begin
  readln(a, b);
  count := 0;
  str(b, tmp);
  seive(pow(10, length(tmp)));

  for i := a to b do
      if p[i] then
         if symmetry(i) then inc(count);
  writeln(count);
  readln;
end;
begin

  process;
end.

