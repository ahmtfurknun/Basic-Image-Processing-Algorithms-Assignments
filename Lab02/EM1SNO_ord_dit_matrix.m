function D = ord_dit_matrix(n)
    D = 0;
    D_prev = 0;
    for i = 1:n
        D = [4*D_prev + 0, 4*D_prev + 2;
             4*D_prev + 3, 4*D_prev + 1];
        D_prev = D;
    end

    D = D * ((1/4)^(n));
end

