function s = loopsum(x)
    s = 0;
    for i = 1:length(x)
        s = single(s + x(i));
    end
    