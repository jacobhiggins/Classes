function goal = goalUpdate(goal,v,dt)
    x = goal.pos(1);
    y = goal.pos(2);
    if x>2 && x<18 && y>7
        goal.pos = goal.pos + [v*dt;0];
    elseif x>=18 && y>7
        goal.pos = goal.pos + [cos(-(v*dt+pi/2));sin(-(v*dt+pi/2))];
    elseif x>18 && y<7 && y>=3
        goal.pos = goal.pos + [0;-v*dt];
    elseif x>18 && y<3
        goal.pos = goal.pos + [cos(-v*dt);sin(-v*dt)]; 
    elseif x<=18 && x > 2 && y<3
        goal.pos = goal.pos + [-v*dt;0];
    elseif x<=2 && y<3
        goal.pos = goal.pos + [cos(-(v*dt-pi/2));sin(-(v*dt-pi/2))];
    elseif x<2 && y>=3
        goal.pos = goal.pos + [0,v*dt];
    end
end
