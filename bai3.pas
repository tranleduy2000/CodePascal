var f, a: array[0..10000] of longint;
	n, m: longint;
	
procedure readf;
var f: text;
	i: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, m);
	for i := 1 to n do readln(f, a[i]);
	close(f);
end;

procedure sort(l, r: longint);
var	i, j, tmp, key: longint;
begin
	i := l;
	j := r;
	key := a[(l+r) div 2];
	repeat
		while a[i] < key do inc(i);
		while a[j] > key do dec(j);
		if i <= j then
		begin
			tmp := a[i]; a[i] := a[j]; a[j] := tmp;
			inc(i); dec(j);
		end;
	until i > j;
	if i < r then sort(i, r);
	if l < j then sort(l, j);
end;

procedure dp;
var i, j: longint;
	min: longint;
	tmp, tmp2: longint;
begin
	f[0] := 0;
	f[1] := 1;
	for i := 1to n do write(a[i], ' ');
	writeln;
	for i := 2 to n do
	begin
		f[i] := f[i-1] + 1;
		for j := i - 1 downto 1 do	
			if a[i] div a[j] > 1 then
			begin
				f[i] := f[i] + (a[i] div a[j] - 1) * f[j];
				break;
			end;
		if f[i] > m then 
		begin
			writeln('res = ', a[i], ' ');
			exit;
		end;
	end;
	//res
	min := 111111111;
	for i := 1 to n do 
	begin
		tmp := (m div f[i]) * a[i];
		if m < tmp * f[i] then tmp := tmp + a[i];
		if tmp < min then
		begin
			writeln(i);
			min := tmp;
		end;
	end;
	writeln('res = ', min);
end;

begin
	readf;
	sort(1, n);
	dp;
end.
