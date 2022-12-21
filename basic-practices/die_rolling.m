clc
clear all
close all
die = randi(6,1,2);
%d2 = randi(6,1,1);
if die(1) + die(2) == 10
    fprintf ("You are lucky");
    disp(die(1) + die(2));
else
    disp(die(1) + die(2));
end