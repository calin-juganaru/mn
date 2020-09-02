% Jugănaru Călin, 314CA

	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	%	-> val1 și val2: capetele intervalului pentru funcția de apartenență.

function R = Algebraic(nume, d)
  
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
  
  R = zeros(N, 1);
  R(1 : N) = 1 / N;
   
  aux = ((1 - d) / N) * ones(N, 1);
  I = eye(N);
  
  R = GramSchmidt(I - d*M) * aux;

  % --------------------------------

  fclose(file);

endfunction
