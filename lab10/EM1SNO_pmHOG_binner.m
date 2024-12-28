function H = pmHOG_binner(PHI, MAG)
    H = zeros(1, 9);
    binEdges = linspace(-90, 90, 10);

    for binIdx = 1:9
        mini = binEdges(binIdx);
        maxi = binEdges(binIdx + 1);

        LOG_MASK = (PHI >= mini & PHI < maxi);

        selectedMAG = MAG(LOG_MASK);

        H(binIdx) = sum(selectedMAG);
    end
end

