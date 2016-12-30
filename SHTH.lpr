program SHTH;
const
  maxn = 300;
var
  c: array[0..maxn, 0..maxn] of AnsiString;
  b: array[1..maxn] of boolean;
  a: array[1..maxn] of integer;
  n, k: integer;
  s: AnsiString;

function add(x, y: AnsiString): AnsiString;
var
  t1,i, t2, r1, r2, e: integer;
  res: AnsiString;
  ct: string;
begin
  while length(x) < length(y) do x := '0' + x;
  while length(x) > length(y) do y := '0' + y;
  r2 := 0;
  res := '';
  for i := length(x) downto 1 do
  begin
    val(x[i], t1, e);
    val(y[i], t2, e);
    r1 := (t1 + t2 + r2) mod 10;
    r2 := (t1 + t2 + r2) div 10;
    str(r1, ct);
    res := ct + res;
  end;
  if r2 > 0 then res := '1' + res;
  exit(res);
end;

function sub(x, y: AnsiString): AnsiString;
var
  t1,i, t2, r1, r2, e: integer;
  res: AnsiString;
  c: string;
begin
  while length(x) < length(y) do x := '0' + x;
  while length(x) > length(y) do y := '0' + y;
  r2 := 0;
  res := '';
  for i := length(x) downto 1 do
  begin
    val(x[i], t1, e);
    val(y[i], t2, e);
    r1 := t1 - t2 - r2;
    if r1 < 0 then
    begin
      r2 := 1;
      r1 := r1 + 10;
    end;
    str(r1, c);
    res := c + res;
  end;
  exit(res);
end;

procedure init;
var
  i, j: integer;
begin
  //writeln(n, ' ', k);
  fillchar(b, sizeof(b), true);

  c[0, 0] := '1';
  for i := 1 to n do
      for j := 1 to n do c[i, j] := '0';

  for i := 1 to n do
  begin
      for j := 0 to n do
          begin
            if i <= j then
               c[i, j] := add(c[i, j-1], c[i-1, j-1])
            else c[i, j] := '0';
            write(i, ' ', j, ' ', c[i, j], ' ; ');
          end;
     writeln;
  end;
  readln;
 // writeln(c[k, n]);
end;

procedure readf;
var
  f: text;
  i: integer;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n, k);
  readln(f, s);
  for i := 1 to k do read(f, a[i]);
  close(f);
end;

//< true; >= false
function compare(x, y: AnsiString): boolean;
begin
  while length(x) < length(y) do x := '0' + x;
  while length(x) > length(y) do y := '0' + y;
  if x < y then exit(true)
  else exit(false);
end;

procedure process1;
var
  res: array[0..maxn] of integer;
  i, j: integer;
  sum, tmp: AnsiString;
begin
  sum := '0';
  res[0] := 0;
  for i := 1 to k do
      begin
        j := res[i-1] + 1;
        while not b[j] do inc(j);
        repeat
          tmp := add(sum, c[k-i + 1,n-j]);
          writeln('i = ', i, ' ', 'j = ', j, ' res = ', tmp, '; c[k-i,n-j] = ', c[k-i,n-j]);
          writeln(compare(tmp, s));
          if not compare(tmp, s) then break;

          res[i] := j;
          b[j] := false;
          sum := add(sum, tmp);

          writeln(k-i, ' ', n - j, ' ',tmp);
          while not b[j] do inc(j);
        until false;
      end;

  //writeln('>>>>>>>>>>>>>>>>>>>>>>.');
  for i := 1 to k do write(res[i], ' ');
  readln;
end;

procedure process2;
begin

end;

procedure process;
begin
  process1;
  process2;
end;

begin
  readf;
  init;
  process;
end.

