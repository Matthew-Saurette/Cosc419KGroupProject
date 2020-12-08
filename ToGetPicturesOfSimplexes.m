clc; close all; clear;

Y0a(:,:,1) = [3 1 3 2.1;
              3 2 2 1.9;
              3 3 1 2];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
solution = -2;
eps = 1e-6;
%f = @(x) x(1)^2 + x(2)^2 + x(3)^2 - 2;
f = @(x) (1-x(1))^2 + 100*(x(2)-x(1))^2;

[YkTotal, fkbest, feval_total] = nelderMead(Y0a,del_e,del_oc,del_ic,gamma,f, solution, eps);

%  Y0a(:,:,1) = [9.5 10.5 9.5 9.5;
%                9.5 9.5 10.5 9.5;
%                9.5 9.5 9.5 10.5];
% Y0a(:,:,1) = [0 1 0 0;
%               0 0 1 0;
%               0 0 0 1];


%Y0a(:,4,2) = [1/3;1/3;0] + ([1/3;1/3;0]-Y0a(:,4,2))     %reflection
%Y0a(:,4,2) = [1/3;1/3;0] + 2.*([1/3;1/3;0]-Y0a(:,4,2))     %expansion  
%Y0a(:,4,2) = [1/3;1/3;0] + (1/2)*([1/3;1/3;0]-Y0a(:,4,2))     %OC
%Y0a(:,4,2) = [1/3;1/3;0] + (-1/2)*([1/3;1/3;0]-Y0a(:,4,2))     %IC
%Y0a(:,2,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,2,1)-Y0a(:,1,1))     %Shrink
%Y0a(:,3,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,3,1)-Y0a(:,1,1))     %Shrink
%Y0a(:,4,2) = Y0a(:,1,1) + (1/2)*(Y0a(:,4,1)-Y0a(:,1,1))     %Shrink
%simplexPlot.plotTotal(YkTotal(:,:,1:5),'C:\Users\Tyler\Google Drive\UBCO 2016-2020\2020-2021\Term 1\MATH 462\Group_Project_Test\Cosc419KGroupProject');
%simplexPlot.plot(YkTotal(:,:,1),YkTotal(:,:,2),1,'C:\Users\Tyler\Google Drive\UBCO 2016-2020\2020-2021\Term 1\MATH 462\Group_Project_Test\Cosc419KGroupProject');
%simplexPlot.plotTotal(Y0a,'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\Presentation\');
%plot3(1/3, 1/3, 0, 'o', 'linewidth', 2, 'Color', 'b')  %centroid
%plot3(0.6667, 0.6667, -1, 'o', 'linewidth', 2, 'Color', 'r')     %reflection
%plot3(1, 1, -2, 'o', 'linewidth', 2, 'Color', 'r')      %expansion
%plot3(01/2, 1/2, -1/2, 'o', 'linewidth', 2, 'Color', 'r')      %OC
%plot3(0.1667, 0.1667, 0.5, 'o', 'linewidth', 2, 'Color', 'r')      %IC
%plot3(1, 0, 0, 'o', 'linewidth', 2, 'Color', 'r')      %Shrink - y0
%plot3(9.5062, 8.4167, 8.7269, 'o', 'linewidth', 2, 'Color', 'r')

%plot3(YkTotal(1,1,end), YkTotal(2,1,end), fkbest(end), 'o', 'linewidth', 2, 'Color', 'r')

%plot3(0, 0, -2, 'o', 'linewidth', 2, 'Color', 'r')

for i = 1:length(YkTotal(1,1,:))
destination = 'C:\Users\Tyler\Google Drive\UBCO 2016-2020\2020-2021\Term 1\MATH 462\Group_Project_Test\Cosc419KGroupProject\Rosebrock\';
plot3(YkTotal(1,1,end), YkTotal(2,1,end), YkTotal(3,1,end), 'o', 'linewidth', 2, 'Color', 'r')
hold on
simplexPlot.plot(YkTotal(:,:,i),YkTotal(:,:,i+1),i,destination);
xlim([-1 3])
ylim([-1 4])
zlim([-3 3])
xlabel('x');
ylabel('y');
zlabel('z');
legend('Y1', 'Y2', 'Y3','Y4','Y5', 'Yk\_best', 'centroid', 'inside contraction point', 'Location', 'best')
h_current = figure(1);
legend('min',strcat('Y', num2str(i)), strcat('Y',num2str(i+1)))
h_current = gcf;
axes = gca;
set(h_current, 'Units','Inches');
pos = get(h_current,'Position');
set(h_current,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h_current, strcat(destination,'Rosenbrock',num2str(i), '-', num2str(i+1)),'-djpeg')
simplexPlot.plot(YkTotal(:,:,i),YkTotal(:,:,i+1),i,destination);

end



