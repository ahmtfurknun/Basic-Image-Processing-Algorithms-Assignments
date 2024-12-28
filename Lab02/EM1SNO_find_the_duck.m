function duck = find_the_duck(I)
    % duck_gt = imread('input/duck_gt.png');
    % best_err = Inf;
    % best_red_min = 0;
    % best_red_max = 255;
    % best_green_min = 0;
    % best_green_max = 255;
    % best_blue_min = 0;
    % best_blue_max = 255;
    % 
    % for red_min = 0:50:0
    %     for red_max = 255:50:255
    %         for green_min = 0:50:0
    %             for green_max = 255:50:255
    %                 for blue_min = 0:5:255
    %                     for blue_max = blue_min:5:255
    %                         duck_mask = (I(:,:,1) >= red_min   & I(:,:,1) <= red_max) & ...
    %                                     (I(:,:,2) >= green_min & I(:,:,2) <= green_max) & ...
    %                                     (I(:,:,3) >= blue_min  & I(:,:,3) <= blue_max);
    % 
    %                         duck = duck_mask;
    %                         err = sum(sum(abs(duck - duck_gt))) / numel(duck_gt);
    %                         if err < best_err
    %                             best_err = err;
    %                             best_red_min = red_min;
    %                             best_red_max = red_max;
    %                             best_green_min = green_min;
    %                             best_green_max = green_max;
    %                             best_blue_min = blue_min;
    %                             best_blue_max = blue_max;
    %                         end
    %                     end
    %                 end
    %             end
    %         end
    %     end
    % end
    % 
    % disp(['Best error: ', num2str(best_err)]);
    % disp([best_red_min, best_red_max, best_green_min, best_green_max, best_blue_min, best_blue_max]);
    % duck = (I(:,:,1) >= best_red_min   & I(:,:,1) <= best_red_max) & ...
    %        (I(:,:,2) >= best_green_min & I(:,:,2) <= best_green_max) & ...
    %        (I(:,:,3) >= best_blue_min  & I(:,:,3) <= best_blue_max);


    duck = ((I(:,:,3) <= 69));


end