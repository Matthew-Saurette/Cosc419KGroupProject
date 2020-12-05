% Basline code for adding axes to figures
clear all;
clc;

% Opens saved figure
%% Edits axes

 h = openfig('niceFunctionSimplex.fig');
 hold on
% 
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% print(h_current, 'NiceFunctionSimplex_edit.jpg','-dpdf')

% This file will be used to open figures.
clear all;
clc;

%% Trims the white space from the images for presentation

h_current = figure(1);
axes = gca;
set(h_current, 'Units','Inches');
pos = get(h_current,'Position');
set(h_current,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h_current, 'niceFunctionSimplex','-djpeg')