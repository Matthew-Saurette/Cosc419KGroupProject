clear all;
clc;

[X,Y] = meshgrid(-2:.2:2);
Z1 = (1 - X).^2 + 100.*(Y - X.^2).^2;
h = figure;

mesh(X,Y,Z1); 
title('Rosenbrock');
xlabel('x');
ylabel('y');
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h, 'Rastrigin','-dpf','r0')