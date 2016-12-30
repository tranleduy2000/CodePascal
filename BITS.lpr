program BITS;

  function getbit(state: longint; j: byte): byte;
  begin
    exit((state shr j) and 1);
  end;

var
  a, b, c: int64;
  i: longint;

begin
  readln(a, b);
  c := 0;
  //for i := 0 to 31 do write(getbit(a, i));
  for i := 0 to 31 do
    if getbit(a, i) <> getbit(b, i) then
      Inc(c);
  Write(c);
  readln;
end.
