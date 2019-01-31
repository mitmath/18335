function ortho_against!(v, a, q)
    r = q⋅a
    v .-= r*q
    return r
end

# GS in column direction (for clgs! and mgsc!)
function gsc!(A, R, modified)
    m, n = size(A)
    assert(size(R)==(n,n))

    R .= 0  # initialize R
    for j = 1:n
        vⱼ = @view A[:,j]  # no alloc
        aⱼ = modified ? vⱼ : copy(vⱼ)  # no alloc : alloc
        
        for i = 1:j-1
            R[i,j] = ortho_against!(vⱼ, aⱼ, @view(A[:,i]))
        end
        
        R[j,j] = norm(vⱼ)
        if R[j,j] == 0
            rand!(vⱼ)
            aⱼ = modified ? vⱼ : copy(vⱼ)  # no alloc : alloc
            for i = 1:j-1
                ortho_against!(vⱼ, aⱼ, @view(A[:,i]))
            end
            normalize!(vⱼ)
        else
            vⱼ ./= R[j,j]
        end
    end
    
    return nothing
end

# CLGS in-place
function clgs!(A, R)
    gsc!(A, R, false)
end


# MGSC in-place
function mgsc!(A, R)
    gsc!(A, R, true)
end

function house!(V, A)
    m, n = size(A)
    assert(size(V)==(m,n))

    V .= 0  # initialize

    for k = 1:n
        x = @view A[k:m, k]
        
        # Construct sign(x₁) for exp(iθ) = -sign(x₁).
        s = sign(x[1])
        if s == 0
            s = 1.0
        end

        # Construct the kth Houreholder reflection vector.
        v = @view V[k:m, k]
        copy!(v, x)
        lx = norm(x)
        slx = s * lx
        v[1] += slx
        
        # Perform the Householder reflection to triangularize the kth column of A.
        lv = norm(v)
        if lv ≠ 0
            v ./= lv
            
            # Take care of the kth column of A.
            A[k+1:m, k] .= 0
            A[k,k] = -slx
            
            # Take care of the remaining columns of A.
            if k < n
                A[k:m, k+1:n] .-= v .* (2(v'*@view(A[k:m, k+1:n])))
            end
        end
    end
    
    return nothing
end

function applyQhouse!(V, X, isconj=false)
    m, n = size(V)
    assert(size(X,1) == m)

    ks = isconj ? (1:n) : (n:-1:1)  # change application order depending on isconj

    for k = ks
        v = @view V[k:m, k]
        X[k:m,:] .-= v .* (2(v'@view(X[k:m,:])))
    end
    
    return nothing
end