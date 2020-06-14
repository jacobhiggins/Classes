% Note: general transformation represent rotation (about origin) then
% translation

% This is much like placing a vector at some point with respect to some
% origin: first rotate the vector, then translate it

v0 = [0;0;pi/2]; %x, y, theta
M0 = v2t(v0);
M1 = [1 0 1;0 1 0;0 0 1]; % Translate in x
M2 = [0 1 0;-1 0 0;0 0 1]; % Rotate clockwise
M3 = [0 -1 0;1 0 0;0 0 1]; % Rotate counterclockwise

% This represents the vector v0 in homogeneous coordinates
% Then, it translates the vector according to M1
% Finally, it rotates the vector

% In this example, the vector [0;0;pi/2] is translated to [1;0;pi/2].
% Then rotated clockwise by pi/2
% => [0;-1;0];
v1 = t2v(M2*M1*M0);

%% Relative Transformation

x1 = -10;
y1 = 23;
theta1 = -pi/3;
x2 = 1;
y2 = 1;
theta2 = pi/2;

delx = x2 - x1;
dely = y2 - y1;
deltheta = theta2-theta1;

R_rot = [cos(deltheta) -sin(deltheta);
    sin(deltheta) cos(deltheta)];

v1 = [x1;y1;theta1];
v2 = [x2;y2;theta2];

% M_trans = [1 0 delx;0 1 dely;0 0 1];
% M_rot = [cos(deltheta) -sin(deltheta) 0;
%     sin(deltheta) cos(deltheta) 0;
%     0 0 1];
% Mrel = M_rot*M_trans;

% Mrel = [cos(deltheta) -sin(deltheta) delx;
%     sin(deltheta) cos(deltheta) dely;
%     0 0 1];

Mrel = [R_rot ([x2;y2] - R_rot*[x1;y1]);
    0 0 1];

M1 = v2t(v1);
M2 = Mrel*M1;
v2p = t2v(M2); % this equals to v2 if relative transformation is correct

%% Obtaining global position from relative position
clear all
vr = [1;1;pi/2];
z = [2;0];

Mr = v2t(vr);
Mz = v2t([z;0]);

Mglobal = Mr*Mz;
zglobalp = t2v(Mglobal);
zglobalp = zglobalp(1:2);

% Lesson: to get global position, multiply homogeneous form of relative
% point with homogeneous form of robot pose