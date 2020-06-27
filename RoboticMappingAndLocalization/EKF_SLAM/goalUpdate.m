function goal = goalUpdate(goal,v,dt)
    x = goal.pos(1);
    y = goal.pos(2);
    epsilon = 0.0001;
    if x>=1 && x<19 && y>= 8
        goal.pos = [x;8] + [v*dt;0];
    elseif x>= 19 && y>2 && y<=8
        goal.pos = [19;y] + [0;-v*dt];
    elseif x>1 && x<=19 && y<=2
        goal.pos = [x;2] + [-v*dt;0];
    elseif x<=1 && y>=2 && y<9
        goal.pos = [1;y] + [0;v*dt];
    end
%     if x>2 && x<18 && y>7
%         goal.pos = goal.pos + [v*dt;0];
%     elseif x>=18-epsilon && y>7
%         goal.pos = [18;7] + [cos(-(v*dt+pi/2));sin(-(v*dt+pi/2))];
%     elseif x>18 && y<7 && y>=3 - epsilon
%         goal.pos = goal.pos + [0;-v*dt];
%     elseif x>18 && y<3
%         goal.pos = goal.pos + [cos(-v*dt);sin(-v*dt)]; 
%     elseif x<=18-epsilon && x > 2 && y<3
%         goal.pos = goal.pos + [-v*dt;0];
%     elseif x<=2-epsilon && y<3
%         goal.pos = goal.pos + [cos(-(v*dt-pi/2));sin(-(v*dt-pi/2))];
%     elseif x<2 && y>=3-epsilon
%         goal.pos = goal.pos + [0,v*dt];
%     end
end
