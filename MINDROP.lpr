program MINDROP;

var
  n: longint;
  a: array[1..100000] of longint;

  procedure readf;
  var
    i: longint;
  begin
    readln(n);
    for i := 1 to n do Read(a[i]);
  end;

  procedure process;
  var
    m, i, j: longint;
  begin
    i := 1;
    m := 1;
    while i <= n do
    begin
      j := i;
      while (j + 1 <= n) and (a[j] = a[j+1]) do inc(j);
      if j - i + 1 > m then m := j - i + 1;
      //writeln(i,' ', j, ' ');
      i := j + 1;
    end;
    write(n - m);
    readln;
    readln;
  end;

begin
  readf;
  process;
end.
