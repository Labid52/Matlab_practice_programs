clc;
clear all;
close all;
s = tf('s');
p2 = 3/(s+2);
p1 = 10/(s+1)^3;
%single loop controller
p = p1*p2;
c = pidstd(1,1);
c = pidtune(p,c,0.2)
% cascade loop controller
c2 = pidtune(p2, pidstd(1,1),0.2)
clsys = feedback(p2*c2,1);
c1 = pidtune(clsys*p1, pidstd(1,1), 0.2)
%performance comparison
  %reference tracking
sys1 = feedback(p*c,1);
sys1.Name = 'Single Loop';
sys2 = feedback(clsys*p1*c1,1);
sys2.Name = 'Cascade Loop';
figure;
step(sys1, 'r', sys2, 'b');
legend('show', 'location', 'southeast')
title('Reference Tracking')
  %disturbance rejection
sysd1 = feedback(p1, p2*c);
sysd1.Name = 'Single Loop';
sysd2 = p1/(1+p2*c2+p2*p1*c1*c2);
sysd2.Name = 'Cascade';
figure;
step(sysd1, 'r', sysd2, 'b')
legend('show')
title('disturbance rejection')


