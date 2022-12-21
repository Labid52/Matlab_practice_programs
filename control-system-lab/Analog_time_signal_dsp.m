clc;
clear all;
t=(0: 0.01 : 1) ;

subplot(3,2,1);
impulse = t==0
plot(t,impulse,'g')
title('Fig.1: impulse signal')
xlabel('time');ylabel('magnitude')
grid on;

subplot(3,2,2);
unitstep = t>=0
plot(t,unitstep,'r')
title('Fig.2: unitstep signal')
xlabel('time');ylabel('magnitude')
grid on;

subplot(3,2,3);
ramp = t.*unitstep
plot(t,ramp,'y')
title('Fig.3: ramp signal')
xlabel('time');ylabel('magnitude')
grid on;

subplot(3,2,4);
sinusoidal = 1*sin(2*pi*t)
plot(t,sinusoidal)
title('Fig.4: sinusoidal signal')
xlabel('time');ylabel('magnitude')
grid on;

subplot(3,2,5);
exponential = exp(t)
plot(t,exponential)
title('Fig.5: exponential signal')
xlabel('time');ylabel('magnitude')
grid on;
