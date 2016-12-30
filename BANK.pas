var
	a, t: array[1..10000] of longint;
	n: longint;
	
procedure readf;
var
	i: longint;
begin
	readln(n);
	for i := 1 to n do readln(a[i], t[i]);
end;

procedure sort(l, r: longint);
var
	k, i, j, tmp: longint;
begin
	i := l;
	j := r;
	k := t[(l + r) div 2];
	repeat
		while t[i] < k do inc(i);
		while t[j] > k do dec(j);
		if i <= j then
		begin
			tmp := a[i];
			a[i] := a[j];
			a[j] := tmp;
			tmp := t[i];
			t[i] := t[j];
			t[j] := tmp;
			
			inc(i);
			dec(j);
		end;
	until i > j;
	if i < r then sort(i, r);
	if j > l then sort(l, j);
end;

function max(x, y: longint): longint;
begin
	if x > y then exit(x)
	else exit(y);
end;

var
	r: array[0..100001, 0..1001] of longint;

procedure DP;
var
	i, j, res: longint;
begin
	sort(1, n);
	//for i := 1 to n do writeln(a[i], ' ', t[i]);
	res := -1;
	{
	* Goi R[i, j] la so tien lon nhat co the thu voi i tg, cong viec 1..j
	* neu khong chon cv j
	* 	r[i, j] = r[i, j-1];
	* neu chon cv thu j, t[j] <= i,
	* 	r[i, j] = r[t[j] - 1, j-1] + a[j];
	* }
	for i := 0 to 1001 do
	begin
		for j := 1 to n do
		begin
			r[i, j] := r[i, j-1]; //neu ko chon
			if t[j] < i then //neu chon ngay thu i
				r[i, j] := max(r[i, j-1], r[t[j], j-1] + a[j]);
			res := max(res, r[i, j]);
		end;
	end;
	writeln(res);
end;

begin
	readf;
	dp;
end.
