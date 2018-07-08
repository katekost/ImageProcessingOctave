clear;

size = 256;
step = 20;

% vertical lines
vertstripe = zeros(size,size);
i = 1;
figure('vertstripe')
imshow(vertstripe)
figure()
ImageFourier(vertstripe)

 
while (i < size)
    vertstripe(:,i:(i+step)) = 1;
    i = i + 2*step;
end
 
% horizontal lines
horizstripe = zeros(size,size);
i = 1;
while (i < size)
    horizstripe(i:(i+step), :) = 1;
    i = i + 2*step;
end
 
figure('horizstripe')
imshow(horizstripe)
figure()
ImageFourier(horizstripe) 
 
% squares
checkered = zeros(size,size);
randomArray = zeros(size, size);
i = 1;
row = 1;
while (i < size)
    j = mod(row, 2) * step + 1;
    while (j < size)
    checkered(i:(i+step), j:(j+step)) = 1;
    j = j + step;
    randomArray(i:(i+step), j:(j+step)) = rand;
    j = j + step;
    randomArray(i:(i+step), j:(j+step)) = rand;
    end
    i = i + step;
    row = row + 1;
end
 

figure()
ImageFourier(checkered) 

figure()
imshow(randomArray)
ImageFourier(randomArray)
 
 
% Diagonal lines
diagonalFF = zeros(size, size);
diagonalFF(255, 255) = size * size / 2 ;
diagonalFF(size / 2, size / 2) = size * size / 2 ;
ifftshift(diagonalFF);
diagonal = ifft2(diagonalFF);
diagonal = abs(diagonal);

figure()
imshow(diagonal)
figure()
ImageFourier(diagonal)

function ImageFourier(grayscaleImage)
 
figure;
subplot(1, 4, 1);
imshow(grayscaleImage); 
title('Halftone image');
 
% compute Fourier transform
F = fft2(grayscaleImage, 256, 256); 
F = fftshift(F);    % Center FFT 
F = abs(F);         % Get the magnitude
F = log(F + 1);     % Use log, for perceptual scaling, and +1 since log(0) is undefined
% F = mat2gray(F);    % Use mat2gray to scale the image between 0 and 1
 
subplot(1, 4, 2);
imshow(F,[ ]);  % Display the result
title('Result');
colormap(jet); 
colorbar;

figure()
imshow(F)
 
subplot(1, 4, [3, 4])
mesh(F);
endfunction

rgb = imread('animal.jpg');
gray   = rgb2gray(rgb);
ImageFourier(gray)
figure()
imshow(rgb)
