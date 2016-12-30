program DIKI;

var
  n, m: longint;
  a: array[1..100000] of longint;

  function bs(k, l, r: longint): longint;
  var
    mid: longint;
  begin

    while l <= r do
    begin
      mid := (l + r + 1) div 2;
      if a[mid] = k then
        exit(mid);
      if a[mid] > k then
        r := mid - 1
      else
        l := mid + 1;
    end;
    exit(-1);
  end;

  procedure readf;
  var
    i: longint;
  begin
    readln(n, m);
    for i := 1 to n do
      Read(a[i]);
  end;

  procedure process;
  var
    i, tmp: longint;
  begin
    for i := 2 to n do
      if a[i] - m >= 0 then
      begin
        //write('a');
        if bs(a[i] - m, 1, i - 1) <> -1 then
        begin
          tmp := bs(a[i] - m, 1, i - 1);
          if a[tmp] > a[i] then
            Write(a[i], ' ', a[tmp])
          else
            Write(a[tmp], ' ', a[i]);
          readln;
          readln;
          exit;
        end;
      end;
    Write(-1);
  end;

begin
  readf;
  process;
end.
