function B = random_dither(A)
    R = rand(size(A));
    B = A + R;
    B(B > 1) = 1;
end
