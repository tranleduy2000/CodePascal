program CASO;

var
  res: qword;
  m: longint;
  a: array[1..100001] of longint;

  procedure readf;
  var
    i: longint;
    n, c: longint;
  begin
    m := 0;
    readln(n);
    fillchar(a, sizeof(a), 0);
    for i := 1 to n do
    begin
      Read(c);
      if m < c then
        m := c;
      Inc(a[c]);
    end;
  end;

var
  f: array[0..3, 0..100000] of qword;
  function ank(x, y: longint): qword;
  var
    i, j: longint;
  begin
    for i := 0 to y do f[0, i] := 1;
    //f[0, 0] := 1;
    for i := 1 to x do
        for j := 1 to y do
        if i <= j then
            f[i, j] := f[i,j-1] + f[i-1, j-1]
        else f[i, j] := 0;
    exit(f[x, y]);
  end;


  procedure process;
  var
    i: longint;
  begin
    res := 0;
    //write('m = ', m);
    for i := 1 to m do
    begin
      res := res + ank(2, a[i]);
      //writeln(i, ' ',a[i], ' ', ank(2, a[i]));
    end;
    //writeln;
    Write(res);
    readln;
    readln;
  end;

begin
  readf;
  process;
end.
