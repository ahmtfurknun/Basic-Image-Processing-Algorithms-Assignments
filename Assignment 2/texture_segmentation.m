function OUT = texture_segmentation(R, use_saved_model)
    texture_categories = {'grass','car', 'tree'};
    num_categories = numel(texture_categories);
    num_samples = [6, 7, 2];

    T_cell = cell(sum(num_samples), 1);

    if ~use_saved_model
        counter = 0;
        for t = 1:num_categories
            category = texture_categories{t};
            for s = 1:num_samples(t)
                counter = counter+1;
                file_name = sprintf('samples/%s_%d.png', category, s);
                T_cell{counter} = im2double(imread(file_name));
            end
        end
        
        MODEL = training_phase(T_cell);
        save('MODEL.mat', 'MODEL');
    else
        MODEL = matfile('MODEL.mat').MODEL;
    end
    
    GUESS = recognition_phase(R, MODEL);
    GUESS = map_classes_to_categories(GUESS, num_samples);
    OUT = majority_voting(GUESS, 9); 
end
