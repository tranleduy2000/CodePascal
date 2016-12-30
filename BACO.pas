var
	 Xd, c, i, j, Xc, Td, Tc: integer;
	 a: array[1..8, 1..8] of boolean;
	 
begin
	readln(xd, xc, td, tc);
	fillchar(a, sizeof(a), false);
	for i := 1 to 8 do a[xd, i] := true;
	for i := 1 to 8 do a[i, xc] := true;
	for i := 1 to 8 do
		for j := 1to 8 do
			if (i - j = td - tc)  or (i + j = td + tc) then
				a[i, j] := true;
	c := 0;
	for i := 1to 8 do	
		for j := 1 to 8 do if a[i, j] then inc(c);
	write(c);
end.
