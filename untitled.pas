const
  fi='file.inp';//c11seq.inp';
  fo='';//c11seq.out';
  maxn=trunc(1e5);
var
  s,sr,sl : array[0..maxn] of int64;
  a  : array[0..maxn*3] of int64;
  b,cs,t  : array[0..maxn*3] of longint;
  i,j,n,l,r : longint;
  ans : int64;
procedure enter;
  begin
    assign(input,fi);reset(input);
    read(n,l,r);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do if (l<=a[i]) and (r>=a[i]) then inc(ans);
    close(input);
  end;
procedure swap(var x,y : longint);
  var tg : longint;
  begin
    tg := x;x:=y;y:=tg;
  end;
procedure qs(l,r : longint);
  var i,j : longint;
      x : int64;
  begin
    i :=l;j:=r;
    x := a[cs[(l+r) div 2]];
    repeat
      while a[cs[i]]<x do inc(i);
      while a[cs[j]]>x do dec(j);
      if i<=j then
        begin
          swap(cs[i],cs[j]);
          inc(i);dec(j);
        end;
    until i>j;
    if i<r then qs(i,r);
    if j>l then qs(l,j);
  end;
procedure init;
  var i,hold : longint;
  begin
    for i := 1 to n do s[i] := s[i-1] + a[i];
    for i := 1 to n do sl[i] := s[i] - l;
    for i := 1 to n do sr[i] := s[i] - r - 1;
    for i := 1 to n do
      begin
        a[i] := sl[i];
        a[n+i] := sr[i];
        a[n+n+i] := s[i-1];
      end;
    //a[2*n+1] := s[0] - l;
    //a[2*n+2] := s[0] - r;
    for i:=1 to 3*n do cs[i] := i;
    qs(1,3*n);
    b[cs[1]] := 1; hold := 1;
    for i:=2 to n*3 do
      if a[cs[i]] = a[cs[i-1]] then
        begin
          b[cs[i]] := hold;
        end
        else
        begin
          inc(hold);
          b[cs[i]] := hold;
        end;
    for i := 2 to 3 * n do write(a[i], ' '); writeln;
    for i := 1 to 3 * n do write(b[i], ' ');
  end;
procedure update(i : longint);
  begin
    while i<=3*n do
      begin
        t[i] := t[i] + 1;
        i := i + i and (-i);
      end;
  end;
function get(i : longint) : longint;
  begin
    get := 0;
    while i>0 do
      begin
        get := get + t[i];
        i := i - i and (-i);
      end;
  end;
procedure process;
  var i : longint;
  begin
    for i:=1 to n do
      begin
        ans := ans + get(b[i]) - get(b[n+i]);
        update(b[2*n+i]);
      end;
  end;
procedure print;
  begin
    assign(output,fo);rewrite(Output);
    writeln(ans);
    close(output);
  end;
begin
  enter;
  init;
  process;
  print;
end.
