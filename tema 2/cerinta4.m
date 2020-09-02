function [A, S] = cerinta4(image, k)

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
  
  Z = A * (A' / (n - 1));
  [V, S] = eig(Z);
  
  W = V(:, 1 : k);
  Y = W' * A;
  
  A = W * Y + med;
  
endfunction