function [PHI, MAG] = pmHOG_gradient(I)
    I = double(I);

    kernel_x = [-1 0 1]; 
    kernel_y = [-1; 0; 1]; 

    Gx = imfilter(I, kernel_x, 'replicate', 'same');
    Gy = imfilter(I, kernel_y, 'replicate', 'same');

    PHI = rad2deg(atan(Gy./Gx));
    MAG = sqrt(Gx.^2 + Gy.^2);
end
