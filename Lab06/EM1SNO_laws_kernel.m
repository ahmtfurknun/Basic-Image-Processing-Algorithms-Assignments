function H = laws_kernel(k)
    if k < 1 || k > 9
        error('Input must be an integer between 1 and 9.');
    end

    L = [1, 2, 1]';
    E = [1, 0, -1]';
    S = [1, -2, 1]';

    L = L /6;
    E = E /2;
    S = S /2;
    kernels = {L*L'; L*E'; L*S'; E*L'; E*E'; E*S'; S*L'; S*E'; S*S'};

    H = kernels{k};
end
