function img = GenRandomImage(width, height, pixel_width)
    % Gen random color image
    if (nargin < 3) pixel_width = 1;
    r = randi(255, height, width);
    g = randi(255, height, width);
    b = randi(255, height, width);
    
    img = zeros(height, width, 3, 'uint8');
    img(:, :, 1) = r;
    img(:, :, 2) = g;
    img(:, :, 3) = b;
    
    imshow(img, []);
    imwrite(img, 'img.jpg');
end