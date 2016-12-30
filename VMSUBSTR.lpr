program VMSUBSTR;
var
  s: array[1..1000000] of char;
  a: array['A'..'z'] of longint;
  b: array['A'..'z', 'A'..'z'] of longint;
  f: text;
  n: longint;
procedure readf;
var
  i: longint;
  c: AnsiString;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  readln(f, c);
  for i := 1 to n do s[i] := c[i];
end;
procedure init;
var
  i: longint;
begin
  fillchar(a, sizeof(a),0);
  fillchar(b, sizeof(b), 0);
  for i := 1 to n do inc(a[s[i]]);
  for i := 1 to n - 1 do inc(b[s[i], s[i+1]]);
  //for i := n downto 2 do inc(b[s[i], s[i-1]]);
end;

procedure process;
var
  q, res, i, j: longint;
  c: string;
begin
  readln(f, q);
  for i := 1 to q do
  begin
    readln(f, c);
    res := 0;
    for j := 1 to length(c) do inc(res, a[c[j]]);
    for j := 1 to length(c) - 1 do dec(res, b[c[j], c[j+1]]);
    for j := length(c) downto 2 do dec(res, b[c[j], c[j-1]]);
    writeln(res);
  end;
  close(f);
  readln;
end;

begin
  readf;
  init;
  process;
end.

