function [ dy] = problem06( t, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dy = (t - exp(-t))/(y + exp(y));

end
