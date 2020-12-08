%rheology 1 a/b
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;

%rheology 2a
% del_e = 4.71;            
% del_oc = 0.65;
% del_ic = -0.3;
% gamma = 0.94;

%rheology 2b
% del_e = 2.3;            
% del_oc = 0.46;
% del_ic = -0.45;
% gamma = 0.01;

%Rheology Problem
gammadot = [0.0137, 0.0274, 0.0434, 0.0866, 0.137, 0.274, 0.434, 0.866, 1.37, 2.74, 4.34, 5.46, 6.88];
eta_i = [3220, 2190, 1640, 1050, 766, 490, 348, 223, 163, 104, 76.7, 68.1, 58.2];
f = @(x) sum((abs(520*x(1)*(1+(14*x(2))^2.*(gammadot).^2).^(((0.038*x(3))-1)/2)-eta_i)).^1); 

Y0a = [0 1 0 0;
       0 0 1 0;
       0 0 0 1];
Y0b = Y0a + (9.5)*ones(3,4); 
solution = f([9.48,8.36,8.71]);

[YkTotal, fkbest, feval_total] = nelderMead(Y0a,del_e,del_oc,del_ic,gamma,f, solution, eps);

for i = 1:length(YkTotal(1,1,:))-1
destination = 'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\Rheology1a\';

plot3(YkTotal(1,1,end), YkTotal(2,1,end), YkTotal(3,1,end), 'o', 'linewidth', 2, 'Color', 'r')
hold on
simplexPlot.plot(YkTotal(:,:,i),YkTotal(:,:,i+1),i,destination);
xlim([0 10])
ylim([-10 0])
zlim([0 10])
grid on
xlabel('\eta_0');
ylabel('\lambda');
zlabel('\beta');
legend('min',strcat('Y', num2str(i)), strcat('Y',num2str(i+1)))
h_current = gcf;
axes = gca;
set(h_current, 'Units','Inches');
pos = get(h_current,'Position');
set(h_current,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3),pos(4)]);
print(h_current, strcat(destination,'Rheology1a',num2str(i)),'-dpng')
end
