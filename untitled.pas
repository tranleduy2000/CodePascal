uses crt;
var i,j:char;
Begin
	clrscr;
	i:=readkey;
	writeln(i);
	if ord(i)=0 then i:=readkey;
	j:=readkey;
	if ord(j)=0 then j:=readkey;
	writeln(ord(i));
	writeln(ord(j));
	readln;
end.
