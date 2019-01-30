function loopsum(x)
    s = 0.0f0;
    for i = 1:length(x)
        s += float32(x[i])
    end
    return s
end
