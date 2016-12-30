const
	dx : array[1..2] of shortint = (0, 1); //di chuyen ngang
	dy : array[1..2] of shortint = (1, 0); // di chuyen xuong
	
var
	n, m: byte;
	a: array[1..30, 1..30] of 0..1;
	res,
	dirX, dirY, //luu duong di hien tai
	bestX, bestY //luu duong di tot nhat
	: array[1..30] of 0..1;
	max: int64;
	
procedure readf; //doc file
var
	i, j: byte;
	f: text;
begin
	assign(f, 'file.inp'); Reset(f);
	readln(f, n, m);
	for i := 1 to n do
		for j := 1 to m do read(f, a[i, j]);
	close(f);
end;

procedure updateResult; //cap nhat ket qua
var
	r: int64;
	i: byte;
begin
	r := 0;
	for i := n+m-1 downto 1 do
		if res[i] = 1 then r := r + res[i] shl (n + m - i-1);
	if r > max then
	begin
		max := r; //cap nhat max
		bestX := dirX;
		bestY := dirY; //cap nhat duong di
	end;
end;

//kiem tra co di ra ngoai bang
function range(x, y: byte): boolean;
begin
	if (x <= n) and (y <= m) then exit(true)//trong
	else exit(false); //ngoai
end;

procedure find(x, y, i: byte); //de quy
var
	j, tmpx, tmpy: byte;
begin
	for j := 1 to 2 do //xet 2 huong
	begin
		tmpx := x + dx[j];
		tmpy := y + dy[j];
		if range(tmpx, tmpy) then // ko vuot qua gioi han
		begin
			res[i] := a[tmpx, tmpy]; 
			dirX[i] := tmpX;
			dirY[i] := tmpY;
			if (tmpx = n) and (tmpy = m) then //o cuoi cung
				updateResult
			else
				find(tmpx, tmpy, i+1); //goi tiep tuc
		end;
	end;
end;

procedure print; //in kq
var
	i: longint;
begin
	writeln(max);
	for i := 2 to n + m - 1 do writeln(bestX[i], ' ', bestY[i]);
	readln;
end;

BEGIN
	readf;
	
	max := -1;
	res[1] := a[1, 1];
	dirX[1] := 1;
	dirY[1] := 1;
	
	find(1, 1, 2); //bat dau di tu o [1, 1]
	print;
END.
