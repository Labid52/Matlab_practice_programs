L=1.54e-3;
R=7.94;
k_w=inv(2*pi*243/60);
J=27.8e-7;
K_a=39.3e-3;
B=15e-6;
k_s=.96;
AA=[-R/L -k_w/L 0;K_a/J -B/J 0;0 1 0];
BB=[1/L;0;0];
CC=[0 0 1];
DD=[0];
system=ss(AA,BB,CC,DD);
step(system);





















