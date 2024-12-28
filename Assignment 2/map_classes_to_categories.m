function mapped_classes = map_classes_to_categories(GUESS, num_samples)
    mapped_classes = zeros(size(GUESS));
    start_class_1 = 1;
    end_class_1 = num_samples(1);

    mask = (GUESS >= start_class_1) & (GUESS <= end_class_1);
    mapped_classes(mask) = 1;

    start_class_2 = end_class_1+1;
    end_class_2 = end_class_1+num_samples(2);

    mask = (GUESS >= start_class_2) & (GUESS <= end_class_2);
    mapped_classes(mask) = 2;

    start_class_3 = end_class_2+1;
    end_class_3 = end_class_2+num_samples(3);

    mask = (GUESS >= start_class_3) & (GUESS <= end_class_3);
    mapped_classes(mask) = 3;

end
