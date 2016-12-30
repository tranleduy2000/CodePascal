var
	n, r: longint;
begin
	r := 0;
	readln(n);
	while n > 0 do
	begin
		r := r * 10 + n mod 10;
		n := n div 10;
	end;
	write(r);
	readln;
end.
