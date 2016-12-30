program SUBSTR;
var
  s, t: ansistring;
  kmp: array[1..10000000] of longint;

procedure readf;
begin
  readln(t);
  readln(s);
end;

procedure process;
var
  m, n, k, i: longint;
begin
  m := length(s);
  n := length(t);
  kmp[1] := 0;
  for i := 2 to m do
  begin
    k := kmp[i-1];
    while (k > 0) and (s[i] <> s[k+1]) do k := kmp[k];
    if s[i] = s[k+1] then k := k + 1;
    kmp[i] := k;
  end;
  //for i := 1to m do write(kmp[i],  ' ');
  //writeln;

  k := 0;
  for i := 1 to n do
  begin
    while (k > 0) and (t[i] <> s[k+1]) do k := kmp[k];
    if s[k+1] = t[i] then
    begin
      inc(k);
      if k = m then
      begin
        write(i - m + 1, ' ');
        k := kmp[m];
      end;
    end;
  end;
  readln;
end;

begin
  readf;
  process;
end.

