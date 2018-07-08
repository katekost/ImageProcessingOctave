rgb = imread('animal.jpg');
I = rgb2gray(rgb);
imshow(I)
%%
methods = {'gaussian','sobel','prewitt','laplacian','average'};

for i=1:length(methods)
  subplot(2,4,i)
  sprintf('%s\n', methods{i});
  
  H = fspecial(methods{i});
  filtered = imfilter(I,H,'replicate');
  
  imshow(filtered)
  title(methods{i})
end
 
Ja = imnoise(I,'salt & pepper',0.03);
Ka = medfilt2(Ja);

subplot(2,4,6);
imshow(Ja);
title('Noise')
 
subplot(2,4,7);
imshow(Ka);
title('Median Filter')
 
J = imnoise(I,'gaussian',0,0.125);
K = wiener2(J,[5 5]);

subplot(2,4,8);
imshow(K);
title('wiener2')
