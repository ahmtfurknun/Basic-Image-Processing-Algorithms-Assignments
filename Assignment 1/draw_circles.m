function output_img = draw_circles(input_img, a_list, b_list, radius)
    output_img = input_img;
    for i = 1:length(a_list)
        a = a_list(i);
        b = b_list(i);
        output_img = insertShape(output_img, 'Circle', [b, a, radius], 'Color', 'red', 'LineWidth', 4);
    end
end