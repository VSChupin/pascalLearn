program modulo;
var
    a:integer;
    negative:boolean;
begin
    read(a);
    negative:= a < 0;
    if negative then
        a:= -a;
    writeln(a)
end.