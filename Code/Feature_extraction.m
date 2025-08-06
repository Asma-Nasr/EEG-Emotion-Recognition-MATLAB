% Define the folder containing the .xlsx files
folderPath = '../Data/'; % Replace with your folder path
files = dir(fullfile(folderPath, '*.xlsx')); % Get a list of all .xlsx files

% Loop through each file in the folder
for k = 1:length(files)
    % Construct the full file name
    fileName = fullfile(folderPath, files(k).name);
    
    % Import data from the current .xlsx file
    sig = importdata(fileName);
    
    % Extract signals
    P4 = sig(:,1);
    O2 = sig(:,2);
    P8 = sig(:,3);
    T8 = sig(:,4);
    C4 = sig(:,5);
    CZ = sig(:,6);
    FZ = sig(:,7);
    F4 = sig(:,8);
    FP2 = sig(:,9);
    F8 = sig(:,10);
    FP1 = sig(:,11);
    F7 = sig(:,12);
    F3 = sig(:,13);
    C3 = sig(:,14);
    T7 = sig(:,15);
    P7 = sig(:,16);
    P3 = sig(:,17);
    O1 = sig(:,18);
    PZ = sig(:,19);
    
    % Get sizes
    t = [size(P4, 1), size(O2, 1), size(P8, 1), size(T8, 1), ...
         size(C4, 1), size(CZ, 1), size(FZ, 1), size(F4, 1), ...
         size(FP2, 1), size(F8, 1), size(FP1, 1), size(F7, 1), ...
         size(F3, 1), size(C3, 1), size(T7, 1), size(P7, 1), ...
         size(P3, 1), size(O1, 1), size(PZ, 1)];
    
    rr = min(t);
    
    % Trim signals
    FP1 = FP1(500:rr);
    P4 = P4(500:rr);
    O2 = O2(500:rr);
    P8 = P8(500:rr);
    T8 = T8(500:rr);
    C4 = C4(500:rr);
    CZ = CZ(500:rr);
    FZ = FZ(500:rr);
    F4 = F4(500:rr);
    FP2 = FP2(500:rr);
    F8 = F8(500:rr);
    F7 = F7(500:rr);
    F3 = F3(500:rr);
    C3 = C3(500:rr);
    T7 = T7(500:rr);
    P7 = P7(500:rr);
    P3 = P3(500:rr);
    O1 = O1(500:rr);
    PZ = PZ(500:rr);
    
    % Filter signals
    [filFP1, filFP2, filF7, filF3, filFZ, filF4, filF8, filT7, ...
     filC3, filCZ, filC4, filT8, filP7, filP3, filPZ, filP4, ...
     filP8, filO1, filO2] = nfilter(FP1, FP2, F7, F3, FZ, F4, F8, ...
                                    T7, C3, CZ, C4, T8, P7, P3, ...
                                    PZ, P4, P8, O1, O2);
    myMFCC
    % Save the results
    saveFileName = fullfile(folderPath, ['MFCC_' files(k).name(1:end-5) '.mat']);
    save(saveFileName, 'FE_C');
end
