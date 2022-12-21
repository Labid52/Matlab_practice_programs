clc;
close all;
clear all;
% loading a refence map and an empty map
load exampleMaps.mat;
refMap = binaryOccupancyMap(simpleMap,1);
refFigure = figure('Name','SimpleMap');
show(refMap);
[mapdimx, mapdimy] = size(simpleMap);
map = binaryOccupancyMap(mapdimx,mapdimy,10);
mapFigure = figure('Name','UnknownMap');
show(map);
%initialize kinematic model as well as controller
diffDrive = differentialDriveKinematics('VehicleInputs','VehicleSpeedHeadingRate');
controller = controllerPurePursuit('DesiredLinearVelocity',2,'MaxAngularVelocity',3);
%parameter setting of range sensor
sensor = rangeSensor;
sensor.Range = [0 10];
path = [4 6; 6.5 12.5; 4 22; 12 14; 22 22; 16 12; 20 10; 14 6; 22 3];
figure(refFigure);
hold on
plot(path(:,1),path(:,2),'o-')
hold off
%final mapping operation according to given path
controller.Waypoints = path;
initPose = [path(1,1) path(1,2), pi/2];
goal = [path(end,1) path(end,2)]';
poses(:,1) = initPose';
exampleHelperDiffDriveCtrl(diffDrive,controller,initPose,goal,refMap,map,refFigure,mapFigure,sensor)