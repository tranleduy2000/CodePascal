program VTAY;
var
  n,a , b: integer;

begin       {$ifndef ONLINE_JUDGE}
    assign(input,'input.txt'); reset(input);
    assign(output,'output.txt'); rewrite(output);
{$endif}
  readln(n);
  a := n div 7;
  b := n mod 7;
  //5
  //a = 0
  //b = 5
  //2 5
  {
  12 1 5
  5 2

  17 div 2 mod 3
  4 3

  4 div 0 mod 4
  3 4

  5 div 0 mod 5
  2 5
  }
  if a mod 2 = 0 then write(7 - b, ' ', b);
  if a mod 2 = 1 then write(b, ' ', 7-b);
  readln;

end.

