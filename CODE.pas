var
	s: string;
	b1, b2: boolean;
	
function check: boolean;
var
	i: longint;
begin
	b1 := false;
	b2 := false;
	if (s[1] in ['A'..'Z']) or (s[1] = '_') or (s[length(s)] = '_') or (pos('__', ) > 0) then exit(true);
	for i := 1 to length(s) do
	begin
		if s[i] = '_' then b1 := true;
		if s[i] in ['A'..'Z'] then b2 := true;
	end;
	exit(b1 and b2);
end;

procedure process;
var
	i: longint;
begin
	readln(s);
	//writeln(s);
	if check then write('Error!')
	else
	begin
		if b1 then
		begin
			for i := 1 to length(s) do
				if s[i] <> '_' then
				begin
					if s[i-1] = '_' then 
					begin
						write(chr(ord(s[i]) - 32));
					end
					else write(s[i]);
				end;
		end
		else
		begin
			for i := 1 to length(s) do
			begin
				if s[i] in ['A'..'Z'] then write('_', chr(ord(s[i]) + 32))
				else write(s[i]);
			end;
		end;
	end;
	writeln;
end;

begin
	process;
end.
