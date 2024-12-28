function [isCross, output_image ] = detect_cross(circleImage)
    [H, T, R] = hough(circleImage);
    P = houghpeaks(H, 2, 'threshold', ceil(0.3 * max(H(:))), 'NHoodSize', [31 31]);
    lines = houghlines(circleImage, T, R, P, 'FillGap', 25, 'MinLength', 35);

    output_image = uint8(circleImage) * 255;
    for k = 1:length(lines)
        xy = [lines(k).point1, lines(k).point2];  % [x1 y1 x2 y2]
        
        % Draw the line in green on the image
        output_image = insertShape(output_image, 'Line', xy, 'Color', 'green', 'LineWidth', 2);
    end

    if length(lines) == 2 && sum(circleImage,"all") <= 450
        angleBetweenLines = abs(lines(2).theta - lines(1).theta);
        % For an "X", the angle should be approximately 90 degrees
        if abs(angleBetweenLines-90) <= 45  % Allow the small angle to be min 45 degrees
            isCross = true;
        else
            isCross = false;
        end
    else
        % If there are not exactly 2 lines detected, it's not an "X"
        isCross = false;
    end
end
