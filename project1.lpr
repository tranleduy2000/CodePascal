uses crt;
const max=8;
ng:array[1..8] of -2..2=(-2,-2,-1,1,2,2,1,-1);
d:array[1..8] of -2..2=(-1,1,2,2,1,-1,-2,-2);
var
x,y:byte;
u,v,k,dem,i,j,nsq,n:integer;
a:array[1..max,1..max] of byte;
procedure nhap;
var
i,j:byte;
begin
writeln('nhap n va x,y');
readln(n,x,y);
fillchar(a,sizeof(a),0);
a[x,y]:=1;
nsq:=n*n;
end;
procedure hien;
var i,j:integer;
begin
inc(dem);
for i:=1 to n do
begin
for j:=1 to n do write(a[i,j]:4);
writeln;
end;
readln;
end;
procedure tryx(k:byte;x,y:integer);
var i,j:byte;
u,v:integer;
begin
if k>nsq then hien
else
for i:=1 to 8 do
begin
u:=x+ng[i];
v:=y+d[i];
if (u in [1..n]) and (u in [1..n]) and (a[u,v]=0) then
begin
a[u,v]:=k;
tryx(k+1,u,v);
a[u,v]:=0;
end;
end;
end;
begin
clrscr;
nhap;
tryx(2,x,y);
end.
