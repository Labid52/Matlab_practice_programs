clc
close all
clear all
x = linspace (0,pi);
subplot(3,1,1);
plot(x,sin(x));
grid on;
subplot(3,1,2);
plot(x,cos(x));
grid on;
subplot(3,1,3);
plot(x, exp(-x));
grid on;