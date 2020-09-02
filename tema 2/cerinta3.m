function [A, S] = cerinta3(image, k)

  A = double(imread(image));
  [n, m] = size(A);
  
  med = zeros(n, 1);
  
  for j = 1 : n
    med(j) = sum(A(j, :)) / m;
  endfor
  
  for i = 1 : n
    for j = 1 : m
      A(i, j) -= med(i);
    endfor
  endfor
  
  Z = A' / sqrt(n - 1);
  [U, S, V] = svd(Z);
  Z = U * S * V';
  
  W = V(:, 1 : k);
  Y = W' * A;
  
  A = W * Y + med;
  
endfunction