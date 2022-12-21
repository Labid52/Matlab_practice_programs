clc
close all
clear all
%creating a table consisting of three table name, age, LDL
Name = ['Lab'; 'Tab'; 'Yus'] %string should be of equal # of characters
Age = [25; 22; 18];
LDL = [187; 150; 98];
T = table(Name, Age, LDL)
writetable(T,'fam_chol_prof.xlsx');