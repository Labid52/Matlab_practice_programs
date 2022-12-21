clc
close all
clear all
msg = 'spend 6% of gdp in the education sector';
encrpt = double(msg) + 5;
fprintf('the encryption is %s\n' ,char(encrpt));
decrpt = encrpt - 5;
fprintf('the decryption is %s\n', char(decrpt));