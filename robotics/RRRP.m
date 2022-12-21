clc
clear all
close all
%create a rigid body
rbd1 = rigidBody('rbd1');

% Create a joint1 and assign it to the rigid body. 
jnt1 = rigidBodyJoint('jnt1','revolute'); %Create a joint
jnt1.HomePosition = pi/4; %Define the home position property of the joint
T = trvec2tform([0.25, 0.25, 0]); %convert translation vector to transformation
setFixedTransform(jnt1, T); % specify the body-to-body transformation using transformation matrix
rbd1.Joint = jnt1; %assign the joint to the rigid body

%Create a rigid body tree. 
robot = rigidBodyTree;

%Add the first body to the tree
addBody(robot, rbd1, 'base');

rbd2 = rigidBody('rbd2');
jnt2 = rigidBodyJoint('jnt2', 'revolute');
jnt2.HomePosition = pi/6;
T2 = trvec2tform([0 0 1]);
setFixedTransform(jnt2,T2);
rbd2.Joint = jnt2;
addBody(robot, rbd2, 'rbd1');

rbd3 = rigidBody('rbd3');
jnt3 = rigidBodyJoint('jnt3','revolute');
jnt3.HomePosition = pi/4;
T3 = trvec2tform([1 0 0]);
setFixedTransform(jnt3, T3);
rbd3.Joint = jnt3;
addBody(robot, rbd3,'rbd2');

rbd4 = rigidBody('rbd4');
jnt4 = rigidBodyJoint('jnt4', 'prismatic')
jnt4.HomePosition = 0;
T4 = trvec2tform([0 1 0]);
setFixedTransform(jnt4,T4);
rbd4.Joint =jnt4;
addBody(robot,rbd4, 'rbd3');

showdetails(robot)
%show(robot)
robot1 = importrobot('iiwa14.urdf');
show(robot1)


