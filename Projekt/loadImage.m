function [im, baseFileName] = loadImage(theFiles, k)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    im = im2double(imread(fullFileName));