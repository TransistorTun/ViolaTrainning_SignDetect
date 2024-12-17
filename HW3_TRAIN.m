idir = 'D:\HK241\Computer_Vision\HW3\HW3';

% Tải file dữ liệu sign
load(fullfile(idir, 'sign.mat'));

% Tạo danh sách ảnh dương từ gTruth
positiveInstances = objectDetectorTrainingData(gTruth);

imDir = fullfile(idir, 'SignImage');
addpath(imDir);

negativeImages = fullfile('D:\HK241\Computer_Vision\HW3\HW3\NegativeImage');

cd(idir); % Đặt thư mục làm việc hiện tại là 'idir'
trainCascadeObjectDetector('sign.xml', positiveInstances, ...
negativeImages, 'FalseAlarmRate', 0.01, 'NumCascadeStages', 4);
