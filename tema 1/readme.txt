% Jugănaru Călin, 314CA

                            Tema 1 MN - PageRank

    Soluția problemei are trei părți principale: primele două sunt executarea 
și afișarea output-urilor algoritmilor Iterative și Algebraic, iar a treia, 
afișarea indicilor corespunzători paginilor și gradele acestaroa de apartentență, 
în ordine descrescătoare a PageRank-ului.
    
    Iterative: După ce este citită lista de adiacență din fișierul dat ca 
parametru, construim matricea de adiancență, cu precauția ca pe diagonala 
principala să fie numai 0, adică nicio pagină să nu trimită la ea însăși. Mai 
trebuie citite și cele două valori pentru funcția de apartentență, pe care le 
va returna funcția odată cu vectorul R. După citire, construim matricea M, și, 
cu ajutorul acesteia, vectorul R, folosind formulele date în enunț.

    A = matricea de adiacență
    M(i, j) = 1 / L(j), dacă A(j, i) == 1

    R(i, i) = 1 / N, i = 1 : N, N = dimensiunea matricei A
    R(t + 1) = d * M * R(t) + ((1 - d) / N) * 1,
        cât timp || R(t + 1) - R(t) || < epsilon

    Algebraic: Citirea datelor este identică cu cea de la Iterative, la fel și 
cea ce returnează, diferă numai partea de calcul a vectorului R: fiind o metodă 
directă și nu una iterativă, aici nu iterăm până obșinem o soluție suficient de 
bună, ci facem un singur calcul (mai complex), care va rezulta soluția dorită.
Astfel, 

    R(i, i) = 1 / N, i = 1 : N
    R = inv(I - d * M) * ((1 - d) / N) * 1

    Inversarea unei matrici folosind metoda clasică este foarte costisitoare, 
deci ne trebuie o metodă numerică pentru a calcula inversa mai eficient. O 
soluție ar fi ortogonalizarea cu ajutorul procedeului Gram-Schmidt optimizat, 
obținând o pereche de matrici (Q, R), cu proprietățile:

    Q = matrice ortogonală
    R = matrice superior triunghiulară
    A = Q * R, unde A este matricea dată

    Dacă A = Q * R  =>  inv(A) = inv(Q * R) = inv(R) * inv(Q)
    Q = ortogonală   =>  inv(Q) = Q' (foarte ușor de calculat)
    R = superior triunghiulară, notând r = inv(R)
       =>  r este tot o matrice superior triunghiulară
            și poate fi calculată ușor și eficient după formulele:

                r(i, i) = 1 / R(i, i), i = 1 : N
                r(i, j) = - x / R(i, i), unde 
                    x = R(i, j) / R(j, j) + sum( R(i, k) * r(k, j) ), 
                        k = i + 1 : j - 1 

    Deci inv(A) = r * Q'.

    PageRank: Aici vor fi îmbinați algoritmii descriși mai sus, plus funcția 
pentru gradul de apartentență. Făcând limitele laterale pentru intervalul [val1,
val2], ar trebui ca 
    
    ax + b să tindă la 0, când x --> val1,
        deci a --> 1 / (val2 - val1), 
    iar când x --> val2, ax + b  --> 1, 
        deci b --> val1 / (val1 - val2)

    Atâta timp cât val2 este strict mai mare ca val1, funcția este corect 
definită și continuă pe întreg intervalul [0, 1], deci luăm exact valorile 
limitelor laterale. În rest mai trebui doar afișate valorile de retur ale 
celor două funcții și clasamentul paginilor, adică valorile rezultate de la
algoritmul Algebraic sortate descrescător după PageRank, indicii corespunzători,
și gradele lor de apartentență calculate după PageRank-ul fiecăreia.