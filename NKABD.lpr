var
  l, r: longint;
  f: text;

function isok(x: integer): boolean;
var
  sum: longint;
  i: longint;
begin
  sum := 1;
  for i := 2 to trunc(sqrt(x)) do
  begin
      if (x mod i = 0) then
      begin
        sum := sum + i;
        if (x div i <> i) then sum := sum + x div i;
        if sum > x then exit(true);
      end;
  end;
  exit(false);
end;

procedure readf;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, l ,r );
  close(f);
end;

procedure print(x: longint);
begin
  assign(f, '');
  rewrite(f);
  write(f, x);
  close(F);
end;

procedure process;
var
  i, count: longint;
begin
  count := 0;
  for i := l to r do
      if isok(i) then inc(count);
  print(count);
end;

begin
  readf;
  process;
  //isok(12);
  readln;
end.
