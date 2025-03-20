function CIE = calcCIE(im)

    R = mean(im(:,:,1), "all");
    G = mean(im(:,:,2), "all");
    B = mean(im(:,:,3), "all");

    CIE = rgb2lab([R G B]);
end