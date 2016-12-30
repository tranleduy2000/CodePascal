program SPBINARY;
var
  f: array[0..600, 0..600, 0..1] of qword;
  i, j,n, k: integer;

begin
  readln(n, k);
  f[1, 1, 1] := 1; //1
  f[1, 1, 0] := 1; //0
  f[1, 0, 1] := 1;
  f[1, 0, 0] := 1;
  //00 01 11
  for i := 2 to n do
      for j := 1 to k do
             if j <= i then
             begin
               f[i, j, 0] := f[i-1, j, 1] + f[i-1, j-1, 0];
               f[i, j, 1] := f[i-1, j, 0] + f[i-1, j-1, 1];
             end;

  writeln(f[n, k, 0] + f[n, k, 1]);
  readln;
end.

