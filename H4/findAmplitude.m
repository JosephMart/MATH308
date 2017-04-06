function [ amp ] = findAmplitude( y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    i = 1;
    
    while y(i,2) > 0
        i = i + 1;
    end
    
    amp = y(i,1);


end

