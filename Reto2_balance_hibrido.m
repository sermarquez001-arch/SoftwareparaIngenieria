% RETO 2 - MODELADO DEL BALANCE HIBRIDO
% Curso: Software para ingenieria
% Codigo: 203036
% Modelo energetico de una micro-red durante 24 horas

% ---------------------------------------------------------
% 1. DEFINICION DEL TIEMPO
% ---------------------------------------------------------

% Vector fila que representa las 24 horas del dia
horas = 1:24;


% ---------------------------------------------------------
% 2. GENERACION SOLAR
% ---------------------------------------------------------

% Vector fila con la potencia solar generada en cada hora.
% La produccion es cero durante la noche.
% El valor maximo es de 25 kW en la hora 12.
solar = [0 0 0 0 0 5 8 12 16 20 23 25 ...
    23 20 16 12 8 5 0 0 0 0 0 0];


% ---------------------------------------------------------
% 3. GENERACION EOLICA
% ---------------------------------------------------------

% Vector fila con la potencia generada por los
% aerogeneradores durante las 24 horas.
% Los valores fluctuan de forma irregular y no superan
% la potencia maxima de diseño de 15 kW.
eolica = [8 10 7 12 9 6 11 13 8 10 14 12 ...
    9 15 11 7 10 13 8 12 14 9 6 11];


% ---------------------------------------------------------
% 4. GENERACION HIBRIDA TOTAL
% ---------------------------------------------------------

% Se suman elemento a elemento las generaciones solar
% y eolica para obtener la generacion total.
generacion_total = solar + eolica;


% ---------------------------------------------------------
% 5. DEMANDA DE LA COMUNIDAD
% ---------------------------------------------------------

% Vector fila que representa el consumo electrico de la
% comunidad durante las 24 horas.
% Horas 1-5 y 22-24: consumo nocturno de 2 a 4 kW.
% Horas 6-17: consumo diurno de 6 a 10 kW.
% Horas 18-21: demanda maxima de 15 kW.
demanda = [3 3 2 4 3 6 7 8 9 8 9 10 ...
    9 8 9 10 8 15 15 15 15 4 3 3];


% ---------------------------------------------------------
% 6. CALCULO DEL BALANCE ENERGETICO
% ---------------------------------------------------------

% El balance se obtiene restando la demanda a la
% generacion hibrida total.
% Un valor positivo representa superavit energetico.
% Un valor negativo representa deficit energetico.
balance = generacion_total - demanda;


% ---------------------------------------------------------
% 7. VISUALIZACION DEL BALANCE ENERGETICO
% ---------------------------------------------------------

% Se representan en una misma grafica la generacion total
% y la demanda de la comunidad.
plot(horas, generacion_total, 'b', horas, demanda, 'r');

% Titulo de la grafica.
title('Balance energetico de la micro-red');

% Etiqueta del eje X.
xlabel('Tiempo en horas');

% Etiqueta del eje Y.
ylabel('Potencia en Kilovatios');

% Activa la cuadricula para facilitar la lectura.
grid on;

% Agrega una leyenda para identificar cada curva.
legend('Generacion Total', 'Demanda');