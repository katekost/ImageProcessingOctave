function hash_value = hash(image_name)
    RGB = imread(image_name,'JPG');
    RGBsmall = imresize(RGB,[8 8]);
    GRAY = rgb2gray(RGBsmall);
    SRED = mean2(GRAY);

    figure('Tag','Contrast');
    
    subplot(2,2,1);
    imshow(rgb2gray(RGB))
    title('Initial')
    
    subplot(2,2,3);
    imshow(RGBsmall)
    title('Reduced')
    
    subplot(2,2,[2 4]);
    imshow(GRAY)
    title('Grayscale')

    HASH(:,:)=0;

    for m = 1:8
        for n = 1:8
            if (GRAY(m,n) >= SRED) 
                HASH(m,n) = 1;
            else
                HASH(m,n) = 0;   
            end
        end
    end

    S=[HASH(1,:),HASH(2,:),HASH(3,:),HASH(4,:),HASH(5,:),HASH(6,:),HASH(7,:),HASH(8,:)];

    % To hex
    %H(:)=0;
    i=4;
    k=0;
    Dec=0;
    for m = 1:16
        for n = (k+1):(k+4)
            Dec = S(n)*i+Dec;
            i = i-1;
        end
        k = k+4;
        i = 4;
        hash_value(m) = Dec;
        Dec = 0;
    end

    disp(hash_value)
end

hash1 = hash('animal.jpg');
hash2 = hash('animal(gray).jpg');
 
step=0;
for j = 1:16
    if (hash1(j) ~= hash2(j))
       step = step+1; 
    end
end
 
disp('hemming distance: ')
disp(step)
