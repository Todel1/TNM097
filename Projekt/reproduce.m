function imOut = reproduce(imIn, n, picSize, databaseCIES) 
    % Resize image to be multiple of nxn
    [ySize, xSize, ~] = size(imIn);
    cutX = mod(xSize, n);
    cutY = mod(ySize, n);
    im = imIn(1:(ySize - cutY), 1:(xSize - cutX), :);
    [ySize, xSize, ~] = size(im);

    % Load image database & info
    % load databaseImageCIEs.mat;
    [theFiles, nrOfImages] = loadImageFiles("database_rescaled");

    % Main loop
    r = size(1:n:ySize);
    c = size(1:n:xSize);
    filenames = strings(r(2)*c(2),1);
    counter = 0;

    for i = 1:n:ySize
        for j = 1:n:xSize
            % Get current image block & mean CIE colour
            current = im(i:min(ySize, i+n-1), j:min(xSize, j+n-1), :);
            currentCIE = calcCIE(current);

            % Find database CIE with shortest euclidean distance
            minDist = 10000000;
            for k = 1:nrOfImages
                if databaseCIES(k,:) == [0 0 0]
                    continue;
                end 
                curr = euclideanDist(currentCIE, databaseCIES(k,:));
                if curr < minDist
                    minDist = curr; 
                    ind = k;  % Image nr k should replace block
                end
            end

            % Replace block with image from database
            filename = sprintf('%d.jpg', ind);
            imagePath = fullfile(theFiles(ind).folder, filename);
            counter = counter + 1;
            filenames(counter) = imagePath;
            %imshow(imOut(i:(i+n-1), j:(j+n-1), :))

        end
    end

    % Reproduction 
    q = picSize / n;
    imOut = zeros(ySize*q, xSize*q, 3, 'uint8');
    counter = 0;

    for i = 1:picSize:ySize*q
        for j = 1:picSize:xSize*q
            counter = counter + 1;
            replace = imread(filenames(counter));
            replace = imresize(replace, [picSize, picSize]); 
            imOut(i:(i+picSize-1), j:(j+picSize-1), :) = replace;
        end
    end
    
end