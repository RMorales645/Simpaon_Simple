%RONALD ALEXIS MORALES VARELA
%0901-23-6114

% Intervalo y número de subintervalos
a = 0;
b = 0.8;
n = 6; % número de subintervalos (debe ser par)
h = (b - a) / n;

% Función original
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Puntos x_i y evaluación f(x_i)
x = linspace(a, b, n+1);  % genera [x0, x1, ..., x6]
y = f(x);                 % vector de valores f(x_i)

% Simpson 1/3 múltiple
I_aprox = h/3 * ( y(1) + ...
                 4 * sum(y(2:2:end-1)) + ...
                 2 * sum(y(3:2:end-2)) + ...
                 y(end) );

% Cuarta derivada de f(x)
f4 = @(x) 12150 - 129600*x + 96000*x.^2;

% Media de la cuarta derivada
media_f4 = integral(f4, a, b) / (b - a);

% Estimación del error de truncamiento (Simpson 1/3 múltiple)
error_trunc = -((b - a)^5 / (180 * n^4)) * media_f4;

% Valor exacto conocido
I_real = 1.640533;

% Error relativo porcentual
error_rel = abs((I_real - I_aprox) / I_real) * 100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3 múltiple): %.6f\n', I_aprox);
fprintf('Media de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6f\n', error_trunc);
fprintf('Error relativo porcentual: %.4f%%\n', error_rel);
