var 
	f: array[0..32, 0..1] of longint;
	n: longint;

function max(x, y: longint): longint;
begin
	if x > y then exit(x) else exit(y);
end;

procedure dp;
var i: longint;
begin
	readln(n);
	
	{
	* f[i, 1] la trung vien cuoi
	* f[i, 0] la hut vien cuoi
	* nếu bắn trúng viên i
	* 	f[i, 1] := f[i-1, 0] + f[i-1, 1];
	* nếu bắn hụt
	* 	f[i, 0] := f[i-1, 1];
	* }
	f[1, 0] := 1;
	f[1, 1] := 1;
	for i := 2 to n do
	begin
		f[i, 1] := f[i-1, 0] + f[i-1, 1];
		f[i, 0] := f[i-1, 1];
	end;
	writeln(f[n, 0], ' ', f[n, 1]);
	//0101
	//0110
	//0111
	//1010
	//1011
	//1101
	//1111
end;

begin
	dp;
end.
