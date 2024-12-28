function LUT = step2_assignment(S, k, LUT, M)
    [m, ~] = size(S);
    for i = 1:m
        x_i = S(i, :);
        distances = zeros(1, k);
        for j = 1:k
            mu_j = M(j, :);
            distances(j) = sum((x_i - mu_j).^2);
        end
            
        [~, minIndex] = min(distances);
        LUT(i) = minIndex;
    end
end
