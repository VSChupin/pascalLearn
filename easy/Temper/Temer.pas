program Temper;
var
Temp:Array[1..7] of integer;
sum:real;
i:integer;
begin
    for i:=1 to 7 do
    begin
    writeln('Введите, i-ый элемент массива');
    readln(Temp[i]);
    end;
        sum:=0;
        for i:=1 to 7 do
            sum:=sum+Temp[i];
        writeln('Средняя температура за 7 дней =', sum/7);
end.