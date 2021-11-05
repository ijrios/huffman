symbols = 1:7; %numero de los simbolos
p = [0.39 0.20 0.15 0.14 0.08 0.03 0.01]; %creamos el vector de probabilidades
dict = huffmandict(symbols, p);
sig = randsrc (20,1,[symbols;p]); %creamos un vector aleatorio con las probabilidades ingresadas segun el numero de los simbolos
comp = huffmanenco(sig,dict); %Codificamos el vector aleatorio 
dsig = huffmandeco(comp, dict); %Decodificamos el vector aleatorio
isequal(sig,dsig) % comparamos que el mensaje codificado sea igual al codificado, si da "1" esta bien.
%disp(dict);
%disp(sig);

%CALCULAMOS LA ENTROPIA
x = [0.39 0.20 0.15 0.14 0.08 0.03 0.01]; %vector de probabilidades
h = 0;
%n = input("Favor ingresar el numero de probabilidades");
for i = 1:length(x)
    h = h + (x(i)*log2(1/x(i)));
end
disp ("la Entropia es H = " +h)
    
%CALCULAMOS LA LONGITUD PROMEDIO
l = 0;
for i = 1:length(x)
   l = l + length(dict{i,2}) * x(i);
end
disp ("la Longitud promedio es L = " +l)

%CALCULAMOS LA EFICIENCIA
n = h/l;
disp ("la Eficiencia es n = " +n)



    
