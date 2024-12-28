function MODEL = training_phase(T_cell)
    N = numel(T_cell);
    MODEL = zeros(N, 9);

    for n = 1:N
        for k=1:9
            T = T_cell{n};
            H = laws_kernel(k);
            A = conv2(T, H, 'same');
            A2 = A .^2;
            MODEL(n,k) = sum(A2(:)) / numel(T);
        end
    end
end
