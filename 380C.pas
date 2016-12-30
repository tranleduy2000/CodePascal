const maxn = 1000000;
type node = record
		optimal, open, close: longint;
	 end;
var t: array[1..4*maxn] of node;
	s: string;
	n, m: longint;
	
function min(x, y: longint): longint;
begin
	if x < y then exit(x) else exit(y);
end;

function add(var node1, node2: node): node;
var res: node;
	tmp: longint;
begin
	tmp := min(node1.open, node2.close);
	//())   ((()
	res.optimal := node1.optimal + node2.optimal + tmp;
	res.open := node1.open  + node2.open - tmp;
	res.close := node1.close + node2.close - tmp;
	exit(res);
end;

function getnode(opt, op, cl: longint): node;
var tmp: node;
begin
	tmp.optimal := opt;
	tmp.open:= op;
	tmp.close := cl;
	exit(tmp);
end;

procedure buildIT(k, l, r: longint);
var mid: longint;
begin
	if l = r then
	begin
		if s[l] = '(' then t[k] := getnode(0, 1, 0)
		else t[k] := getnode(0, 0, 1); //)
		exit;
	end;
	mid := (l + r) div 2;
	buildIT(k*2, l, mid);
	buildIT(k*2 + 1, mid +1 , r);
	t[k] := add(t[k*2], t[k*2+1]);
end;

function query(k, l, r, i, j: longint): node;
var mid: longint;
	node1, node2, res: node;
begin
	if (j < l) or (r <i) then exit(getnode(0, 0, 0));
	if (i <= l) and (r <= j) then exit(t[k]);
	mid := (l + r) div 2;
	node1 := query(k*2, l, mid, i, j);
	node2 := query(k*2 + 1, mid + 1, r, i, j);
	res := add(node1, node2);
	exit(res);
end;

procedure process;
var qx, qy: array[1..maxn] of longint;
	i: longint;
begin
	readln(s);
	readln(m);
	for i := 1 to m do readln(qx[i], qy[i]);
	n := length(s);
	buildIT(1, 1, n);
	for i := 1 to m do
	begin
		writeln(query(1, 1, n, qx[i], qy[i]).optimal * 2);
	end;
end;

begin
	process;
end.
