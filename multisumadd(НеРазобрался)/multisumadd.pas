Program multisumadd; 
const 
    filename = 'filem.txt';
var 
    mul, sum, n: real;
    f: text;
begin
    {$I-}
    if ParamCount < 1 then  
    begin 
        writeln('Please specify file name');
        halt(1);
    end;
    assign(f, filename);
    reset(f);
    if IOResult <> 0 then 
    begin 
        writeln('Could not open ', ParamStr(1));
        halt(1);
    end;
    sum := 0;
    While not SeekEof(f) do 
    begin
        mul := 1;
        while not SeekEoln(f) do 
        begin  
            read(f, n);
            mul := mul * n
        end;
        readln(f);
        sum := sum + mul; 
    end;
    close(f);
    writeln(sum:7:5);
end.
