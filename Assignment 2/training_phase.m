function MODEL = training_phase(T_cell)
    N = numel(T_cell);
    MODEL = zeros(N, 27); % 27 features (9 per channel × 3 channels)

    for n = 1:N
        T = T_cell{n}; % Full texture sample (all channels)
        feature_vector = [];

        for ch = 1:3 % Iterate over channels
            channel = T(:, :, ch);
            for k = 1:9
                H = laws_kernel(k);    
                A = conv2(channel, H, 'same');
                A2 = A .^ 2;
                feature_value = sum(A2(:)) / numel(channel); % Normalize by sample size
                feature_vector = [feature_vector, feature_value]; % Append features
            end
        end

        MODEL(n, :) = feature_vector; % Store 27-dimensional feature vector
    end
end



% function MODEL = training_phase(T_cell)
%     N = numel(T_cell);
%     MODEL = zeros(N, 9);
%     for n = 1:N
%         for k=1:9
%             T = T_cell{n};
%             H = laws_kernel(k);    
%             A = conv2(T, H, 'same');
%             A2 = A .^2;
%             MODEL(n,k) = sum(A2(:)) / numel(T);
%         end
%     end
% end
