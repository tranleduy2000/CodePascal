program CEASA;
const
  s1 = 'abcdefghijklmnopqrstuvwxyz';
  le = 26;
var
  s: string;
  c: char;
  i, j, k: longint;
  a: array['a'..'z'] of char;
begin
  readln(s);
  readln(k);
  for i := 1 to 26 do
  begin
    j := i - k;
    if i - k < 1 then
    begin
      j := i - k + le; // abcde i = 3 3
    end;
    a[s1[i]] := s1[j];
  end;
  //for c := 'a' to 'z' do writeln(c, ' ',a[c]);
  //writeln(s1);
  for i := 1 to length(s) do write(a[s[i]]);
  readln;
end.

