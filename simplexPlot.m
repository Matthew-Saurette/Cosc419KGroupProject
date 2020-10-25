%Simplex plots

%Input: 2 simplices and iterate, and output folder
%output plot of 2 simplices into specified foler as png
classdef simplexPlot
    methods(Static)
        function j = plot(X,Y,iter,outputFile)
            

            [k1,av1] = convhull(X(1,:),X(2,:),X(3,:));
            [k2,av2] = convhull(Y(1,:),Y(2,:),Y(3,:));

            s1 = trimesh(k1,X(1,:),X(2,:),X(3,:),'FaceColor','cyan','DisplayName',strcat('Y',string(iter)));
            hold on;
            s2 = trimesh(k2,Y(1,:),Y(2,:),Y(3,:),'FaceColor','cyan','DisplayName',strcat('Y',string(iter+1)));
            alpha(s1,0.1);
            legend show;
            saveas(gcf,strcat(outputFile,'simplex',string(iter), '-',string(iter+1),'.png'));
            hold off;
        end
    end
end

