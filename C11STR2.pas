const base = round(1e9) + 3;
var
	a, b: ansistring;
	ha, hb, pow: array[0..100000] of qword;
	n: longint;
	
function get(i, j: longint): qword;
var tmp: qword;
begin
	tmp := (ha[j] - ha[i-1] * pow[j-i +1] + base * base) mod base;
	exit(tmp);
end;

procedure process;
var 
	tmp1, tmp2: ansistring;
	index, i: longint;
begin
	readln(a);
	readln(b);
	if length(b) > length(a) then
	begin
		tmp1 := a;
		a := b;
		b := tmp1;
	end;
	n := length(a);
	pow[0] := 1;
	for i := 1 to n do
		pow[i] := (pow[i-1] * 26) mod base;		
		
	hb[0] := 0;
	for i := 1 to length(b) do
		hb[i] :=  (hb[i-1] * 26 + ord(b[i]) - ord('a')) mod base;
		
	ha[0] := 0;
	for i := 1 to length(a) do
		ha[i] := (ha[i-1] * 26 + ord(a[i]) - ord('a')) mod base;
	index := -1;
	for i := 1 to length(b) do
		if get(n - i + 1, n) = hb[i] then index := i;

	if index <> - 1 then
		delete(a, n - index + 1, index);
		
	tmp2 := a + b;
	writeln(tmp2);
end;


begin
	process;
end.
