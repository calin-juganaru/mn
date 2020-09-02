% Jugănaru Călin, 314CA

  % Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

function y = Apartenenta(x, val1, val2)
	
  if x < val1
    y = 0;
  elseif x > val2
    y = 1;
  else 
    y = x / (val2 - val1) + val1 / (val1 - val2);  
  endif
  
endfunction