% Starting pose
x = [0;0;pi/2];
xs = x;
us = get_us();

figure(1);
plt_robot = plot(x(1),x(2),'o-');
xlim([-5,5]);
ylim([-5,5]);

for i = 1:us.T
    u = [us.r1(i),us.t(i),us.r2(i)];
    x = motion_command(x,u);
    xs = [xs x];
    plt_robot.XData = xs(1,:);
    plt_robot.YData = xs(2,:);
    drawnow;
    pause(0.1);
end