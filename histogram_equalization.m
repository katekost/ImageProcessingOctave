inFileName = 'animal.jpg';
info = imfinfo(inFileName);
%im = imread(inFileName)
 
pkg load image 
if strcmp(info.ColorType, 'truecolor')
    imgData = imread(inFileName);
    grayData = rgb2gray(imgData);
    [pathstr, name, ~] = fileparts(inFileName);
    outFileName = strcat(pathstr, name, '(gray)', '.jpg');
    imwrite(grayData, outFileName,'jpg');
else
    error('invalid image.')
end

function equalizeImage(imageName)
 
    imgData = imread(strcat(imageName, '.jpg'));
 
    figure;
    subplot(1, 6, 1);
    imshow(imgData)
    title('Before')
 
    subplot(1, 6, [ 2, 3 ]);
    imhist(imgData)
    title('Hist before')
 
    resultData = histeq(imgData, 256);
 
    subplot(1, 6, 4);
    imshow(resultData)
    title('After')
 
    subplot(1, 6, [ 5, 6 ]);
    imhist(resultData)
    title('Hist after')
    imwrite(resultData, strcat(imageName, '(new).jpg'),'jpg');
 
end

equalizeImage('animal(gray)');
equalizeImage('parrot(gray)');