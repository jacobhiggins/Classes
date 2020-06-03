function us = get_us()
    us.T = 20;
    us.r1 = [];
    us.t = [];
    us.r2 = [];
    
    us.r1 = 0.1*ones(us.T,1);
    us.t = 0.2*ones(us.T,1);
    us.r2 = zeros(us.T,1);
end