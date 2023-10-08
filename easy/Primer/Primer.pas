Program Primer;
Var A,B:integer;
Begin
    Readln(A,B); 
    If A+B>50 Then
        Begin
        A:=A+10; B:=B-5
    End
        Else A:=A-B;
        Writeln(A,B:5);
End.