program PLOI;

var
  n: longint;
  a, b, r: array[1..104] of longint;

  procedure readf;
  var
    i: longint;
  begin
    fillchar(b, sizeof(b), 0);
    readln(n);
    for i := 1 to n do
      Read(a[i]);
  end;

  procedure process;
  var
    i,t , c: longint;
  begin
    c := 0;
    t := 0;
    for i := 1 to n do
    begin
      Inc(b[a[i]]);
      if b[a[i]] = 3 then
      begin
        b[a[i]] := 0;
        inc(t);
        r[t] := a[i];
      end;
    end;
    writeln(t);
    for i := 1 to t do write(r[i], ' ');
    readln;
    readln;
  end;

begin
  readf;
  process;
end.
