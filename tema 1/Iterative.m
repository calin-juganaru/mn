% Jugănaru Călin, 314CA

	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	%	-> val1 și val2: capetele intervalului pentru funcția de apartenență.

function [R val1 val2] = Iterative(nume, d, eps)

  file = fopen(nume, 'r');

  % ----------- citire ------------
  
  N = fscanf(file, '%d', 1);
  A = zeros(N);
  
  for i = 1 : N
    x = fscanf(file, '%d', 1);
    aux = fscanf(file, '%d', 1);
    for j = 1 : aux
      y = fscanf(file, '%d', 1);
      if y != x
        A(x, y) = 1;
      endif
    endfor   
  endfor
  
  val1 = fscanf(file, '%f', 1);
  val2 = fscanf(file, '%f', 1);
  
  % -------------------------------
  
  % ---------- calculare ----------

  L = sum(A');
  M = zeros(N);
  
  for i = 1 : N
    for j = 1 : N
      if A(j, i)
        M(i, j) = 1 / L(j);
      endif
    endfor        
  endfor
  
  R = R0 = zeros(N, 1);
  R(1 : N) = 1 / N;
  aux = ((1 - d) / N) * ones(N, 1);
  
  while norm(R - R0) >= eps
      R0 = R;
      R = d*M*R + aux;
  endwhile
  
  R = R0;
  
  % -------------------------------

  fclose(file);
  
endfunction
