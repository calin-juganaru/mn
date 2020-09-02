% Jugănaru Călin, 314CA

	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
function [R1 R2] = PageRank(nume, d, eps)
   
  out = strcat(nume, '.out');
  ofile = fopen(out, 'w');
  
  output_precision(6);
  
  % ------------ Iterative ------------

  [PR v1 v2] = Iterative(nume, d, eps);
  N = length(PR);
  
  fprintf(ofile, '%d\n', N);
  fprintf(ofile, '%.6f\n', PR);

  % -----------------------------------  

  % ------------ Algebraic ------------
  
  PR = Algebraic(nume, d, eps);
  
  fprintf(ofile, '\n%.6f', PR);

  % -----------------------------------
  
  % ------------ Clasament ------------

  PR1 = [PR, [1 : N]'];
  
  PR1 = sortrows(PR1, -1);
  
  fprintf(ofile, '\n');
  
  for i = 1 : N
    fprintf(ofile, '\n%d %d %.6f', i, PR1(i, 2), 
            Apartenenta(PR1(i, 1), v1, v2));
  endfor
  
  % -----------------------------------

  fclose(ofile);
  
endfunction