﻿program Stack; 
type 
    LongItemPtr = ^LongItem;
    LongItem = record 
        data: longint;
        next: LongItemPtr;
end; 
type
    StackOfLongints = LongItemPtr;


procedure SOLInt(var stack: StackOfLongints);
begin
    stack := nil 
end;

procedure SOLPush(var stack: StackOfLongints; n: longint);
var
    tmp: LongItemPtr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.next := stack;
    stack := tmp
end;

procedure SOLPop(var stack: StackOfLongints; var n: longint);
var    
    tmp: LongItemPtr;
begin
    n := stack^.data;
    tmp := stack;
    stack := stack^.next;
    dispose(tmp)
end;

function SOLIsEmpty(var stack: StackOfLongints): boolean;
begin
    SOLIsEmpty := stack = nil 
end;

var
    s: StackOfLongints;
    n: longint;
begin
    SOLInt(s);
    while not SeekEof do 
    begin
        read(n);
        SOLPush(s, n);
    end;
    while not SOLIsEmpty(s) do
    begin
        SOLPop(s, n);
        writeln(n)
    end
end.