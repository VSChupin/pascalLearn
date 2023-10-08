Program primer;

Var A: Array [1..7] Of integer; sum: real; i: integer;

Begin
For i:= 1 To 7 Do
Begin
Writeln («Введите», i,» -ый элемент массива»); Readln (A [i]); End

sum:=0;

For i:= 1 To 7 Do Sum:=sum+Temp [i];

Writeln («Средняя температура за 7 дней =», Sum/7);

End.