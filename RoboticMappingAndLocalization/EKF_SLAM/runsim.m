%% Initialize

% Sim parameters
dt = 0.01;
T = 0:dt:52;
vmax = 5;

% Initialize robot
robot.pose = [2;8;0]; % x, y, theta
robot.input = zeros(2,1); % linear velocity, angular velocity\
robot.dt = dt;

% Initialize goal
goal.pos = [3;8];

% Initialize landmark locations
lmarks = [2,7;
    6,7;
    10,7;
    14,7;
    18,7;
    2,3;
    6,3;
    10,3;
    14,3;
    18,3];

%% Initial Plot

viz = Visualizer2D;
viz.showTrajectory = false;
viz.hasWaypoints = true;
viz(robot.pose,lmarks);
hold on;
plt_goal = plot(goal.pos(1),goal.pos(2),'rx');
xlim([0,20]);
ylim([0,10]);

%% Simulation
for t = T
   v = [2;0;0];
   goal = goalUpdate(goal,v(1),dt);
   robot = robotUpdate(robot,goal);
   plt_goal.XData = goal.pos(1);
   plt_goal.YData = goal.pos(2);
   viz(robot.pose,lmarks);
   drawnow;
   pause(dt);
end