clear all;
clc;
% Has the minimum at f(0,0) = 0
[X,Y] = meshgrid(-5:.2:5);
Z1 = 20 + (X.^2 - 10*cos(2*pi*X)) + (Y.^2 - 10*cos(2*pi*Y));
h = figure;

mesh(X,Y,Z1); 
title('Rastrigin');
xlabel('x');
ylabel('y');
zlabel('z');

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h, 'Rastrigin','-djpeg')