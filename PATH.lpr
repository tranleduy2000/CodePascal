Uses Crt;
type mang=Array[1..15,1..15] of integer;
Var A,b:mang;
m,n:byte;
i,j,k,d: Integer;

begin
clrscr;
write('Nhap so hang n = ');readln(n);
write('Nhap so cot m = ');readln(m);
For i:=1 to n do
For j:=1 to m do
begin
write('B[',i,',',j,']=');
readln(B[i,j]);
end;

For i:=1 to n do
Begin
For j:=1 to m do
Write(B[i,j]:6);
Writeln;
End;

for i:=1 to n do
begin
for j:=1 to m do
if b[i,j]<>0 then
begin
if b[i,j]=b[j,i] then
if (b[j,i+1]=b[j,i+2]) then
inc(d);
end;
end;
writeln(d);
readln;
end.
