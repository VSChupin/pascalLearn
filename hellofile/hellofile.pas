program Hellofile; 
const 
    message = 'Hello World!'; 
    filename = 'helloworld.txt';
var 
    f: text;
begin
    assign(f,filename);
    rewrite(f);
    writeln(f,message);
    close(f);
end.
