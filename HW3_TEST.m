idir = 'D:\HK241\Computer_Vision\HW3\HW3';

detector = vision.CascadeObjectDetector('sign.xml');

dir_test = fullfile(idir, 'TestImage');

dir_save = fullfile(idir, 'ResultImage');

% Đọc tất cả các ảnh kiểm tra
image_test = imageDatastore(dir_test);
image_test_name = image_test.Files(:,1);

% Số lượng ảnh kiểm tra
nfiles = length(image_test_name);

for ii = 1:nfiles
    img = imread(string(image_test_name(ii,1)));
    
    % Phát hiện đối tượng
    bbox = step(detector, img);
    
    % Vẽ khung chữ nhật bao quanh
    detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'Sign');
    
    % Tạo tên file kết quả
    name = fullfile(dir_save, sprintf("test_%d.jpg", ii));
    
    % Lưu ảnh
    imwrite(detectedImg, name, "Quality", 100); 
end

disp('Processing completed. Check the result folder for output images.');