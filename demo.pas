var
	n, s, i, j: longint;
	f: array[0..1000000] of boolean;
	a: array[1..10000] of longint;
	fi: text;
begin
	fillchar(f, sizeof(f), false);
	assign(fi, 'file.inp');
	reset(fi);
	readln(fi, n);
	s := 0;
	for i := 1 to n do 
	begin
		read(fi, a[i]);
		s := s + a[i];
	end;
	
	close(fi);
	f[0] := true;
	for i := 1 to n do
	begin
		for j := s downto a[i] do 
			f[j] := f[j-a[i]] or f[j];
	end;
			
	for i := 1 to s do write(f[i], ' ');
	readln;
end.
