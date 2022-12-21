clc
close all
clear all
city = menu('the name of the city','dhaka', 'chattagram', 'cumilla');
switch city
    case 1
        fprintf("the cost is BDT 160 \n")
    case 2
        fprintf("the cost is BDT 500 \n")
    case 3
        fprintf("the cost is BDT 300 \n")
end