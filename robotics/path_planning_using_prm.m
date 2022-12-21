clc
close all 
clear all
%load an existing map, in this case, its from example
load exampleMaps.mat;
%checking the map info to be generated
whos *Map*; 
%map generated as binary occupancy grid considering 2 cell for a meter
map = binaryOccupancyMap(simpleMap,2); 
%%show(map);
%as we have considered the robot as circle, radius is taken 
robotRadius = 0.2;
% taking the copy of the original map
mapInflated = copy(map);
%inflating the map to consider the dimension of robot into the map
inflate(mapInflated, robotRadius);
%%show(mapInflated);
%taking an PRM object
prm = mobileRobotPRM;
% Assign the inflated map to the PRM object
prm.Map = mapInflated;
% Define the number of PRM nodes to be used during PRM construction
prm.NumNodes = 5000;
% Define the maximum allowed distance between two connected nodes on the map
prm.ConnectionDistance = 0.2;
% Assigning the starting point and the goal point
startLocation = [2 2];
endLocation = [12 10];
% search a path between the two points
path = findpath(prm, startLocation, endLocation);
show(prm)