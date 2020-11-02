function [] = convergencePlot2(X,Y,Z1,Z2,outputFile,logplot)
if logplot % convert to log function evals
    X(:,1) = log2(X(:,1));
    Y(:,1) = log2(Y(:,1));
    Z1(:,1) = log2(Z1(:,1));
    Z2(:,1) = log2(Z2(:,1));
    
    X(:,2) = log2(X(:,2));
    Y(:,2) = log2(Y(:,2));
    Z1(:,2) = log2(Z1(:,2));
    Z2(:,2) = log2(Z2(:,2));
end

%Plot the 3 functions%
plot(X(:,1),X(:,2),'-o','MarkerSize',10);
hold on
plot(Y(:,1),Y(:,2),'-x','MarkerSize',10);
plot(Z1(:,1),Z1(:,2),'-d','MarkerSize',10);
plot(Z2(:,1),Z2(:,2),'-s','MarkerSize',10);


%add labels%
title('Convergence plot');
legend('Problem 1','Problem 2','Problem 3a','Problem 3b');
if (logplot)
    xlabel(strcat('log_2(Number of Function Evaluations)'));
    ylabel('log_2(Best Function Value Found)');
    %axis([0 10 0 20])
else
    xlabel('Number of Function Evaluations');
    ylabel('Best Function Value Found')
end


%save the plot png to folder%
saveas(gcf,strcat(outputFile,'ConvergencePlot.png'));
hold off;


end

