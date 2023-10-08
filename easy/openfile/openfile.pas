program read_values_from_file;

var
   input_file: text; // файловый дескриптор для входного текстового файла
   value: integer;   // переменная для хранения считанного значения

begin
   // открытие входного файла для чтения
   assign(input_file, 'input.txt');
   reset(input_file);

   // чтение значений из файла и вывод на экран
   while not eof(input_file) do 
   begin
       readln(input_file, value);
       writeln(value);
   end;

   // закрытие файла
   close(input_file);
end.