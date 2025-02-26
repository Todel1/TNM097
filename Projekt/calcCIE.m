function CIE = calcCIE(im)

    R = mean(im(:,:,1), "all") / 256;
    G = mean(im(:,:,2), "all") / 256;
    B = mean(im(:,:,3), "all") / 256;

    CIE = rgb2lab([R G B]);
end