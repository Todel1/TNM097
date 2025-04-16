function [theFiles, nrOfImages] = loadImageFiles(foldername)

theFiles = dir(fullfile("C:\Users\gayat\Documents\TNM097\Projekt\" + foldername, '*.jpg'));
nrOfImages = length(theFiles);