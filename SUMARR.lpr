program SUMARR;

var
  a, t: array[0..10000000] of longint;
  n, q: longint;
  qx, res: longint;

  procedure buildIT(k, l, r: longint);
  var
    m: longint;
  begin
    if l > r then
      exit;
    if (l = r) then
    begin
      t[k] := a[l];
      exit;
    end;
    m := (l + r) div 2;
    buildIT(k * 2, l, m);
    buildIT(k * 2 + 1, m + 1, r);
    t[k] := t[k * 2] + t[k * 2 + 1];
  end;

  procedure updateIT(k, l, r, i: longint);
  var
    m: longint;
  begin
    if (i < l) or (r < i) then
      exit;
    if (l = r) then
    begin
      t[k] := a[i];
      exit;
    end;
    m := (l + r) div 2;
    updateIT(k * 2, l, m, i);
    updateIT(k * 2 + 1, m + 1, r, i);
  end;

var
  f: Text;

  procedure readf;
  var
    i: longint;
  begin
    //Assign(f, 'file.inp');
    //reset(f);
    readln(n, q);
    n := n - 1;
    for i := 0 to n-1 do
      Read(a[i]);
    readln(a[n]);
  end;

  function get(k, l, r, i, j: longint): longint;
  var
    m: longint;
  begin
    if (j < l) or (r < i) then
      exit(0);
    if l = r then
      exit(t[k]);
    m := (l + r) div 2;
    exit(get(k * 2, l, m, i, j) + get(k * 2 + 1, m + 1, r, i, j));
  end;

  procedure process;
  var
    i, j: longint;
    c: char;
  begin
      //for j :=  0 to n do
      //    Write(a[j], ' ');
      //  writeln;
    for i := 1 to q do
    begin
      Read( c);
      readln( qx, res);
      if c = 'S' then
      begin
        //writeln('GEt ', qx, ' ', res);
        writeln(get(1, 0, n, qx, res))
      end
      else if c = 'U' then
      begin
        a[qx] := a[qx] + res;
        //for j :=  0 to n do
        //  Write(a[j], ' ');
        //writeln;
        updateIT(1, 0, n, qx);
      end
      else if c = 'V' then
      begin
        a[qx] := a[qx] - res;
        updateIT(1, 0, n, qx);
      end;
    end;
  end;

begin
  readf;
  buildIT(1, 0, n);
  process;
  //Close(f);
  readln;
end.
