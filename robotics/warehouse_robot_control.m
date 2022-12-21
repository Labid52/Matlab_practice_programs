clc
close all
clear all
load wareHouseMaps.mat logicalMap;
map = binaryOccupancyMap(logicalMap);
show(map)
chargingStn = [5, 5];
loadingStn = [52, 15];
unloadingStn = [15, 42];
hold on
text(chargingStn(1),chargingStn(2),'Charging');
plotTransforms([chargingStn, 0], [1, 0, 0, 0,]);
text(loadingStn(1),loadingStn(2),'Loading Station');
plotTransforms([loadingStn, 0], [1, 0, 0, 0,]);
text(unloadingStn(1),unloadingStn(2),'Unloading Station');
plotTransforms([unloadingStn, 0], [1, 0, 0, 0,]);
hold off
open_system('warehouseTasksRobotSimulationModel.slx')
simulation = sim('warehouseTasksRobotSimulationModel.slx');