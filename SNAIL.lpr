program SNAIL;

var
  v, a, b, r: longint;
begin
  readln(a, b, v);
  v := v - a;
  r := 1;
  if v > a - b then
  begin
       r := r + v div (a - b);
       v := v mod (a - b);
  end;
  if v > 0 then r := r + 1;
  write(r);
  readln;
end.
