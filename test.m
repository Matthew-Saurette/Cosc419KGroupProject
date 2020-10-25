%This is a test file for our github to play around with :) %


%testing simplex plot%%
X=[0,1,0,0;
    0,0,1,0;
    0,0,0,1];
Y=[0,-1,0,0;
    0,0,-1,0;
   0,0,0,-1];
Z = [0,-0.5,0,0;
    0,0,-.5,0;
   0,0,0,-.5];

simplexPlot.plot(X,Y,1,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');
X = {X,Y,Z}
simplexPlot.plotTotal(X,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');
%testing convergence plot%
X =[0,100; 1,90;2,80;3,70];
Y =[0,110; 1,100;2,90];
Z =[0,70; 1,60;2,50];

convergencePlot.plot(X,Y,Z,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testConvergenceFolder\',true);