% Jugănaru Călin, 314CA
  
  % Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Metoda va genera o pereche de matrici (Q, R), unde Q este ortogonală, iar R,
  %   superior triunghiulară. Inversa matricei Q este egală cu transpusa ei 
  %   (proprietate importantă a matricilor ortogonale), iar pentru R, putem
  %   calcula inversa determinând formulele pentru termenii diagonali și cei supra-diagonali.

function B = GramSchmidt(A)
  
	N = length(A);
	Q = A;
	R = zeros(N);
	
  for j = 1 : N
		
    R(j, j) = norm(Q(:, j));
		Q(:, j) = Q(:, j) / R(j, j);
	  
    for i = j + 1 : N
		  R(j, i) = Q(:, j)' * Q(:, i);
		  Q(:, i) = Q(:, i) - Q(:, j) * R(j, i);
	  endfor
	
  endfor
  
  r = zeros(N);
  
  for i = 1 : N
    r(i, i) = 1 / R(i, i);
  endfor
  
  for i = N - 1 : -1 : 1
    for j = i + 1 : 1 : N
    
      sum = R(i, j) / R(j, j);
      for k = i + 1 : 1 : j - 1;
        sum += R(i, k) * r(k, j);
      endfor

      r(i, j) = -sum / R(i, i);
      
    endfor
  endfor
  
  B = r * Q';
  
endfunction
