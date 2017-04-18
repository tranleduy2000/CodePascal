var
	a: array[0..10000] of longint;
	f: array[0..10000] of longint;
	n, k: longint;
	
procedure readf;
var
	f: text;
	i: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, k);
	for i := 1 to n do read(f, a[i]);
	close(f);
end;

function max(x, y: longint): longint;
begin if x > y then exit(x) else exit(y); end;

procedure dp;
var
	i, j, res: longint;
begin
	{goi f[i] la tong diem lon nhat dat duoc khi di den o thu i}
	res := 0;
	
	for i := 1 to n do
	begin
		f[i] := -1000000;
		for j := k downto 1 do
			if i - j >= 0 then
				f[i] := max(f[i-j] + a[i], f[i]);
	
		res := max(res, f[i]);
	end;
	writeln(res);
end;

begin
	readf;
	dp;
end.
