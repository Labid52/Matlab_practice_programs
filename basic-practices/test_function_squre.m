clc;
close all
clear all

b = sqr(2)
[a b c] = circle(1)
% c = sqr('G')

function [y] = sqr(x)
    check = isnumeric(x)
    if check == 0 || nargin ~= 1;
        error('please type a number');
    end
    y = x^2;
end

function [perimeter, area, volume] = circle(r)
    perimeter = 2*pi*r;
    area = pi*r^2;
    volume = 4/3 * pi * r^3
end
