function formQhouse!(V, Q)
    m, n = size(V)
    assert(size(Q) == (m,m))

    for k = n:-1:1
        v = @view V[k:m,k]
        Q[k:m,k:m] .-= v .* (2(v'@view(Q[k:m,k:m])))
    end

    return nothing
end

function vander(x, n)
    m = length(x)
    V = similar(x, m, n)

    V[:,1] = 1
    for j = 2:n
        V[:,j] .= x .* @view(V[:,j-1])
    end

    return V
end

function ortho_against!(v, a, q)
    r = q⋅a
    v .-= r*q
    return r
end

function mgs!(A, R)
    m, n = size(A)
    assert(size(R)==(n,n))

    R .= 0  # initialize R
    for i = 1:n
        q = @view A[:,i]  # no alloc

        R[i,i] = norm(q)
        if R[i,i] == 0
            rand!(q)
            for j = 1:i-1
                ortho_against!(q, q, @view(A[:,j]))
            end
            normalize!(q)
        else
            q ./= R[i,i]
        end

        for j = i+1:n
            v = @view A[:,j]
            R[i,j] = ortho_against!(v, v, q)
        end
    end

    return nothing
end

function mgs(A)
    m, n = size(A)
    Q = copy(A)
    R = similar(A, (n,n))
    mgs!(Q, R)
    return (Q, R)
end
