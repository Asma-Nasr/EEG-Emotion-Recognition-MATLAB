function x = addTargetsAndCombine(H, F, S, C)
    % Adds target columns to each matrix and combines them into one dataset.
    %
    % Inputs:
    %   H - Matrix for class 1
    %   F - Matrix for class 2
    %   S - Matrix for class 3
    %   C - Matrix for class 4
    %
    % Output:
    %   x - Combined dataset with targets in the last column

    % Determine the number of rows in each matrix
    numH = size(H, 1);
    numF = size(F, 1);
    numS = size(S, 1);
    numC = size(C, 1);

    % Create target columns
    H_targets = ones(numH, 1);        % Class 1 for H
    F_targets = 2 * ones(numF, 1);    % Class 2 for F
    S_targets = 3 * ones(numS, 1);    % Class 3 for S
    C_targets = 4 * ones(numC, 1);    % Class 4 for C

    % Add target columns to each matrix
    H = [H, H_targets];  % Append targets to H
    F = [F, F_targets];  % Append targets to F
    S = [S, S_targets];  % Append targets to S
    C = [C, C_targets];  % Append targets to C

    % Combine all F, H, C, S into x
    x = [H; F; S; C]; % Features and targets combined

    % Display the size of the combined dataset
    disp(['Size of combined dataset x: ', num2str(size(x))]);
end
