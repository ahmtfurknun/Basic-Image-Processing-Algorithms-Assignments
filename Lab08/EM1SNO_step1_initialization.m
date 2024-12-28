function [LUT, M] = step1_initialization(S, k)
    [m, n] = size(S);
    LUT = zeros(1, m);
    M = zeros(k, n);
    step = floor(m / k);
    for i = 1:k
        M(i, :) = S(1 + (i - 1) * step, :);
    end
end
