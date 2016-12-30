program MAUGIAO;
const
  maxn = 21;
var
  a: array[1..maxn, 1..maxn] of int64;
  T, C, g: array[0..1 shl maxn] of int64;
  //T: so trang thai
  //C: max
  n: byte;
procedure readf;
var
  f: text;
  i, j: byte;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, n);
  for i := 1 to n do
      for j := 1 to n do
          read(f, a[i, j]);
  close(f);
end;

function turnoff(state: longint; index: byte): longint;
begin
  exit(state and not (1 shl index));
end;

function getbit(state: longint; index: byte): byte;
begin
  exit(state shr index and 1);
end;

procedure DPbitmask;
var
  i, j, state, preState: longint;
  max, nummax: int64;
  cmax: array[1..maxn] of int64;
  b: array[1..maxn] of byte;
  k: byte;
begin
  max := 0;
  nummax := 0;
  fillchar(cmax, sizeof(cmax), 0);
  for state := 0 to 1 shl n do t[state] := 1;
  for state := 0 to 1 shl n do
      begin
        k := 0;
        for j := 0 to n - 1 do
          if getbit(state, j) = 1 then
          begin
            inc(k);
            b[k] := j;
          end;

        max := 0;
        i := 1;
        for j := 1 to k do
          begin
            preState := turnoff(state, b[j]);
            if max < C[preState] + a[k, j] then
            begin
              max := C[preState] + a[k, j];
              i := t[prestate];
            end else
              if max = c[prestate] + a[k, j] then
                    i := i + t[prestate];
          end;

        C[state] := max;
        if max > cmax[k] then
        begin
          cmax[k] := max;
          t[state] := i;
          g[k] := i;
        end
        else if max = cmax[k] then
        begin
          t[state] := g[k] + i;
          g[k] := t[state];
        end;
      end;
  for state := 0 to 1 shl n - 1 do write(C[state],' ');
  writeln;
  for state := 0 to 1 shl n - 1 do write(T[state],' ');
  writeln;
  writeln(C[1 shl n - 1]);
end;
{
Goi T[state] là số cách có được giá trị lớn nhất với trạng thái state
//01001
C[state] la max khi chon duoc 3 co con gai
}
begin
  readf;
  DPbitmask;
  readln;
end.

