% Basline code for adding axes to figures
clear all;
clc;

% Opens saved figure
h = openfig('NiceFunctionSimplex.fig');
hold on

xlabel('x');
ylabel('y');
zlabel('z');

print(h_current, 'NiceFunctionSimplex_edit.jpg','-dpdf')