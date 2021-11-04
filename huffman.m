%% codificación huffman
mensajes=1:6;
prob=[0.25 0.28 0.10 0.02 0.14 0.21];
dict=huffmandict(mensajes,prob);
mensajesAleatorios=randsrc(20,1,[mensajes;prob]);
mensajesAleatoriosCod=huffmanenco(mensajesAleatorios,dict);
mensajesAleatoriosDeco=huffmandeco(mensajesAleatoriosCod,dict);
isequal(mensajesAleatorios,mensajesAleatoriosDeco)

%Longtud Promedio del código
L=0;
for c = 1:6
    cantidadBits=length(dict{c,2});
    aux=cantidadBits*prob(c);
    L = L+aux;
end
disp(L)

%Cantidad de información
I=[];
for c = 1:6
    I(c)=log2(1/prob(c));
end
disp(I)

%Entropía
H=0;
for c = 1:6
    aux = prob(c)*I(c);
    H = H+aux;
end
disp(H);

%Rendimiento
Z = H/L;
disp(Z)

%Reduncia
R = 1-Z;
disp(R)

%shannon
if L >= H
    disp("se cumple el teorema de Shannon")
end

    
