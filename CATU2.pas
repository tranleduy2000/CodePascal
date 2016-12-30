var
	n,m : longint;
	w, v: array[1..100] of longint;
	res: array[1..100] of boolean;
	
procedure readf;
var
	i: longint;
begin
	readln(n, m);
	for i := 1 to n do readln(w[i], v[i]);
end;
function max(x, y: longint): longint;
begin
	if x > y then exit(x) else exit(y);
end;
var
	f: array[0..100, 0..100] of longint;
procedure dp;
var
	i, j: longint;
begin
	fillchar(f, sizeof(f), 0);
	for i := 1 to n do
		for j := 1 to m do
			if w[i] <= j then f[i, j] := max(f[i-1, j], f[i-1, j-w[i]] + v[i])
			else f[i, j] := f[i-1, j];
	writeln(f[n, m]);
	j := m;
	for i := n downto 1 do
	begin
		if f[i, j] = f[i-1, j-w[i]] + v[i] then
		begin
			write(i, ' ');
			j := j - w[i];
		end;
	end;
end;
begin
	readf;
	dp;
end.
