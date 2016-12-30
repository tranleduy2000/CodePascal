const maxn = 100000;
Type Pnode = ^Tnode;
	 TNode = record
		u: longint;
		next: Pnode;
	 end;
var e: array[1..maxn] of Pnode;
	num, low, parent: array[1..maxn] of longint;
	free: array[1..maxn] of boolean;
	
procedure init;
var i: longint;
begin
	for i := 1 to n do e[i] := nil;
end;

procedure pushE(u, p:  longint);
var t: pnode;
begin
	new(t);
	t^.u := u;
	t^.next := e[p];
	e[p] := t;
end;

procedure input;
var f: text;
	i: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, m);
	init;
	for i := 1 to m do
	begin
		readln(f, u, v);
		pushE(u, v);
		pushE(v, u)
	end;
	close(f);
end;

procedure dfs(u: longint);
var t: pNode;
	v: longint;
begin
	t := e[u];
	while t <> nil do
	begin
		v := t^.u;
		parent[v] := u;
		dfs(v);
	end;
end;

BEGIN
END.
