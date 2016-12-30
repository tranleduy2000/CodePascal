const maxn = 50000; maxq = 100000; oo = -round(1e9);
type node = record val, lazy: longint; end;
	 query = record typ, x, y, v: longint; end;
	 
var t: array[1..maxn*4] of node;
	q: array[1..maxq] of query;
	n, m: longint;
	
procedure init;
var i, tmp: longint;
	f: text;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, m);
	for i := 1 to n do with t[i] do
	begin
		val := 0;
		lazy := 0;
	end;
	for i := 1 to m do
	begin
		read(f, tmp);
		q[i].typ := tmp;
		if tmp = 0 then readln(f, q[i].x, q[i].y, q[i].v)
		else readln(f, q[i].x, q[i].y);
	end;
	close(f);
end;

procedure down(i: longint);
var tmp: longint;
begin
	tmp := t[i].lazy;
	t[i*2].lazy := t[i*2].lazy + tmp;
	t[i*2].val := t[i*2].val + tmp;
	
	t[i*2+1].lazy := t[i*2 +1].lazy + tmp;
	t[i*2+1].val := t[i*2 +1].val + tmp;
	
	t[i].lazy := 0;
end;

function max(x, y: longint): longint;
begin
	if x > y then exit(x) else exit(y);
end;

procedure updateIT(k, l, r, i, j, val: longint);
var mid: longint;
begin
	if (j < l) or (r <i ) then exit;
	if (i <= l)and (r <= j) then
	begin
		t[k].val := t[k].val + val;
		t[k].lazy := t[k].lazy + val;
		exit;
	end;

	down(k);
	
	mid := (l +r ) div 2;
	updateIT(k*2, l, mid, i, j, val);
	updateIT(k*2+1, mid +1,  r, i, j, val);
	
	t[k].val := max(t[k*2].val, t[k*2+1].val);
end;

function get(k, l, r, i, j: longint): longint;
var mid: longint;
begin	
	if (j < l) or (r < i ) then exit(oo);
	if (i <= l) and (r <= j) then exit(t[k].val);
	down(k);
	mid := (l +r) div 2;
	exit(max(get(k*2, l, mid, i, j), get(k*2 + 1, mid + 1, r, i, j) ));
end;

procedure process;
var i: longint;
begin
	for i := 1to m do 
	begin
		if q[i].typ = 0 then 
			updateIT(1, 1, n, q[i].x, q[i].y, q[i].v)
		else 
			writeln(get(1, 1, n, q[i].x, q[i].y));
	end;
end;

begin
	init;
	fillchar(t, sizeof(t), 0);
	process;
end.
