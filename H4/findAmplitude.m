function [ amp ] = findAmplitude( y )
% findAmplitude

    i = 1;
    
    while y(i,2) > 0
        i = i + 1;
    end
    
    amp = y(i,1);


end

