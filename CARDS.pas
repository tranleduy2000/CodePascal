var
	n: longint;
	heap: array[1..100000] of longint;
	
procedure swap(var u, v: longint);
var
	tmp: longint;
begin
	tmp := u;
	u := v;
	v := tmp;
end;

procedure upheap(child: longint);
begin
	if (child = 1) or (heap[child] < heap[child div 2]) then exit;
	swap(heap[child], heap[child div 2]);
	upheap(child div 2);
end;

procedure downheap(root: longint);
var
	child: longint;
begin
	child := root * 2;
	if child > n then exit;
	if (child < n) and (heap[child] < heap[child + 1]) then inc(child);
	if heap[root] < heap[child] then
	begin
		swap(heap[root], heap[child]);
		downheap(child);
	end;
end;

procedure push(value: longint);
begin
	inc(n);
	heap[n] := value;
	upheap(n);
end;
	
function pop(index: longint): longint;
begin
	pop := heap[index];
	heap[index] := heap[n];
	dec(n);
	upheap(index);
	downheap(index);
end;

procedure heapsort();
var
	i, tmp: longint;
begin
	tmp := n;
	while n >= 1 do
	begin
		swap(heap[1], heap[n]);
		dec(n);
		downheap(1);
	end;
	for i := tmp downto 1 do write(heap[i],  ' ');
end;

procedure process;
var
	c: char;
	i, m, tmp, count, value: longint;
begin
	readln(m);
	for i := 1 to m do
	begin
		read(c); 
		if c = 'A' then 
		begin
			readln(value);
			push(value);
		end else //P
		begin
			readln;
			if n = 0 then writeln(-1)
			else
			begin
				tmp := pop(1);
				count := 1;
				while (heap[1] = tmp) and (n > 0) do
				begin
					pop(1);
					inc(count);
				end;
				writeln(tmp, ' ', count);
			end;
		end;
	end;
	if n <= 0 then writeln(-1) else
	heapsort;
end;

begin
	n := 0;
	process;
end.
