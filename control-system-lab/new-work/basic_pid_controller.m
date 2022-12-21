clc;
clear all;
close all;
s = tf('s'); 
s = 1/(s+1)^3; %define a system model
[c_pi, info] = pidtune(s,'PI')  %open loop PI controller
s_cl = feedback(c_pi*s,1); %closed loop system
[c_pi_fast, info] = pidtune(s,'PI',1) % open loop PI fast controller
s_cl_fast = feedback(c_pi_fast*s,1); %closed lopp PI fast controller
[c_pidf_fast,info] = pidtune(s,'PIDF',1) %open loop PIDF controller
s_cl_pidf_fast = feedback(c_pidf_fast*s,1) %closed loop
figure()
step(s_cl, s_cl_fast, s_cl_pidf_fast);
axis([0 30 0 1.4])
legend('PI','PI,fast', 'PIDF.Fast')

dis_chek_PI_fast = feedback(s,c_pi_fast); %disturbance rejection of PI
dis_chek_PIDF_fast = feedback(s, c_pidf_fast); %disturbance rejection of PIDF
figure()
step(dis_chek_PI_fast,dis_chek_PIDF_fast)
axis([0 50 0 0.4])
legend('PI,fast', 'PIDF,fast')


