function [ dy] = problem05( t, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dy = y.*(1-log(y)).*(y-3);

end

