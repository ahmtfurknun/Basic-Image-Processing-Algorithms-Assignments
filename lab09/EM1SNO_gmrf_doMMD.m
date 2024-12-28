function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        summa_deltaE = 0; 
        cycle = cycle + 1; 

        for y = 1:h
            for x = 1:w
                currLabel = mrf.classmask(y, x);

                neighbors = [];
                if y > 1, neighbors = [neighbors, mrf.classmask(y-1, x)]; end % Top
                if y < h, neighbors = [neighbors, mrf.classmask(y+1, x)]; end % Bottom
                if x > 1, neighbors = [neighbors, mrf.classmask(y, x-1)]; end % Left
                if x < w, neighbors = [neighbors, mrf.classmask(y, x+1)]; end % Right
                if y > 1 && x > 1, neighbors = [neighbors, mrf.classmask(y-1, x-1)]; end % Top-left
                if y > 1 && x < w, neighbors = [neighbors, mrf.classmask(y-1, x+1)]; end % Top-right
                if y < h && x > 1, neighbors = [neighbors, mrf.classmask(y+1, x-1)]; end % Bottom-left
                if y < h && x < w, neighbors = [neighbors, mrf.classmask(y+1, x+1)]; end % Bottom-right
                posteriorAct = mrf.logProbs{currLabel}(y, x);

                matching = sum(neighbors == currLabel);
                differing = numel(neighbors) - matching;
                priorAct = -beta * matching + beta * differing;

                U_act = posteriorAct + priorAct;

                newLabel = currLabel;
                while newLabel == currLabel
                    newLabel = randi(cnum);
                end

                posteriorNew = mrf.logProbs{newLabel}(y, x);

                matchingNew = sum(neighbors == newLabel);
                differingNew = numel(neighbors) - matchingNew;
                priorNew = -beta * matchingNew + beta * differingNew;

                U_new = posteriorNew + priorNew;

                dU = U_new - U_act;

                if dU < 0 || rand() < exp(-dU / T)
                    mrf.classmask(y, x) = newLabel;

                    summa_deltaE = summa_deltaE + abs(dU);
                end
            end
        end

        T = T * c;

        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
