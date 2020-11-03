clc; close all; clear;
Y0a(:,:,1) = [1 0 0 0;
              0 0 1 0;
              0 0 0 1];
Y0a(:,:,2) = [1 0 0 0;
              0 0 1 0;
              0 0 0 1];

%Y0a(:,4,2) = [0.25;0.25;0.25] + ([0.25;0.25;0.25]-Y0a(:,4,2))     %reflection
%Y0a(:,4,2) = [0.25;0.25;0.25] + 2.*([0.25;0.25;0.25]-Y0a(:,4,2))     %expansion  
%Y0a(:,4,2) = [0.25;0.25;0.25] + (1/2)*([0.25;0.25;0.25]-Y0a(:,4,2))     %OC
%Y0a(:,4,2) = [0.25;0.25;0.25] + (-1/2)*([0.25;0.25;0.25]-Y0a(:,4,2))     %IC
Y0a(:,2,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,2,1)-Y0a(:,1,1))     %Shrink
Y0a(:,3,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,3,1)-Y0a(:,1,1))     %Shrink
Y0a(:,4,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,4,1)-Y0a(:,1,1))     %Shrink

simplexPlot.plotTotal(Y0a,'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\Presentation\');
hold on
plot3(0.25, 0.25, 0.25, 'o', 'linewidth', 2, 'Color', 'b')  %centroid
%plot3(0.5, 0.5, -1, 'o', 'linewidth', 2, 'Color', 'r')     %reflection
%plot3(0.75, 0.75, -1.25, 'o', 'linewidth', 2, 'Color', 'r')      %expansion
%plot3(0.375, 0.375, -0.125, 'o', 'linewidth', 2, 'Color', 'r')      %OC
%plot3(0.125, 0.125, 0.625, 'o', 'linewidth', 2, 'Color', 'r')      %IC
plot3(1, 0, 0, 'o', 'linewidth', 2, 'Color', 'r')      %Shrink
legend('Y1', 'Y2', 'centroid', 'y0', 'Location', 'best')



