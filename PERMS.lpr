program PERMS;

var
  x: array[0..10] of byte;
  b: array[0..10] of boolean;
  n: byte;

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
    for j := 1 to n do
      if b[j] then
      begin
        x[i] := j;
        if i = n then
          print
        else
        begin
          b[j] := False;
          find(i + 1);
          b[j] := True;
        end;
      end;
  end;

  procedure gt;
  var
    r: int64;
    i: longint;
  begin

    r := 1;
    for i := 1 to n do
      r := r * i;
    writeln(r);
  end;

begin
  fillchar(b, sizeof(b), True);
  readln(n);
  gt;
  find(1);
end.
