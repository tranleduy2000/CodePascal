var
	graph: array[-100..100, -100..100] of longint;
	n: longint;
	
procedure init(x1, y1, x2, y2: longint);
var
	i, j: longint;
begin
	for i := x1 to x2 do
		for j := y1 to y2 do inc(graph[i, j]);
end;

procedure readf;
var
	i: longint;
	x1, y1, x2, y2: longint;
begin
	readln(n);
	fillchar(graph, sizeof(graph), 0);
	for i := 1 to n do
	begin
		readlN(x1, y1, x2, y2);
		init(x1, y1, x2, y2);
	end;
end;

procedure process;
var
	i, j, count: longint;
begin
	//q1
	count := 0;
	for i := -100 to 100 do
		for j := -100 to 100 do
			if 		(graph[i, j] <> 0)
				and (graph[i+1, j] <> 0)
				and (graph[i+1, j+1] <> 0)
				and (graph[i, j+1] <> 0) then inc(count);
	writeln(count);
	
	count := 0;
	for i := -100 to 100 do
		for j := -100 to 100 do
			if 	(graph[i, j] = n)
				and (graph[i+1, j] = n)
				and (graph[i+1, j+1] = n)
				and (graph[i, j+1] = n) then inc(count);
	writeln(count);
end;

begin
	readf;
	process;
end.
