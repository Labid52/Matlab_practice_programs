clc;
clear all
close all
load exampleMaps.mat;
map =  binaryOccupancyMap(complexMap, 1);
% show(map)
mapInflated = copy(map);
robotRadius = 0.2;
inflate(mapInflated, robotRadius);
% show(mapInflated)
prm = mobileRobotPRM;
prm.Map = mapInflated;
prm.NumNodes = 20;
prm.ConnectionDistance = 15;
% show(prm)
startLocation = [3 3];
endLocation = [5, 35];
path = findpath(prm, startLocation, endLocation);
%Tune the number of nodes
%to make sure there is a feasible path between the start and end location.
while isempty(path)
    prm.NumNodes = prm.NumNodes + 10;
    update(prm)
    path = findpath(prm, startLocation, endLocation);
end
show(prm)