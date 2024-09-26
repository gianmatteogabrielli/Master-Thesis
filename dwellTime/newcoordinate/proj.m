function W = proj(V, n, q)

    M = [zeros(q, n), eye(q)];
    product = M*V;
    keyboard;
    W = subspaceImage(product);

    

end
