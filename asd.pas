var
	a, b: array[1..10000] of longint;
	f: text;
	i, j, count, n: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n);
	for i  := 1 to n do read(f, a[i]);
	for i  := 1 to n do read(f, b[i]);
	close(f);
	count := 0;
	i := 1; j := 1;
	while i <= n do
	begin
		while (a[i] < b[j]) and (i <= n) do inc(i);
		while (b[j] < a[i]) and (j <= n) do inc(j);
		if a[i] = b[j] then
		begin
			inc(count);
			inc(i);
		end;
	end;
	writeln(count);
end.
