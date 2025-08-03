% Import features extracted files of emotions H, F, S, and C
H = importdata('../Data/Feature Extracted/MFCC_HAPPY.mat'); 
F = importdata('../Data/Feature Extracted/MFCC_FEAR.mat');
S = importdata('../Data/Feature Extracted/MFCC_SAD.mat');
C = importdata('../Data/Feature Extracted/MFCC_CALM.mat');

% Combine datasets with targets
x = addTargetsAndCombine(H, F, S, C);

% Randomize x
[row, col] = size(x);
R = randperm(row);
rx = x(R, :); % Randomize rows

% Initialize variables to store accuracy and models
perac = zeros(1, 5); % To store accuracy for each fold
px = 0; % Initialize best accuracy

% Dividing x into 5 folds
for i = 1:5
    [trainS, tgTrainS, testS, tgTestS] = divsig1(rx, i);
    
    % Ensure tgTrainS and tgTestS are column vectors
    tgTrainS = tgTrainS(:); % Convert to column vector
    tgTestS = tgTestS(:);   % Convert to column vector

    if size(trainS, 1) ~= length(tgTrainS)
        error('Number of observations in trainS and tgTrainS do not match.');
    end
    
    if size(testS, 1) ~= length(tgTestS)
        error('Number of observations in testS and tgTestS do not match.');
    end

    % KNN classification
    mdl = fitcknn(trainS, tgTrainS, 'NumNeighbors', 5); % Adjust 'NumNeighbors' as needed
    y = predict(mdl, testS);
    
    % Calculate accuracy
    perAcc = sum(y == tgTestS) / length(tgTestS) * 100; % Accuracy
    perac(i) = perAcc;

    % Display accuracy for the current fold
    disp(['Accuracy for fold ', num2str(i), ': ', num2str(perAcc), '%']);

    % Calculate and display confusion matrix
    cm = confusionmat(tgTestS, y);
    disp(['Confusion Matrix for fold ', num2str(i), ':']);
    disp(cm);

    % Visualize the confusion matrix
    figure;
    heatmap(cm, 'Title', ['Confusion Matrix for Fold ', num2str(i)], ...
            'XLabel', 'Predicted Classes', 'YLabel', 'True Classes', ...
            'CellLabelFormat', '%d', ...
            'XDisplayLabels', {'Happy', 'Fear', 'Sad', 'Calm'}, ...
            'YDisplayLabels', {'Happy', 'Fear', 'Sad', 'Calm'});
    
    % Save the best model based on accuracy
    if i == 1 || perAcc > px
        mdlx = mdl;
        px = perAcc;
    end
end

% Save the best model
save('mdl', 'mdlx');

predictions = predict(mdlx, testS);

% Calculate accuracy
accuracy = sum(predictions == tgTestS) / length(tgTestS) * 100;

% Display the accuracy
disp(['Accuracy of the model on new data: ', num2str(accuracy), '%']);
%% Confusion matrix
cm = confusionmat(tgTestS, predictions);

% Display the confusion matrix
disp('Confusion Matrix:');
disp(cm);

% Visualize the confusion matrix
figure;
heatmap(cm, 'Title', 'Confusion Matrix', ...
        'XLabel', 'Predicted Classes', 'YLabel', 'True Classes', ...
        'CellLabelFormat', '%d', ...
        'XDisplayLabels', {'Happy', 'Fear', 'Sad', 'Calm'}, ...
        'YDisplayLabels', {'Happy', 'Fear', 'Sad', 'Calm'});
