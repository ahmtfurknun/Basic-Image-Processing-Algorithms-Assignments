function ClassMap = recognition_phase(I, MODEL)
    width = size(I, 1);
    height = size(I, 2);

    ClassMap = zeros(width, height);
    BB = zeros(width, height, 27);
    N = size(MODEL, 1);
    norm = ones(15)/(15*15);
    
    for ch = 1:3
        for k=1:9
            H = laws_kernel(k);
            B = conv2(I(:,:,ch), H, 'same');
            BB(:,:,(ch-1)*9+k) = conv2(B.^2, norm, 'same');
        end
    end
    

    for x=1:width
        for y=1:height
            sum_abs_diff = zeros(1, N);
            for n = 1:N
                b = BB(x,y,:);
                m = MODEL(n,:);
                sum_abs_diff(n) = sum(abs(b(:) - m(:)));
            end
            [~, i] = min(sum_abs_diff);
            ClassMap(x,y) = i;
        end
    end
end
