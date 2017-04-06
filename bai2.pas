var 
	a, f, trace: array[0..5000] of longint;
	n: longint;
	
procedure readf;
var f: text;
	i: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n);
	for i := 1 to n do read(f, a[i]);
	close(f);
end;

procedure dp;
var
	max, i, j: longint;
begin
	a[0] := 1;
	f[0] := 1;
	fillchar(f, sizeof(f), 0);
	for i := 1 to n do
	begin
		f[i] := 1;
		trace[i] := 0;
		for j := i - 1 downto 0 do
		begin
			if (a[i] mod a[j] = 0) and (f[j] + 1 > f[i]) then
			begin
				f[i] := f[j] + 1;
				trace[i] := j;
			end;
		end;
	end;
	max := 0;
	for i := 1 to n do
		if f[max] < f[i] then max := i;
	writeln(f[max], ' ',max);
	while max <> 0 do
	begin
		write(a[max], ' ');
		max := trace[max];
	end;
end;

begin
	readf;
	dp;
end.
