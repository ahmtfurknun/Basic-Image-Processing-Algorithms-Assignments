img = imread('input/AlfredoBorba_TuscanLandscape.jpg');
imshow(img)

isColor = size(img, 3) == 3;

if isColor
    gray_img = rgb2gray(img);
end

imshow(gray_img)
imwrite(gray_img, 'output/AlfredoBorba_TuscanLandscape_GRAY.jpg')


