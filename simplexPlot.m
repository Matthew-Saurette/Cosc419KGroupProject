%Simplex plots

%Input: 2 simplices and iterate, and output folder
%output plot of 2 simplices into specified foler as png
classdef simplexPlot
    methods(Static)
        function j = plot(X,Y,iter,outputFile)
            
            [k1,av1] = convhull(X(1,:),X(2,:),X(3,:));
            [k2,av2] = convhull(Y(1,:),Y(2,:),Y(3,:));
            if mod(iter,2) == 1
            s1 = trimesh(k1,X(1,:),X(2,:),X(3,:),'FaceColor','red','DisplayName',strcat('Y',string(iter)));
            hold on;            
            s2 = trimesh(k2,Y(1,:),Y(2,:),Y(3,:),'FaceColor','blue','DisplayName',strcat('Y',string(iter+1)));
            alpha(s1,0.1);
            legend show;
            else 
            [k1,av1] = convhull(X(1,:),X(2,:),X(3,:));
            [k2,av2] = convhull(Y(1,:),Y(2,:),Y(3,:));
            s1 = trimesh(k2,Y(1,:),Y(2,:),Y(3,:),'FaceColor','blue','DisplayName',strcat('Y',string(iter)));
            hold on;            
            s2 = trimesh(k1,X(1,:),X(2,:),X(3,:),'FaceColor','red','DisplayName',strcat('Y',string(iter+1)));
            alpha(s2,0.1);
            legend show;    
            %saveas(gcf,strcat(outputFile,'simplex',string(iter), '-',string(iter+1),'.png'));
            end
            hold off;
        end
        function j = plot2(X,Y,Z,W,iter,outputFile)
            

            [k1,av1] = convhull(X(1,:),X(2,:),X(3,:));
            [k2,av2] = convhull(Y(1,:),Y(2,:),Y(3,:));
            [k3,av3] = convhull(Z(1,:),Z(2,:),Z(3,:));
            [k4,av4] = convhull(W(1,:),W(2,:),W(3,:));

            s1 = trimesh(k1,X(1,:),X(2,:),X(3,:),'FaceColor','cyan','DisplayName',strcat('Y',string(iter)));
            hold on;
            s2 = trimesh(k2,Y(1,:),Y(2,:),Y(3,:),'FaceColor','blue','DisplayName',strcat('Y',string(iter+1)));
            alpha(s1,0.1);
            s3 = trimesh(k3,Z(1,:),Z(2,:),Z(3,:),'FaceColor','blue','DisplayName',strcat('Y',string(iter+1)));
            alpha(s3,0.1);
            s4 = trimesh(k4,W(1,:),W(2,:),W(3,:),'FaceColor','blue','DisplayName',strcat('Y',string(iter+1)));
            legend show;
            saveas(gcf,strcat(outputFile,'simplex',string(iter), '-',string(iter+1),'.png'));
            hold off;
        end
        function j = plotTotal(X,outputFile)
            
            for i = 1:length(X(1,1,:))
                
                [k1,av1] = convhull(X(1,:,i),X(2,:,i),X(3,:,i));
                s1 = trimesh(k1,X(1,:,i),X(2,:,i),X(3,:,i),'FaceColor',[1,i/length(X(1,1,:)),0],'DisplayName',strcat('Y',string(i)));
                alpha(s1,0.1);
                if i ==1
                    hold on;
                end
            end
                
            legend show;
            saveas(gcf,strcat(outputFile,'simplexCombined_a','.png'));
            hold off;
            
        end
    end
end

