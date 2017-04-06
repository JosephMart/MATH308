function [ ansMine ] = heightFunc( t,y,a )
% height function for problem 7

    if t <= a
        ansMine = [y(2); -32 +.005*32*(y(2)^2)/195];
    else
        ansMine = [y(2); -32+.6*32*(y(2)^2)/195];
    end
end

