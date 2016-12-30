program HIVU;

type
  point = record
    x, y: longint;
  end;

var
  p: array[1..4] of point;
  t: point;

  function l(a, b: point): real;
  begin
    exit(sqrt(sqr(a.x - b.x) + sqr(b.y - a.y)));
  end;

var
  i, j: integer;
  l1, l2, l3, l4, l5, l6: real;
begin
  for i := 1 to 4 do
    with p[i] do
      readln(x, y);
  for i := 4 downto 1 do
    for j := 1 to i do
      if (p[j].x <= p[j + 1].x) then
      begin
        if (p[j].x = p[j + 1].x) then
        begin
          if p[j].y < p[j + 1].y then
          begin
            t := p[j];
            p[j] := p[j + 1];
            p[j + 1] := t;
          end;
        end
        else
        begin
          t := p[j];
          p[j] := p[j + 1];
          p[j + 1] := t;
        end;
      end;
  for i := 1 to 4 do
    with p[i] do
      writeln(x, ' ', y);
  l1 := l(p[1], p[3]);
  l2 := l(p[3], p[2]);
  l3 := l(p[2], p[4]);
  l4 := l(p[4], p[1]);

  l5 := l(p[1], p[2]);
  l6 := l(p[3], p[4]);
  if (l1 = l2) and (l2 = l3) and (l3 = l4) and (l5 = l6) then
    Write('YES')
  else
    Write('NO');
  readln;
end.
