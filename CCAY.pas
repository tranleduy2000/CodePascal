const maxn = 20000;
var lab: array[1..maxn] of longint; //parent
	n, q, t: longint;
	//goi lab[v] la cha cua v, lab[v] = -1 neu v la goc
	f: text;
function getroot(v: longint):longint;
begin
	while lab[v] > 0 do v := lab[v];
	exit(v);
end;

procedure union(r1, r2: longint);
var x: longint;
begin
	x := lab[r1] + lab[r2];
	if lab[r1] < lab[r2] then
	begin
		lab[r1] := -1;
		lab[r2] := r1;
	end else
	begin
		lab[r1] := r2;
		lab[r2] := x;
	end;
end;

procedure input;
var i, u: longint;
begin
	readln(f, n, q);
	for i := 1 to n do lab[i] := i;
	for i := 1 to n do 
	begin
		read(f, u);
		if u <> 0 then union(u, i);
	end;
	readln(f);
end;

procedure process;
var t, tt, u, r1, r2, v, i: longint;
	cmd: char;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, t);
	for tt := 1 to t do
	begin
		writeln('Case #', tt, ':');
		input;
		for i := 1 to q do
		begin
			read(f, cmd);
			if cmd = 'Q' then
			begin
				readln(f, u, v);
				r1 := getroot(u); r2 := getroot(v);
				if r1 <> r2 then writeln('NO') else writeln('YES');
			end
			else
			begin
				readln(f, u);
				lab[u] := -1;
			end;
		end;
	end;
	close(f);
end;

//-1

begin
	process;
end.
