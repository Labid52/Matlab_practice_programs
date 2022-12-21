clc;
clear all;
close all;
G = tf(1, [1 0.5 0.1])
pidTuner(G,'PID')
