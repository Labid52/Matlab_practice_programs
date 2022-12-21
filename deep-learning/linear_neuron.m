clc
clear all
close all
x = linspace(-4,2,1000);
y = 2*x + 3;
a1 = tanh(y);
a2 = 2 ./ (1 + exp(-y)) - 1;
a3 = zeros (1, length(x));
k = y >= 0;
a3(k) = 1;
plot(x, [a1;a2;a3;y])