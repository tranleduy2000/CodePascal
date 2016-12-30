const maxn = 10000; maxe = 500000;
type pnode= ^Tnode;
	 TNode = record
		id, u: longint;
		next: Pnode;
	 end;
	
var f: text;
	e: array[1..maxn] of pnode;
	parent: array[1..maxn, 0..20] of longint;
	nChild, num, low, depth: array[1..maxn] of longint;
	free: array[-maxe..maxe] of boolean;
	freenode: array[1..maxn] of boolean;
	count, n, vertices, birdge: longint;
	isCut: array[1..maxn] of boolean;

function min(x, y: longint): longint;	
begin
	if x < y then exit(x) else exit(y);
end;

procedure pushE(u, p, i: longint);
var t: pnode;
begin
	new(t);
	t^.u := u;
	t^.next := e[p];
	t^.id := i;
	e[p] := t;
end;


procedure input;
var u,m, v, i: longint;
begin
	fillchar(nChild, sizeof(nChild), 0);
	fillchar(isCut, sizeof(isCut), false);
	fillchar(free, sizeof(free), true);
	
	assign(f, 'file.inp');	reset(f);
	readln(f, n, m);
	for i := 1 to m do
	begin
		readln(f, u, v);
		pushE(u, v, i);
		pushE(v, u, -i);
	end;
	close(f);
end;

procedure dfs(u: longint); //p: parent
var t: pnode;
	v, id: longint;
begin
	inc(count);	num[u] := count; low[u] := count;
	t := e[u];
	while t <> nil do
	begin
		id := t^.id;
		if free[id] then
		begin
			free[-id] := false;
			v := t^.u;
			if num[v] > 0 then
				low[u] := min(low[u], num[v])
			else
			begin
				inc(nChild[u]);
				dfs(v);
				if (low[v] >= num[u]) and not isCut[u] then
				begin
					isCut[u] :=  true;
					inc(vertices);
				end;
				if (low[v] > num[u]) then
				begin
					writeln('(', u, ' ', v, ')');
					inc(birdge);
				end;
				low[u] := min(low[u], low[v]);
			end;
		end;
		t := t^.next;
	end;
end;

procedure process;
var u: longint;
begin
	for u := 1 to n do
		if num[u] = 0 then
		begin
			dfs(u);
			if isCut[u] and (nChild[u] < 2) then
			begin
				isCut[u] := false;
				dec(vertices);
			end;
		end;
	for u := 1 to  n do if isCut[u] then write(u, ' ');
	writeln(vertices, ' ', birdge);
end;
begin
	input;
	process;
end.
