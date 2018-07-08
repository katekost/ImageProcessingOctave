pwd()
pkg load image

rgb = imread("animal.jpg");
figure('Name', 'RGB');
imshow(rgb);
%%
[X,map] = rgb2ind(rgb);
figure('Name', 'Indexed');
imshow(X, map);
%%
figure('Name', 'Gray from rgb') 
gray   = rgb2gray(rgb);
imshow(gray);
%%
figure('Name', 'Gray from indexed'); 
ga = ind2gray(X, map);
imshow(ga);
%%
figure('Name', 'Binary from indexed') 
bw = im2bw(ga);
imshow(bw);

