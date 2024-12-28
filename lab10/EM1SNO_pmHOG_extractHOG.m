function norm_HOG = pmHOG_extractHOG(I)
    I = double(I);

    [H, W] = size(I);
    h = H / 8; 
    w = W / 8; 

    norm_HOG = zeros(h - 1, w - 1, 36);

    for blockCol = 1:(h - 1)
        for blockRow = 1:(w - 1)
            block = I((blockCol - 1) * 8 + 1:(blockCol + 1) * 8, ...
                       (blockRow - 1) * 8 + 1:(blockRow + 1) * 8);

            feature_vector = [];

            for cellRow = 0:1
                for cellCol = 0:1
                    
                    cell = block(cellCol * 8 + 1:(cellCol + 1) * 8, ...
                                 cellRow * 8 + 1:(cellRow + 1) * 8);

                    [PHI, MAG] = pmHOG_gradient(cell);

                    H = pmHOG_binner(PHI, MAG);

                    feature_vector = [feature_vector, H];
                end
            end

           
            feature_vector = feature_vector / sum(feature_vector);
            norm_HOG(blockCol, blockRow, :) = feature_vector;
        end
    end
end
