clc; close all; clear;
 
Y0a(:,:,1) = [3 1 3 2.1;
              3 2 2 1.9;
              3 3 1 2];
          
% Y0a(:,:,1) = [3 1 3 2.1;
%               3 2 2 1.9;
%               3 3 1 2];
% Y0b(:,:,1) =  -1*[3 1 3 2.1;
%               3 2 2 1.9;
%               3 3 1 2]; 


del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
solution = -2;
eps = 1e-6;

f = @(x) x(1)^2 + x(2)^2 + x(3)^2 - 2;
%f = @(x) (1-x(1))^2 + 100*(x(2)-x(1))^2 + (1 - x(2))^2 + 100*(x(3) - x(2))^2;
% f = @(x) 30 + (x(1)^2 - 10*cos(2*pi*x(1)) + (x(2)^2 - 10*cos(2*pi*x(2))) + x(3)^2 - 10*cos(2*pi*x(3))); 

[YkTotal, fkbest, feval_total] = nelderMead(Y0a,del_e,del_oc,del_ic,gamma,f, solution, eps);
% [YkTotala, fkbesta, feval_totala] = nelderMead(Y0a,del_e,del_oc,del_ic,gamma,f, solution, eps);
% [YkTotalb, fkbestb, feval_totalb] = nelderMead(Y0b,del_e,del_oc,del_ic,gamma,f, solution, eps);

%% For Single simplex plots
for i = 1:length(YkTotal(1,1,:))-1
%destination = 'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\Rheology2a\';
destination = 'C:\Users\Tyler\Google Drive\UBCO 2016-2020\2020-2021\Term 1\MATH 462\Group_Project_Test\Cosc419KGroupProject\';

plot3(YkTotal(1,1,end), YkTotal(2,1,end), YkTotal(3,1,end), 'o', 'linewidth', 2, 'Color', 'r')
hold on
simplexPlot.plot(YkTotal(:,:,i),YkTotal(:,:,i+1),i,destination);
xlim([-1 3])
ylim([-1 3])
zlim([-3 4])
grid on
xlabel('x');
ylabel('y');
zlabel('z');
legend('min',strcat('Y', num2str(i)), strcat('Y',num2str(i+1)))
h_current = gcf;
axes = gca;
set(h_current, 'Units','Inches');
pos = get(h_current,'Position');
set(h_current,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h_current, strcat(destination,'niceFunction',num2str(i)),'-dpng')
simplexPlot.plot(YkTotal(:,:,i),YkTotal(:,:,i+1),i,destination);

end

% %% For comparison of simplices in Rastrigin
% for i = 1:length(YkTotal(1,1,:)) - 1
% destination = 'C:\Users\Tyler\Google Drive\UBCO 2016-2020\2020-2021\Term 1\MATH 462\Group_Project_Test\Cosc419KGroupProject\Rastrigin\';
% plot3(YkTotala(1,1,end), YkTotala(2,1,end), YkTotala(3,1,end), 'o', 'linewidth', 2, 'Color', 'r')
% hold on
% plot3(YkTotalb(1,1,end), YkTotalb(2,1,end), YkTotalb(3,1,end), 'o', 'linewidth', 2, 'Color', 'b')
% simplexPlot.plot2(YkTotala(:,:,i),YkTotala(:,:,i+1),YkTotalb(:,:,i),YkTotalb(:,:,i+1),i,destination);
% xlim([-10 5])
% ylim([-5 5])
% zlim([-6 4])
% xlabel('x');
% ylabel('y');
% zlabel('z');
% legend('min 1','min 2',strcat('Ya', num2str(i)), strcat('Ya',num2str(i+1)),strcat('Yb',num2str(i)),strcat('Yb',num2str(i+1)))
% h_current = gcf;
% axes = gca;
% set(h_current, 'Units','Inches');
% pos = get(h_current,'Position');
% set(h_current,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
% print(h_current, strcat(destination,'Rastrigin',num2str(i)),'-dpng')
% end



