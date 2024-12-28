function [BGR] = swap_RB_dumb(RGB)
BGR = RGB;
    for i = 1:size(RGB, 1)
        for j = 1:size(RGB, 2)
            BGR(i, j, 1) = RGB(i, j, 3);
            BGR(i, j, 3) = RGB(i, j, 1);
        end
    end
end