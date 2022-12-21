clc;
clear all;
close all;
%loading and processing the map
load exampleMaps;
map = binaryOccupancyMap(simpleMap);
figure;
show(map);
mapInflated = copy(map);
%robot kinematic model
robot = differentialDriveKinematics("TrackWidth", 1, "VehicleInputs", "VehicleSpeedHeadingRate");
inflate(mapInflated, robot.TrackWidth/2);
%PRM path planning algorithm
prm = robotics.PRM(mapInflated);
prm.NumNodes = 100;
prm.ConnectionDistance = 10;
sLocation = [4.0 2.0]
eLocation = [24.0 20.0]
path = findpath(prm, sLocation, eLocation)
figure;
show(prm);
%path following controller
controller = controllerPurePursuit;
controller.Waypoints = path;
controller.DesiredLinearVelocity = 0.6;
controller.MaxAngularVelocity = 2;
controller.LookaheadDistance = 0.3;
robotInitialLocation = path(1,:);
robotGoal = path(end,:);
initialOrientation = 0;
robotCurrentPose = [robotInitialLocation initialOrientation]';
distanceToGoal = norm(robotInitialLocation - robotGoal)
goalRadius = 0.1;
sampleTime = 0.1;
vizRate = rateControl(1/sampleTime);
figure;
frameSize = robot.TrackWidth/0.8;
%path following actions
while (distanceToGoal > goalRadius)
    [v, omega] = controller(robotCurrentPose);
    vel = derivative(robot,robotCurrentPose,[v omega]);
    robotCurrentPose = robotCurrentPose + vel*sampleTime;
    distanceToGoal = norm(robotCurrentPose(1:2)-robotGoal(:));
    hold off
    show(map)
    hold all
    plot(path(:,1), path(:,2),"k--d")
    plotTrVec = [robotCurrentPose(1:2); 0];
    plotRot = axang2quat([0 0 1 robotCurrentPose(3)]);
    plotTransforms(plotTrVec', plotRot, "MeshFilePath", "groundvehicle.stl", "Parent", gca, "View","2D", "FrameSize", frameSize);
    light;
    xlim([0 27])
    ylim([0 26])
    waitfor(vizRate);
end
    