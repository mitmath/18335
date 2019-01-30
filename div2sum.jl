function div2sum(x)
    n = length(x);
    if n < 2
        return loopsum(x);
    else
        n2 = div(n,2) # divide by 2, rounding down
        return div2sum(x[1:n2]) + div2sum(x[n2+1:end])
    end
end
