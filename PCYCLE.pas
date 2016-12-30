//euler
const oo = -10000000;
var
	a: array[0..201, 0..201] of longint;
	free: array[1..200] of boolean;
	n, m: longint;
procedure readf;
var f: text;
	i, j, u, v, c: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, m);
	for i := 1 to n do
		for j := 1 to m do a[i, j] := oo;
	for i := 1 to m do
	begin
		readln(f, u, v, c);
		a[u, v] := c;
		a[v, u] := c;
	end;
	close(f);
end;

function canGoBack(u, v, c: longint): boolean;
var
	free: array[1..200] of boolean;
	tmp,k, tmp2: longint;
	queue: array[1..200] of longint;
	f, r: longint;
begin
	if a[u, v] + c < 0 then exit(false);
	fillchar(free, sizeof(free), true);
	tmp := a[u, v];
	tmp2 := u;
	a[u, v] := oo;
	a[v, u] := oo;
	
	f := 1;
	r := 1;
	queue[1] := u;
	free[u] := false;
	repeat
		u := queue[f]; inc(f); //pop
		for k := 1 to n do
			if (a[u, k] <> oo) and free[k] then
			begin
				writeln('index ', k, ' u ', u);
				inc(r);
				queue[r] := k;
				free[k] := false;
				if u = v then break;
			end;
	until f > r;
	a[tmp2, v] := tmp;
	a[v, tmp2] := tmp;
	
	writeln('k = ', k, ' v = ', v, ' u = ', u, ' restore ', a[u, v]);
	if u = v then exit(true);
	exit(false);
end;

function findEuler(u: longint): boolean;
var count, v, next, c: longint;
	b: boolean;
begin
	c := 0;
	next := 0; count := 0;
	repeat
		writeln('c = ', c);
		next := 0;
		for v := 1 to n do 
		begin
			if (a[u, v] <> oo) and (u <> v) and (a[u, v] + c >= 0) then 
			begin
				next := v;
				b := canGoBack(u, v, c);
				writeln('find next: u = ', u, ' v = ', v, ' c = ', c, ' a[u, v] = ', a[u, v], ' ', b);
				if b then break;
			end;
		end;
		writeln('> ', u, ' -> ', next, ' ', a[u, next]);
		
		if next = 0 then break;
		inc(count);
		
		c := c + a[u, next];
		u := next;
		
		a[u, v] := oo;
		a[v, u] := oo;
		
		writeln;
	until false;
	writeln;
	if count = m then exit(true);
	exit(false);
end;

procedure process;
var ok: boolean;
	u: longint;
begin
	for u := 1 to n do
	begin
		ok := findEuler(u);
		writeln('res ', u ,  '  ', ok);
		writeln('============');
	end;
end;
begin
	readf;
	process;
end.
