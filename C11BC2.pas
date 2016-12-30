const maxn = 10010;
var a: array[1..maxn, 1..maxn] of boolean;
	n, m: longint;
	d: array[1..maxn] of longint;
	free: array[1..maxn] of boolean;
	count: longint;
	
procedure dfs(u: longint);
var v: longint;
begin
	free[u] := false;
	d[u] := count;
	for v := 1 to n do if a[u, v] and free[v] then dfs(v);
end;
procedure connect;
var u: longint;
begin
	fillchar(free, sizeof(free), true);
	count := 0;
	for u := 1 to n do if free[u] then
	begin
		inc(count);
		dfs(u);
	end;
end;
	
procedure process;
var i, u, v, k: longint;
	f: text;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, m);
	fillchar(a, sizeof(a), false);
	for u := 2 to n do
	begin
		readln(f, v, k);
		if k = 1 then
		begin
			a[u, v] := true;
			a[v, u] := true;
		end;
	end;
	
	connect;
	for i := 1 to m do
	begin 
		readln(f, u, v);
		if d[u] <> d[v] then writeln('YES') else writeln('NO');
	end;
	close(f);
end;

BEGIN
	process;
END.
