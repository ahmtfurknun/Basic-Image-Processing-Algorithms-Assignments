IMG = imread('input/AlfredoBorba_TuscanLandscape.jpg');
IMG = rgb2gray(IMG);
row = 150;

subplot(2,1,1);
imshow(IMG());
hold on;
plot([1, size(IMG, 2)], [row, row], 'r', 'LineWidth', 1);
hold off;

subplot(2,1,2);
plot(IMG(row, :), 'r');
ylabel('pixel intensity value');
xlabel('column index');
