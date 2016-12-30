var
	n, s, t: longint;
	a: array[0..1001, 0..1001] of longint;
	
procedure print;
var
	i, j:longint;
begin
	for i := 1 to n do
	begin
		for j := 1 to n do write(a[i, j], ' ');
		writeln;
	end;
	readln;
end;


procedure builddata;
var
	i, j,m: longint;
begin
	m := 1;
	i := 1;
	j := 1;
	
	fillchar(a, sizeof(a), 0);
	a[1, 1] := 1;
	while m <= n * n - 1 do
	begin	
		
		while (j < n) and (a[i, j +1] = 0) do
		begin
			inc(j);
			inc(m);
			a[i, j] := m;
		end;
	
		while (i < n) and (a[i+1, j] = 0) do
		begin
			inc(i);
			inc(m);
			a[i, j] := m;
		end;
		
		while (j > 1) and (a[i, j-1] = 0) do
		begin
			dec(j);
			inc(m);
			a[i, j] := m;
		end;
		
		while (i > 1) and (a[i-1, j] = 0) do
		begin
			dec(i);
			inc(m);
			a[i, j] := m;
		end;
		
	end;
	print;
end;

var
	queue: array[1..1000000] of longint;
	c: array[0..1001, 0..1001] of longint;
	front,rear: longint;
	
procedure push(v: longint);
begin
	inc(rear);
	queue[rear]: = v;
end;

procedure pop(var v: longint);
begin
	v := queue[front];
	inc(front);
end;

procedure BFS;
begin
	front := 1;
	rear := 0;
	push(s);
	for i := 1 to n do
		for j := 1 to n do c[i, j] := n * n + 1;
	for i := 1 to n do c[i, i] := 0;
	repeat	
		pop(u);
		
	until front > rear;
end;

procedure process;

begin
	n := 5;
	builddata;
end.
