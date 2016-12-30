program PALI;

var
  a: array[1..1000] of longint;
  p: array[0..9] of longint;

  procedure init;
  var
    i: longint;
  begin
    p[0] := 1;
    for i := 1 to 9 do
      p[i] := p[i - 1] * 10;
  end;

  function isp(x: longint): boolean;
  var
    t, c, i: longint;
  begin
    t := x;
    c := 0;
    while t > 0 do
    begin
      t := t div 10;
      Inc(c);
    end;
    for i := 1 to c div 2 do
    begin
      if ((x mod p[i] div p[i - 1]) <> (x mod p[c - i + 1] div p[c - i])) then
        exit(False);
    end;
    exit(True);
  end;

  procedure process;
  var
    n, i: longint;
  begin
    readln(n);
    for i := 1 to n do
      Read(a[i]);
    for i := 1 to n do
      if isp(a[i]) then
        Write(a[i], ' ');
    readln;
  end;

begin
{$ifndef ONLINE_JUDGE}
  Assign(input, 'input.txt');
  reset(input);
  Assign(output, 'output.txt');
  rewrite(output);
{$endif}
  init;
  process;
  readln;
end.
