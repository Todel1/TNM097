function imOut = reproduce(imIn, n) 
    
    [ySize, xSize, ~] = size(imIn);

    cutX = mod(xSize,n);
    cutY = mod(ySize,n);
    im = imIn(1:(ySize-cutY),1:(xSize-cutX),:);
    [ySize, xSize, ~] = size(im);

    current = zeros(n);
    block = n-1;

    %Dela upp imIn i mosaik
    for i=1:n:xSize
        for j=1:n:ySize
            current = im(i:min(ySize,i+block),j:min(xSize,j+block),:);
            
            
        end
    end
    
    
    
    % Beräkna mean för R,G,B kanal
    CIE = calcCIE(current);

end