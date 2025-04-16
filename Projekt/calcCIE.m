function CIE = calcCIE(im)

    imCIE = rgb2lab(im);

    C = mean(imCIE(:,:,1), "all");
    I = mean(imCIE(:,:,2), "all");
    E = mean(imCIE(:,:,3), "all");

    CIE = [C I E];
end