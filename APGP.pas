var
	a, b, c: longint;
begin
	readln(a, b, c);
	repeat
		
		if c = (b - a + b) then
		begin
			write('AP ');
			writeln(c + b - a);
		end
		else
		begin
			write('GP ');
			writeln(c * (b div a));
		end;
		readln(a, b, c);
	until (a = 0) and (b = 0) and (c = 0);
end.
