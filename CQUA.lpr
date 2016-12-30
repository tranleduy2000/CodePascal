program CQUA;
var
  a: array[1..100] of integer;
  f: array[0..100, -20000..20000] of boolean;
  s, i, n, j: integer;
begin         {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  s := 0;
  for i := 1 to n do
      begin
        read(a[i]);
        a[i] := a[i] div 100;
        s := s + a[i];
      end;
  if s mod 2 = 1 then write('NO')
  else
  begin
    s  :=  s div 2;
    fillchar(f, sizeof(f), false);
    for i := 0 to n do f[0, -a[i]] := true;
    f[0, 0] := true;
    f[1, -a[i]] := true;
    for i := 1 to n do
        for j := 1 to s do
            f[i, j] :=  f[i-1, j-a[i]] or f[i-1, j + a[i]] or f[i-1, j];
    if f[n, s] then write('YES') else write('NO');
  end;
  readln;
  readln;
end.

