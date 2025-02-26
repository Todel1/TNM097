function imOut = reproduce(imIn) 
    
    % Dela upp imIn i mosaik
    current = imIn; 
    
    % Beräkna mean för R,G,B kanal
    CIE = calcCIE(current)

end