program TROXE;

var
  a: array[2000..10000] of longint;

  procedure readf;
  var

    i, k, c: longint;
  begin
    fillchar(a, sizeof(a), 0);
    readln(k);
    for i := 1 to k do
    begin
      readln(c);
      Inc(a[c mod 10000]);
    end;
  end;

  procedure process;
  var
    i: longint;
    r: int64;
  begin
    r := 0;
    for i := 2010 to 9999 do
      if a[i] > 5 then
        r := r + 100 + a[i] - 5
      else if a[i] > 0 then
        r := r + 100;
    Write(r);
    readln;
    readln;
  end;

begin
  readf;
  process;

end.
