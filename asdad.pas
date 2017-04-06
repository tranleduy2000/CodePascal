var 
	f, a: array[0..10000] of longint;
	n: longint;
	
procedure readf;
var f: text;
	i: longint;
begin
	assign(f, 'file.inp');
	reset(f);
	readln(f, n);
	for i := 1 to n do readln(f, a[i]);
	close(f);
end;

function max(x, y: longint): longint;
begin
	if x > y then exit(x) else exit(y);
end;

procedure dp;
var i: longint;
begin
	f[0] := 0;
	f[1] := a[1];
	for i := 2 to n do
		f[i] := max(f[i-1], f[i-2] + a[i]);
	writeln(f[n]);
end;

begin
	readf;
	dp;
end.
