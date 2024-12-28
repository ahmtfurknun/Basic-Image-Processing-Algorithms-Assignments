function [resultMatrix] = processor(I, varargin)
    if nargin == 2
        verbose = varargin{1};
    else
        verbose = false;
    end

    if size(I, 3) == 3
        I = rgb2gray(I);
    end

    enhanced = histogram_stretch(I);
    edged = edge(enhanced, 'Canny', [0.15, 0.2]);
    
    angle = horizon(edged, 1);
   
    straightened = imrotate(edged, -angle);
    rotatedImage = imrotate(I, -angle);    

    r = 41;

    H = circular_hough(straightened, r);
    non_max_sup__k =  8;
    non_max_sup__p = 10;

    [A, B] = non_max_sup(H, non_max_sup__k, non_max_sup__p);
    circled = draw_circles(rotatedImage, A, B, r);

    if verbose
        figure(1);
        subplot(1,2,1);
        imshow(I)
        title('Original input image')

        subplot(1,2,2);
        imshow(straightened)
        title('Straghtened edge image')

        figure(2);
        subplot(1,2,1);
        imshow(circled)
        title('Straghtened original image with circles')

        subplot(1,2,2);
        imagesc(H)
        title('Hough Space')
    end
    

    resultMatrix = zeros(4, 2);
    [A, B] = order_circles(A, B);
    if verbose
        figure(3);
    end
    for i = 1:8
        circleImage = imcrop(rotatedImage, [B(i)-1.25*r, A(i)-1.25*r, 2.5*r, 2.5*r]);
        circleEdge = imcrop(straightened, [B(i)-0.65*r, A(i)-0.65*r, 1.3*r, 1.3*r]);
        [isCross, img] = detect_cross(circleEdge);
        if isCross
            titl = "true";
            resultMatrix(ceil(i/2), 2-mod(i,2)) = 1;
        else
            titl = "false";
        end
        
        if verbose
            subplot(4,2,i);
            imshow(circleImage);
            title(titl);
        end
    end
end

