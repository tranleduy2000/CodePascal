var
	a: array[1..100000] of int64;
	d: array[-100000..100000] of longint;
	n, r, i, k: longint;
begin
	readln(n, k);
	for i := 1 to n do read(a[i]);
	
	fillchar(d, sizeof(d), 0);
	for i := 1 to n do inc(d[a[i] mod k]);
	r  := 0;
	
	for i := -99999 to 99999 do if d[i] <> 0 then inc(r);
	writeln(r);
end.
