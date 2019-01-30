function s = div2sum(x)
    n = length(x);
    if (n < 2)
        s = sum(x);
    else
        s = single(div2sum(x(1:floor(n/2))) + div2sum(x(floor(n/2)+1:n)));
    end
    