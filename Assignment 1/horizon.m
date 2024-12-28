function [angle] = horizon(image, precision)
% Jan Motl (2024). Straighten image 
% (https://www.mathworks.com/matlabcentral/fileexchange/40239-straighten-image), 
% MATLAB Central File Exchange. Retrieved October 13, 2024.
% Modified by Ahmet Furkan Un

    %if image is portrait (i.e height > width), 
    %make it landscape (i.e height < width)
    isPortrait = false;
    if size(image, 1) > size(image, 2)
        image = imrotate(image, 90);
        isPortrait = true;
    end

    maxsize = max(size(image));
    T = fftshift(fft2(image, maxsize, maxsize)); % create rectangular transform
    T = log(abs(T)+1);                           % get magnitude in <0..inf)  
    % Combine two FFT quadrants together (another two quadrants are symetric).
    center = ceil((maxsize+1)/2);
    evenS = mod(maxsize+1, 2);
    T = (rot90(T(center:end, 1+evenS:center), 1) + T(center:end, center:end));
    T = T(2:end, 2:end);    % remove artifacts for expense of inaccuracy
    % Find the dominant orientation
    angles = floor(90/precision);
    score = zeros(angles, 1);
    maxDist = maxsize/2-1;
    for angle = 0:angles-1
        [y,x] = pol2cart(deg2rad(angle*precision), 0:maxDist-1); % all [x,y]
        for i = 1:maxDist
            score(angle+1) = score(angle+1) + T(round(y(i)+1), round(x(i)+1));
        end
    end
    % Return the most dominant direction.
    [~, position] = max(score);
    angle = (position-1)*precision;
    angle = mod(45+angle,90)-45;

    

    %if circles located in the left half of the image, the end result will
    %be upside down. Rotate it 180 degrees more
    r = 40;
    H = circular_hough(image, r);
    non_max_sup__k =  8;
    non_max_sup__p = 10;
    [~, B] = non_max_sup(H, non_max_sup__k, non_max_sup__p);
    B = sort(B);
    if B(1) <= size(image, 2)/2
        angle = angle + 180;
    end

    %if image was portrait in the beginnig, deduct the previously added
    %rotation
    if isPortrait
        angle = angle - 90;
    end
end

