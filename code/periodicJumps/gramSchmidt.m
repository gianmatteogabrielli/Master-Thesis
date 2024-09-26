function Q = gramSchmidt(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    for i = 1:n
        v = A(:, i);
        for j = 1:i-1
            v = v - (Q(:, j)' * A(:, i)) * Q(:, j);
        end
        Q(:, i) = v / norm(v);
    end
end
