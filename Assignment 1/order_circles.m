function [A_out,B_out] = order_circles(A,B)
    circle_centers = [A, B]; 
    sorted_centers = sortrows(circle_centers, [1 9]);
    for i = 2:2:length(A)
            sorted_centers(i, 1) = sorted_centers(i-1, 1);
    end
    sorted_centers = sortrows(sorted_centers, [1 9]);
    A_out = sorted_centers(:, 1); 
    B_out = sorted_centers(:, 9); 
end

