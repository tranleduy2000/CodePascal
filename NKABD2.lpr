const
  maxn = 1000000;
var
  a: array[1..maxn] of int64;
  l, r: longint;
procedure seive;
var
  i, j, m: longint;
begin

  for i := 1 to r do
  begin
    j := 1;
    m := i;
    while m <= r do
    begin
      m := i * j;
     // writeln(m, ' i = ', i);
      inc(a[m], i);
      inc(j);
    end;
    //for j := 1 to 20 do write(a[j] - j, ' ');
   // writeln;
  end;

    //for j := 1 to r do writeln(j, ' ',a[j], ' ');
    //writeln;
end;

procedure readf;
begin
  readln(l, r);
end;

procedure process;
var
  i, count: longint;
begin
  count := 0;
  for i := l to r do
  begin
    //writeln(i,' ', a[i]);
    if a[i] - i > i then inc(count);
  end;
  write(count);
  readln;
end;

begin
  readf;
  seive;
  process;
end.

