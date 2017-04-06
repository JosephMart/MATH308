function [ p ] = findPeriod( x, y, t)
%findPeriod finds the period of the input values by finding where y crosses
%   the y axis, then averaging the next and previous x coordinate value
%   then multiplies that by 4
    i = 2;
    
    while y(i) > 0
       i = i + 1; 
    end
    
    if t == 11
        p = (x(i-1) + x(i));
    else
        p = (x(i-1) + x(i)) * 2;
    end


end
