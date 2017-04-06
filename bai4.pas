Program Menu;

Uses CRt;

label h1,h2,h3;

Var c1,c2,c3,c4:String[20];

l1,l2,l3,l4:byte;

chon:char;

Procedure tr; {thu tuc tinh hinh tron}

Var a,dt,cv:real;

Begin

clrscr;

write('cho biet ban kinh hinh tron'); readln(a);

dt:=pi*a*a; cv:=2*pi*a;

writeln('dien tich hinh la:',dt:12:4);

writeln('chu vi hinh la:',cv:12:4);

writeln('bam enter quay ve menu');

repeat until Keypressed;

end;

Procedure cn; {thu tuc tinh hinh chu nhat}

Var a,b,p,dt,cv:real;

Begin

clrscr;

write('cho biet do dai 2 canh'); readln(a,b);

dt:=a*b; cv:=(a+b)/2;

writeln('dien tich hinh la:',dt:12:4);

writeln('chu vi hinh la:',cv:12:4);

writeln('bam enter quay ve menu');

repeat until Keypressed;

end;

Procedure tg; {thu tuc tinh tam giac}

Var a,b,c,p,dt,cv:real;

Begin

clrscr;

write('cho biet ba canh tam giac'); readln(a,b,c);

if (a+b>c) and (a+c>b) and (b+c>a) then

begin

p:=(a+b+c)/2;

dt:=sqrt(p*(p-a)*(p-b)*(p-c));

cv:=a+b+c;

writeln('dien tich hinh la:',dt:12:4);

writeln('chu vi hinh la:',cv:12:4);

end

else

write('so lieu nhap khong tao thanh tam giac');

writeln('bam enter quay ve menu');

repeat until Keypressed;

end;

Procedure w1; {thiet ke chuc nang thu nhat}

Begin

Textbackground(5);

textcolor(10);

window(1,2,l1+1,2);write(c1);

gotoxy(1,1);

End;

Procedure w2;

Begin

Textbackground(5);

textcolor(10);

window(l1+2,2,l1+l2+2,2);write(c2);

gotoxy(1,1);

End;

Procedure w3;

Begin

Textbackground(5);

textcolor(10);

window(l1+l2+3,2,l1+l2+l3+3,2);write(c3);

gotoxy(1,1);

End;

Procedure w4;

Begin

Textbackground(5);

textcolor(10);

window(l1+l2+l3+4,2,l1+l2+l3+l4+4,2);write(c4);

gotoxy(1,1);

End;

Begin{THAN CHUONG TRINH CHINH}

Clrscr;

c1:='Tamgiac';l1:=length(c1);

c2:='Chunhat';l2:=length(c2);

c3:='Tron';l3:=length(c3);

c4:='Ketthuc';l4:=length(c4);

CLRSCR;

textcolor(red);

textbackground(green);

write('bam ->,<- di chuyen menu| Bam enter de chon| Bam End ket thuc');

h1: w1;w2;w3;w4;w1;

while keypressed do chon:=readkey;

chon:=readkey;{tinh tam giac}

if ord(chon)=13 then

begin

textcolor(blue);textbackground(14);

window(1,4,80,25);

tg;

clrscr;

goto h1;

end

else

begin

if ord(chon)=0 then chon:=readkey;

if ord(chon)=79 then halt; {bam End ket thuc}

if ord(chon)=77 then w2;

end;

h2: w1;w2;w3;w4;w2;

while keypressed do chon:=readkey;

chon:=readkey;{tinh chu nhat}

if ord(chon)=13 then

begin

textcolor(blue);textbackground(14);

window(1,4,80,25);

cn;

clrscr;

goto h2;

end

else

begin

if ord(chon)=0 then

begin

chon:=readkey;

if ord(chon)=79 then halt; {bam End ket thuc}

if ord(chon)=77 then w3;

if ord(chon)=75 then goto h1;

end;

end;

h3: w1;w2;w3;w4;w3;

while keypressed do chon:=readkey;

chon:=readkey; {tinh hinh tron}

if ord(chon)=13 then

begin

textcolor(blue);textbackground(14);

window(1,4,80,25);

tr;

clrscr;

goto h3;

end

else

begin

if ord(chon)=0 then

begin

chon:=readkey;

if ord(chon)=79 then halt; {bam End ket thuc}

if ord(chon)=77 then w4;

if ord(chon)=75 then goto h2;

end;

end;

while keypressed do chon:=readkey;

chon:=readkey; {tinh hinh tron}

if ord(chon)=13 then halt

else

if ord(chon)=0 then

chon:=readkey;

if ord(chon)=79 then halt; {bam End ket thuc}

if ord(chon)=75 then goto h3;

END.
