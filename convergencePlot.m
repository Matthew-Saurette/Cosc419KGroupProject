%Converge plot

%input: [functionevals , f(yk)]for each of the three problems,outputfile location, logplot bool 
%output: png of convergence plot

classdef convergencePlot
    methods(Static)
        function j = plot(X,Y,Z,outputFile,logplot)
            
            if logplot % convert to log function evals
                X(:,1) = log2(X(:,1));
                Y(:,1) = log2(Y(:,1));
                Z(:,1) = log2(Z(:,1));
            end
            
            %Plot the 3 functions%
            plot(X(:,1),X(:,2),'-o','MarkerSize',10);
            hold on
            plot(Y(:,1),Y(:,2),'-x','MarkerSize',10);
            
            plot(Z(:,1),Z(:,2),'-d','MarkerSize',10);
            
            
            %add labels%
            title('Convergence plot');
            legend('Problem 1','Problem 2','Problem 3');
            if (logplot) 
                xlabel(strcat('log_2(Number of Function Evaluations)')); 
                ylabel('Best Function Value Found');
            else
                xlabel('Number of Function Evaluations');
                ylabel('Best Function Value Found')
            end
            
            %save the plot png to folder%
            saveas(gcf,strcat(outputFile,'ConvergencePlot.png'));
            hold off;
        end
    end
end
