var
	i: longint;
	n: longint;
begin
	n := 12;
	for i := 16 downto 0 do write(n shr i and 1);
	writeln;
	n := -12;
	for i := 16 downto 0 do write(n shr i and 1);
	writeln;
	readln;
end.
