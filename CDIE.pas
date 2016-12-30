var
	n, m, s: integer;
	a: array[0..101] of integer;
	i, j, tmp: integer;
	
begin
	readln(n, m);
	for i := 1to n do read(a[i]);
	for i := n-1 downto 1 do
		for j := 1 to n do
			if a[j] < a[j+1] then
			begin
				tmp := a[j];
				a[j] := a[j+1];
				a[j+1] := tmp;
			end;
	if m <= 1 then write(0)
	else
	begin
		i := 2;
		s := a[1];
		while i <= n do
		begin
			if s < m then
			begin
				s := s + a[i] - 1;
				inc(i);
			end
			else break;
		end;
		if s < m then write(-1)
		else write(i-1);
	end;
end.
