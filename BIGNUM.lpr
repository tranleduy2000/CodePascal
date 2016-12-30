const
  maxn = 1000;
type
  num = array[0..1000] of shortint;
var
  s1, s2: num;

function add(a, b: num): num;
var
  i, r, m, n, e, res: integer;
  c: num;
  ch: widestring;
begin
  r := 0;
  m := maxn+1;
  c[0] := m;
  if a[0] > b[0] then m := b[0] else m := a[0];
  for i := maxn downto m do
  begin
      res := (r + a[i] + b[i]) mod 10;
      r := (r + a[i] + b[i]) div 10;
      dec(c[0]);
      c[i] := res;
  end;
  if r > 0 then
  begin
    dec(c[0]);
    c[c[0]] := 1;
  end;
  add:=c;
end;

function sub(a, b: widestring): widestring;
var
  neg: boolean;
  i, r, m, n, e, res: integer;
  c, ch, tmp: widestring;
begin
  while length(a) < length(b) do a := '0' + a;
  while length(b) < length(a) do b := '0' + b;//bang nhau
  if a < b then
  begin
    neg := true;
    tmp := a;
    a := b;
    b := tmp;
  end
    else neg := false;

  r := 0;
  c := '';
  for i := length(a) downto 1 do
  begin
      val(a[i], m, e);
      val(b[i], n, e);
      res := m - n - r;
      if res < 0 then
      begin
        res := res + 10;
        r := 1;
      end
      else r := 0;
      str(res, ch);
      c := ch + c;
  end;
  while (c[1] = '0') and (length(c) >= 2) do delete(c, 1, 1);
  if neg and (c[1] <> '0') then c := '-' + c;
  sub := c;
end;

procedure readf;
var
  f: text;
begin
  assign(f, 'file.inp');
  reset(f);
  readln(f, s1);
  s1[0] := maxn - length(s1) + 1;
  readln(f, s2);
  close(F);
end;

function minmul(a: char; b: widestring): widestring;
var
 i, r, m, n, e, res: integer;
 c: WideString;
 ch: widestring;
begin
  c := ''; r := 0;
  val(a, n, e);
  for i := length(b) downto 1 do
  begin
      val(b[i], m, e);
      res := m * n;
      r := res div 10;
      res := res mod 10;
      str(res, ch);
      c := ch + c;
  end;
  if r > 0 then
  begin
    str(r, ch);
    c := ch + c;
  end;
  minmul:=c;
end;

function mul(a, b:widestring): widestring;
var i, j: integer;
 c: WideString;
 tmp: widestring;
begin
  c := '';
  //for i := length(a) downto 1 do
  //begin
  //   tmp := minmul(a[i], b);
  //   //writeln(tmp);
  //   for j := i+1 to length(a) do tmp := tmp + '0';
  //   c := add(c , tmp);
  //end;
  mul := c;
end;

procedure process;
var
  res: WideString;
begin
  res := add(s1, s2);
  writeln(res);
  //res := sub(s1, s2);
  //writeln(res);
  //res := mul(s1, s2);
  //writeln(res);
  readln(f);
  f := '';
end;

begin
  readf;
  process;
end.

