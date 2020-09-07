%%codigo inspirado por http://radiorho.blogspot.com/2016/11/arte-fractal-coloreando-el-conjunto-de.html
x= -2:0.002:1; %Intervalo Re()
y= -1:0.002:1; %Intervalo Im()
iter = 100; % Numero de iteracion para criterio de convergencia
%% Creacion de matriz de numeros complejos para el set
[X,Y] = meshgrid(x,y); 
A = X + 1j*Y; %la matriz A es la retícula de puntos que vamos a pintar
D = zeros(size(A));
%% calculo del set
for i = 1:length(y)
    for j = 1:length(x)
        z0 = A(i,j); %numero complejo para realozar el calculo
        z = 0; %reiniciamos la variable
        k = 0; %reiniciamos la variable
        while abs(z) < 2 && k < iter
            z = z^2 + z0;
            k = k + 1; 
        end
        D(i,j) = length(y) - k; %el numero que guarda es un color dontro de la matriz
    end
end
%% Grafica de la matriz D
imagesc(D)
title("Set de Mandelbrot")
xlabel('Eje Real')
ylabel('Eje Imaginario')
xlim([0, 1500]); % fijamos los limites del eje x de la grafica
ylim([0, 1000]); % fijamos los limites del eje y de la grafica

%%codigo inspirado en http://radiorho.blogspot.com/2016/11/arte-fractal-coloreando-el-conjunto-de.html