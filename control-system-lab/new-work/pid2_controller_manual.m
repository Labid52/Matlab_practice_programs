clc;
close all;
clear all;
wc = 1.5;
G = tf(1,[1 0.5 0.2]);
C2 = pidtune(G,'PID2',wc); %2-DOF PID controller 
C2tf = tf(C2); %splitting two part of the controller 
Cr = C2tf(1); %spiltting the reference part 
Cy = C2tf(2); %splitting the output part
T2 = Cr*feedback(G,Cy, +1); 
S2 = feedback(G,Cy,+1);
C1 = pidtune(G, 'PID',wc); %1-DoF PID controller
T1 = feedback(G*C1,1)
S1 = feedback(G,C1)
opt = pidtuneOptions('DesignFocus','disturbance-rejection');
C2dr = pidtune(G,'PID2',wc,opt);
C2dr_tf = tf(C2dr);
C2dr_r = C2dr_tf(1);
C2dr_y = C2dr_tf(2);
T2dr = C2dr_r*feedback(G,C2dr_y,+1)
S2dr = feedback(G,C2dr_y,1);
subplot(2,1,1);
stepplot(T1,T2,T2dr)
title('Reference Tracking');
legend('1-DoF','2-DoF');
subplot(2,1,2);
stepplot(S1,S2,S2dr);
title('Disturbance Rejection');
legend('1-DOF','2-DOF')

