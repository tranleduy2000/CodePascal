var
	n: longint;
	nghin, tram, chuc, donvi: byte;
begin
	write('Nhap n = ');
	readln(n);
	donvi := n mod 10;
	n := n div 10;
	chuc := n mod 10;
	n := n div 10;
	tram := n mod 10;
	n := n div 10;
	nghin := n mod 10;
	write(nghin, ' nghin '); 
	write(tram,  ' tram ');
	write(chuc, ' chuc ');
	write(donvi, ' don vi');
	readln;
end.
