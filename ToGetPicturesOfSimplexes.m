clc; close all; clear;
% Y0a(:,:,1) = [0 1 0 0;
%               0 0 1 0;
%               0 0 0 1];
Y0a(:,:,1) = [9.5 10.5 9.5 9.5;
              9.5 9.5 10.5 9.5;
              9.5 9.5 9.5 10.5];

%Y0a(:,4,2) = [1/3;1/3;0] + ([1/3;1/3;0]-Y0a(:,4,2))     %reflection
%Y0a(:,4,2) = [1/3;1/3;0] + 2.*([1/3;1/3;0]-Y0a(:,4,2))     %expansion  
%Y0a(:,4,2) = [1/3;1/3;0] + (1/2)*([1/3;1/3;0]-Y0a(:,4,2))     %OC
%Y0a(:,4,2) = [1/3;1/3;0] + (-1/2)*([1/3;1/3;0]-Y0a(:,4,2))     %IC
%Y0a(:,2,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,2,1)-Y0a(:,1,1))     %Shrink
%Y0a(:,3,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,3,1)-Y0a(:,1,1))     %Shrink
%Y0a(:,4,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,4,1)-Y0a(:,1,1))     %Shrink

simplexPlot.plotTotal(Y0a,'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\Presentation\');
hold on
%plot3(1/3, 1/3, 0, 'o', 'linewidth', 2, 'Color', 'b')  %centroid
%plot3(0.6667, 0.6667, -1, 'o', 'linewidth', 2, 'Color', 'r')     %reflection
%plot3(1, 1, -2, 'o', 'linewidth', 2, 'Color', 'r')      %expansion
%plot3(01/2, 1/2, -1/2, 'o', 'linewidth', 2, 'Color', 'r')      %OC
%plot3(0.1667, 0.1667, 0.5, 'o', 'linewidth', 2, 'Color', 'r')      %IC
%plot3(1, 0, 0, 'o', 'linewidth', 2, 'Color', 'r')      %Shrink - y0
%plot3(9.5062, 8.4167, 8.7269, 'o', 'linewidth', 2, 'Color', 'r')
legend('Y1', 'Yk\_best', 'centroid', 'inside contraction point', 'Location', 'best')



