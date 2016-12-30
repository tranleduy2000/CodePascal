var
	a: array[1..5000] of longint;
	n, m: longint;
	f: array[0..50000] of longint;	
	
procedure readf;
var
	i: longint;
begin
	readln(n, m);
	for i := 1 to m do read(a[i]);
end;

procedure dp;
var
	i, j: longint;
begin
	for i := 1 to n do
	begin
		f[i] := 0;
		for j := 1 to m do
		begin
			if a[j] <= i then
				if f[i] < f[i-a[j]] + a[j] then
					f[i] := f[i-a[j]] + a[j];
		end;
	end;
	writeln(f[n]);
end;

begin
	readf;
	dp;
end.
