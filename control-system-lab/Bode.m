clc;
A=[0 1 0;0 0 1;-5 -25 -5];
B=[0;25;-120];
C=[1 0 0];
D=[0];
system=ss(A,B,C,D);
num=[0 1 0];
den=[1 0];
PID=tf(num,den);
controller=PID
bode(system*controller)