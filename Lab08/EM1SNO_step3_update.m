function M = step3_update(S, k, LUT, M)
    for j = 1:k
        cluster_indices = (LUT == j);
        cluster_points = S(cluster_indices, :);
        if ~isempty(cluster_points)
            M(j, :) = mean(cluster_points, 1);
        else
            M(j, :) = M(j, :);
        end
    end
end
