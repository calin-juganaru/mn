function cerinta2_aux(path)

  A = double(imread(path));
  [N, M] = size(A);
  MAX = min(N, M);
  
  [A_k, S] = cerinta1(path, MAX);
  [n, m] = size(S);
    
   for i = 1 : MAX
     y(i) = S(i, i);
   endfor
   y = sort(y, 'descend');

   subplot(2, 2, 1);
   plot(y);
   title('2.1');
   ylabel('valorile singulare');
   
   % ----------------------------
  
  aux = 0;
  
  for i = 1 : min(n, m)
      aux += S(i, i);
  endfor

  for k = 10 : 10 : MAX
    info(k / 10) = 0;
    for i = 1 : k
      info(k / 10) += S(i, i);
    endfor
    
    info(k / 10) /= aux;  
  endfor    
  
  k = 10 : 10 : MAX;
  subplot(2, 2, 2);
  plot(k, info);
  title('2.2');
  ylabel('informatia');
  
  % ----------------------------
  
  for k = 10 : 10 : MAX
    [A_k, S] = cerinta1(path, k);
  
    err(k / 10) = 0;
    for i = 1 : N
      for j = 1 : M
        aux = A(i, j) - A_k(i, j);
        aux *= aux;
        err(k / 10) += aux;
      endfor
      err(k / 10) /= (N * M);
    endfor  
    
    c_rate(k / 10) = k * (N + M + 1) / (N * M);
  endfor
  
  k = 10 : 10 : MAX;
  subplot(2, 2, 3);
  plot(k, err);
  title('2.3');
  ylabel('eroarea aproximarii');
  
  subplot(2, 2, 4);
  plot(k, c_rate);
  title('2.4');
  ylabel('rata de compresie');
  
endfunction