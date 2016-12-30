
var
  x: array[0..10] of byte;
  n, k: byte;

  procedure print;
  var
    i: byte;
  begin
    for i := 1 to n do
      Write(x[i]);
    writeln;
  end;

  procedure find(i: byte);
  var
    j: byte;
  begin
    for j := 1 to k do
      begin
        x[i] := j;
        if i = n then
          print
        else
          find(i + 1);
      end;
  end;

  function pow(x, y: longint): qword;
  var
    r: qword;
    i: longint;
  begin
    r := 1;
    for i := 1 to y do
      r := r * x;
    exit(r);
  end;

begin
  readln(k, n);
  writeln(pow(k, n));
  find(1);
  readln;
  readln;
end.

