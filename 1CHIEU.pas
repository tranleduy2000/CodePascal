var
	n, m: byte;
	a, b: string;
begin
	readln(n, m);
	readln(a);
	readln(b);
	if ((a[1] = 'L') and (a[n] = 'R') and (b[1] = 'D') and (b[m] = 'U'))
	or ((a[1] = 'R') and (a[n] = 'L') and (b[1] = 'U') and (b[m] = 'D'))
	then write('YES')
	else write('NO');
end.
