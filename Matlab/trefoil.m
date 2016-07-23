
% 2-D and 3-D curves plotting (examples)
t = 0:0.05:3*pi; % parameterization for curve plotting
figure; % opening new window for Figure 3
subplot(2,2,1); % cardioid
plot((sin(t)-1).*cos(t),(sin(t)-1).*sin(t),'r'); % 2-D plotting
title('cardioid');
xlabel('x'); ylabel('y');

subplot(2,2,2); % limacon
plot((3*sin(t)+2).*cos(t),(3*sin(t)+2).*sin(t)); % 2-D plotting
title('limacon');
xlabel('x'); ylabel('y');

subplot(2,2,3:4); % trefoil knot
plot3(4*cos(2*t)+2*cos(t),4*sin(2*t)-2*sin(t),sin(3*t),'g'); % 3-D plotting
title('trefoil knot');
xlabel('x'); ylabel('y'); zlabel('z');
