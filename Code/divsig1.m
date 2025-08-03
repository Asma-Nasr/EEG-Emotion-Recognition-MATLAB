function [trainS, tgTrainS, testS, tgTestS] = divsig1(sx, j)
    [row, col] = size(sx);
    k = round(row * 0.2); % Number of test samples for each fold

    % Test set indices for fold j
    kts = (1:k) + (j-1) * k; 
    ktr = setdiff(1:row, kts); % Training set indices

    % Training set
    trainS = sx(ktr, 1:col-1); % All but last column (features)
    tgTrainS = sx(ktr, col);   % Last column (labels)

    % Testing set
    testS = sx(kts, 1:col-1);   % All but last column (features)
    tgTestS = sx(kts, col);     % Last column (labels)
end
