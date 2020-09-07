x= -2:0.002:1; %Intervalo Re()
y= -1:0.002:1; %Intervalo Im()
n = 2;
iter = 100; % Numero de iteracion para criterio de convergencia
%% Creacion de matriz de numeros complejos para el set
[X,Y] = meshgrid(x,y); 
A = X + 1j*Y; %la matriz A es la retícula de puntos que vamos a pintar
D = zeros(size(A));
%% variable de video
v = VideoWriter('set_Julia_con_c_diferentes.avi'); %creamos un objeto 'v' donde se almacenar�n las im�genes que conforman el video
v.FrameRate=5; %definimos la cantidad de im�genes por segundo que tendr� el video
open(v); %par iniciar a adicionar las imigenes en v

%% calculo del set, y grfica del videp
for c = -1.5:0.1:2.5 % variacion de c
    for i = 1:length(y)
        for j = 1:length(x)
            z0 = A(i,j); %numero complejo para realozar el calculo
            z = 0; %reiniciamos la variable
            k = 0; %reiniciamos la variable
            while abs(z) < 2 && k < iter
                z = z^n + z0 + c;
                k = k + 1; 
            end
            D(i,j) = length(y) - k; %el numero que guarda es un color dontro de la matriz
        end
    end
    %% Grafica de la matriz D
    imagesc(D)
    title("Set de Julia con n = 2 y c = " + num2str(c))
    xlabel('Eje Real')
    ylabel('Eje Imaginario')
    xlim([0, 1500]); % fijamos los limites del eje x de la grafica
    ylim([0, 1000]); % fijamos los limites del eje y de la grafica
    F = getframe(gcf); % transformamos la imagen que se esta mostrando en un frame
    writeVideo(v,F); % adicionamos el frame a 'v'
end
close(v); % finalizamos el video
