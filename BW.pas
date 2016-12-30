type
	node = record
		t, v: longint;
	end;
var
	a: array[1..100000*2] of node;
	n: longint;
	
	
procedure swap(var x, y: node);
var
	tmp: node;
begin
	tmp := x;
	x := y;	 
	y := tmp;
end;

procedure sort(l, r: longint);
var
	k1, i, j: longint;
begin
	i := l;
	j := r;
	k1 := a[(l + r) div 2].v;
	repeat
		while (a[i].v < k1) do inc(i);
		while (a[j].v > k1) do dec(j);
		if i <= j then
		begin
			swap(a[i], a[j]);
			inc(i);
			dec(j);
		end;
	until i > j;
	if i < r then sort(i, r);
	if l < j then sort(l, j);
end;

procedure readf;
var
	i: longint;
begin
	readln(n);
	for i := 1 to n do 
		begin
			a[i].t := 0;
			read(a[i].v);
		end;
	for i := n + 1 to 2 * n do 
		begin
			a[i].t := 1;
			read(a[i].v);
		end;
end;

procedure process;
var
	i, count: longint;
begin
	sort(1, 2*n);
	i := 1;
	count := 0;
	while i < n * 2 do
	begin
		if a[i].t <> a[i+1].t then
		begin
			inc(count);
			inc(i, 2);
		end else inc(i);
	end;
	writeln(count);
end;

BEGIN
	readf;
	process;
END.
