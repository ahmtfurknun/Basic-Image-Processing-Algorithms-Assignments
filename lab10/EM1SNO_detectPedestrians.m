function score = detectPedestrians(I, sample_HOG)
    candidate_HOG = pmHOG_extractHOG(I);
    product = candidate_HOG .* sample_HOG;

    significant_values = product(product > 0.01);
    score = sum(significant_values, 'omitnan');
end
