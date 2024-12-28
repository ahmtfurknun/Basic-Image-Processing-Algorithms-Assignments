function [PAD] = pad_image(varargin)
    IMG = varargin{1};
    if nargin > 1
        border_size = varargin{2};
    else
        border_size = 10;
    end

    if size(IMG, 3) ~= 1
        warning('Input image is not grayscale. It will be converted to grayscale');
        IMG = rgb2gray(IMG);
    end
    PAD = zeros(size(IMG, 1) + 2 * border_size, size(IMG, 2) + 2 * border_size, 'uint8');
    PAD(border_size+1: border_size+size(IMG, 1), border_size+1: border_size+size(IMG, 2)) = IMG;
end