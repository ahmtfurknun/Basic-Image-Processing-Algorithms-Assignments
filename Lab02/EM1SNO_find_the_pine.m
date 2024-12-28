function pine = find_the_pine(I)
    % pine_gt = imread('input/pine_gt.png');
    % I = rgb2hsv(I);
    % 
    % best_err = Inf;
    % best_hue_min = 0;
    % best_hue_max = 1;
    % best_saturation_min = 0;
    % best_saturation_max = 1;
    % best_value_min = 0;
    % best_value_max = 1;
    % 
    % for hue_min = 0:0.05:1
    %     for hue_max = hue_min:0.05:1
    %         for saturation_min = 0:0.25:0
    %             for saturation_max = 1:0.25:1
    %                 for value_min = 0:0.25:0
    %                     for value_max = 1:0.25:1
    %                         pine_mask = (I(:,:,1) >= hue_min   & I(:,:,1) <= hue_max) & ...
    %                                     (I(:,:,2) >= saturation_min & I(:,:,2) <= saturation_max) & ...
    %                                     (I(:,:,3) >= value_min  & I(:,:,3) <= value_max);
    % 
    %                         pine = pine_mask;
    %                         err = sum(sum(abs(pine - pine_gt))) / numel(pine_gt);
    %                         if err < best_err
    %                             best_err = err;
    %                             best_hue_min = hue_min;
    %                             best_hue_max = hue_max;
    %                             best_saturation_min = saturation_min;
    %                             best_saturation_max = saturation_max;
    %                             best_value_min = value_min;
    %                             best_value_max = value_max;
    %                         end
    %                     end
    %                 end
    %             end
    %         end
    %     end
    % end
    % 
    % disp(['Best error: ', num2str(best_err)]);
    % disp([best_hue_min, best_hue_max, best_saturation_min, best_saturation_max, best_value_min, best_value_max]);
    % pine= (I(:,:,1) >= best_hue_min   & I(:,:,1) <= best_hue_max) & ...
    %       (I(:,:,2) >= best_saturation_min & I(:,:,2) <= best_saturation_max) & ...
    %       (I(:,:,3) >= best_value_min  & I(:,:,3) <= best_value_max);
    
    I = rgb2hsv(I);
    pine= (I(:,:,1) <= 0.15);
  
    
end