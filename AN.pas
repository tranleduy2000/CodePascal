var
	a: array[0..101, 0..101] of integer;
	n, m: integer;
	
procedure readf;
var
	i, j: integer;
begin
	readln(n, m);
	for i := 1 to n do
		for j := 1 to m do read(a[i, j]);
end;

function max(x, y: longint): longint;
begin
	if x> y then exit(x) else exit(y);
end;

procedure dp;
var
	f: array[0..101, 0..100] of longint;
	i, j: integer;
begin	
	fillchar(f, sizeof(f), 0);
	for i := 1to n do
		for j := 1 to m do
		 f[i, j] := max(f[i-1, j], f[i, j-1]) + a[i, j];
		 
	write(f[n, m]);	 
end;

begin
	readf;
	dp;
end.
