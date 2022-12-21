clc
close all
clear all
load multiRobotWarehouseMap.mat logicalMap loadingStation unloadingStations chargingStations
warehouseFig = figure('Name', 'Warehouse Setting', 'Units',"normalized", 'OuterPosition',[0 0 1 1]);
visualizeWarehouse(warehouseFig, logicalMap, chargingStations, unloadingStations, loadingStation);
map = binaryOccupancyMap(logicalMap);
if(any(checkOccupancy(map, [chargingStations; loadingStation; unloadingStations])))
    error("At least one of the station locations is occupied in the map.")
end
load packages.mat packages
load exampleMultiRobotParams.mat awayFromGoalThresh collisionThresh
load warehouseRobotBusObjects.mat RobotDeliverCommand RobotPackageStatus
open_system("multiRobotExampleModel.slx")
sim('multiRobotExampleModel');