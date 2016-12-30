program NGTO2;
const
  maxn = 10000000;
var
    p: array[1..10000000] of boolean;
    n: longint;

procedure seive;
var
  i, j: longint;
begin
  fillchar(p, sizeof(p), true);
  p[1] := false;
  for i := 2 to maxn do
  begin
    if p[i] then
    begin
      j := i + i;
      while j <= maxn do
      begin
        p[j] := false;
        j := j + i;
      end;
    end;
  end;
end;

procedure print;
var
  i, c: longint;
begin
  c := 0;
  for i := 2 to maxn do
  begin
    if p[i] then inc(c);
    if c = n then break;
  end;
  write(i);
end;

begin
  seive;
  readln(n);
  print;
  readln;
end.

