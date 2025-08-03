%% Loading the model

% Load the saved model
loadedData = load('mdl.mat');

% Access the model
mdlxz = loadedData.mdlx;  

% Optionally, display the model to confirm it's loaded
disp(mdlxz);
%% 
predictions = predict(mdlxz, testS);

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
