function [A_k, S] = cerinta1(image, k)

  A = double(imread(image));
  
  [U, S, V] = svd(A);
  
  U = U(:, 1 : k);
  S = S(1 : k, 1 : k);
  V = V(:, 1 : k);
  
  A_k = U * S * V';
    
endfunction