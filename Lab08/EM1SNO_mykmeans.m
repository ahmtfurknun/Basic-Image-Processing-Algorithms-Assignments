function [LUT, M, iter] = mykmeans(S, k)
    [LUT, M] = step1_initialization(S, k);
    iter = 0; 
    converged = false; 
    threshold = 0.02;
    max_iter = 100;

    while ~converged && iter < max_iter
        iter = iter + 1;
        LUT = step2_assignment(S, k, LUT, M); 

        M_old = M;
        M = step3_update(S, k, LUT, M); 
       
        centroid_change = sum(sum((M - M_old).^2));
        converged = centroid_change < threshold;
    end
    fprintf('The algorithm converged in %d iterations.\n', iter);
end
