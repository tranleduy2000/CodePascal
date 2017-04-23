const maxn  = 300001;
var
	b, pos, bit: array[0..maxn] of longint;
	s, a: array[0..maxn] of int64;
	n, l, r: longint;
	res: int64;
procedure readf;
var
	f: text;
	i: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n, l, r);
	a[0] := 0;
	for i := 1 to n do
	begin
		read(f, a[i]);
		if (l <= a[i]) and (r >= a[i]) then inc(res);
	end;
	close(f);
end;

procedure swap(var a, b: int64);
var
	tmp: int64;
begin
	tmp := a;
	a := b;
	b := tmp;
end;
procedure swapl(var a, b: longint);
var
	tmp: longint;
begin
	tmp := a;
	a := b;
	b := tmp;
end;

procedure sort(l, r: longint);
var
	k: int64;
	i, j: longint;
begin
	if r <= l then exit;
	i := l; j := r;
	k := a[(l+r) div 2];
	repeat
		while (a[i] < k) do inc(i);
		while (a[j] > k) do dec(j);
		if i <= j then
		begin
			swap(a[i], a[j]);
			swap(pos[i], pos[j]);
			inc(i); dec(j);
		end;
	until i > j;
	sort(i, r);
	sort(l, j);
end;

{
* (j -> i) L <= s[i] - s[j-1] <= R
* -> s[i] - R <= s[j-1] -> a3
* -> s[i] - L >= s[j-1] -> a2
* }
procedure zip;
var
	i, count: longint;
	last: longint;
begin
	for i := 1 to n do
	begin
		s[i] := s[i-1] + a[i];
		a[i+n] := s[i] - L;
		a[i+2*n] := s[i] - R;
		a[i] := s[i-1];
	end;
	for i := 1 to 3 * n do pos[i] := i;
	sort(1, 3*n);
	count := 1;
	last := high(longint);
	for i := 1 to 3 * n do
	begin
		if last <> a[i] then
		begin
			last := a[i];
			inc(count);
		end;
		b[pos[i]] := count;
	end;
end;

procedure update(i, v: longint);
begin
	while i <= 3*n do
	begin
		inc(bit[i], v);
		inc(i, i and -i);
	end;
end;

function get(i: longint): longint;
var
	res: longint;
begin
	res := 0;
	while i > 0 do
	begin
		inc(res, bit[i]);
		dec(i, i and -i);
	end;
	exit(res);
end;

procedure process;
var
	i: longint;
begin
	fillchar(bit, sizeof(bit), 0);
	for i := 1 to n do
	begin
		inc(res, get(b[n+i]) - get(b[2*n+i]));
		update(b[i], 1);
	end;
	writeln(res);
end;

begin
	readf;
	zip;
	process;
end.
