clear all;
clc;
% Has the minimum at f(3,3) = 10
[X,Y] = meshgrid(-5:.5:5);
Z1 = (X - 3).^2 + (Y - 3).^2 + 10;
h = figure;

mesh(X,Y,Z1); 
title('Convex');
xlabel('x');
ylabel('y');

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h, 'Convex_Function','-djpeg','r0')