clc
close all
clear all
x = linspace(0,2*pi);
y = 2*sin(x);
y2 = cos(x);
plot(x,y)
hold
plot(x,y2)
title('output vs input');
xlabel('x')
ylabel('y')
legend('2sin(x)','cos(x)')
grid on;
