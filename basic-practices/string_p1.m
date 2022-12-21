clc
close all
clear all
% Three variables are defined as ‘How are you?’, ‘the weather’, and ‘is
% it correct?’ for A, B, and C, respectively. We want to create a new character ‘How is the
% weather’ by using the given three variables alone. Write the code to achieve this task.
A = 'How are you';
B = 'the weather';
C = 'is it correct?';
result_ = [A(1:4) C(1:3) B]
