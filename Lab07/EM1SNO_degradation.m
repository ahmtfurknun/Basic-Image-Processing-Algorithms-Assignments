function [y, h, n] = degradation(x)

    h = fspecial("motion",21, 11);
    y = imfilter(x, h, 'replicate', 'same', 'conv');
    n = sqrt(0.001) * randn(size(x));
    y = y+n;
    
end
