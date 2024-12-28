function [r_vect, t_vect] = non_max_sup(A, k, p)
    r_vect = zeros(k);
    t_vect = zeros(k);

    for i = 1:k
        [max_val, idx] = max(A(:));
        [r, t] = ind2sub(size(A), idx); 

        r_vect(i) = r;
        t_vect(i) = t;

        x_1 = max(1, r - p);
        x_2 = min(size(A, 1), r + p);
        y_1 = max(1, t - p);
        y_2 = min(size(A, 2), t + p);

        A(x_1:x_2, y_1:y_2) = 0;
    end
end



