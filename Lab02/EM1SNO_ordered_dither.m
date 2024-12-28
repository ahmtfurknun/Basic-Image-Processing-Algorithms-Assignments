function B = ordered_dither(I, D)
    [rows_I, cols_I] = size(I);
    [rows_D, cols_D] = size(D);
    
    D_rep = repmat(D, rows_I / rows_D, cols_I / cols_D);
    
    B = I > D_rep;
    
    B(B > 1) = 1;
end