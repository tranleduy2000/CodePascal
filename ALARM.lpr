program ALARM;
const
  a :array[0..9] of integer = (6, 2, 5, 5, 4, 5, 6, 3, 7, 6);

var
  n: integer;
function val(x: integer): integer;
var
  r: integer;
begin
  if x div 10 = 0 then
    exit(a[0] + a[x])
  else
    begin
      r := a[x mod 10];
      x := x div 10;
      r := r + a[x];
      exit(r);
    end;
end;

procedure process;
var
  h, m, i, j: integer;
begin
  for i := 0 to 23 do
      for j := 0 to 59 do
          begin
            if val(i) + val(j)= n then
              begin
                if i div 10 = 0 then write('0', i)
                else write(i);
                write(':');
                if j div 10 = 0 then write('0', j)
                else write(j);
                readln;
                exit;
              end;
          end;
  write('Impossible');
  readln;
end;
begin
  readln(n);
  process;
end.

