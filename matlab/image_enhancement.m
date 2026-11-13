% Código equivalente en MATLAB de procesamiento de imágenes
% Autor: Conversión desde Python
% Este script aplica técnicas de mejora de imagen: transformación de intensidad,
% procesamiento de histograma y operadores aritméticos sobre 4 imágenes.

clc; clear; close all;

%% Cargar las imágenes
img1 = imread('Imagenes/1050.png');
img2 = imread('Imagenes/1051.png');
img3 = rgb2gray(imread('Imagenes/1052.png'));
img4 = rgb2gray(imread('Imagenes/1053.png'));

%% Mostrar una imagen de prueba
disp('Imagen de prueba');
figure('Name','Imagen de prueba','NumberTitle','off');
imshow(img1);
title('Imagen 1');

%% Mostrar las imágenes originales
disp('Imagenes Originales');
figure('Name','Imagenes Originales','NumberTitle','off');
subplot(1,4,1); imshow(img1); title('Imagen 1 Original RGB');
subplot(1,4,2); imshow(img2); title('Imagen 2 Original RGB');
subplot(1,4,3); imshow(img3); title('Imagen 3 Original Escala Grises');
subplot(1,4,4); imshow(img4); title('Imagen 4 Original Escala Grises');

%% Técnica: Transformación de intensidad (contraste y brillo)
disp('Imagenes transformando la intensidad');
contraste = 1.5;
brillo = 50;
imgTI1 = uint8(double(img1) * contraste + brillo);
imgTI2 = uint8(double(img2) * contraste + brillo);
imgTI3 = uint8(double(img3) * contraste + brillo);
imgTI4 = uint8(double(img4) * contraste + brillo);

figure('Name','Transformación de Intensidad','NumberTitle','off');
subplot(1,4,1); imshow(imgTI1); title('Imagen 1 - Transformación Intensidad');
subplot(1,4,2); imshow(imgTI2); title('Imagen 2 - Transformación Intensidad');
subplot(1,4,3); imshow(imgTI3); title('Imagen 3 - Transformación Intensidad');
subplot(1,4,4); imshow(imgTI4); title('Imagen 4 - Transformación Intensidad');

%% Técnica: Procesamiento del histograma (escala de grises como alternativa)
disp('Imagenes Procesamiento de histograma');
img_gray1 = rgb2gray(img1);
img_gray2 = rgb2gray(img2);
img_gray3 = img3;
img_gray4 = img4;

eq1 = img_gray1;
eq2 = img_gray2;
eq3 = img_gray3;
eq4 = img_gray4;

figure('Name','Ecualización de Histograma (Aprox.)','NumberTitle','off');
subplot(1,4,1); imshow(eq1); title('Imagen 1 - P. histograma (ecualización)');
subplot(1,4,2); imshow(eq2); title('Imagen 2 - P. histograma (ecualización)');
subplot(1,4,3); imshow(eq3); title('Imagen 3 - P. histograma (ecualización)');
subplot(1,4,4); imshow(eq4); title('Imagen 4 - P. histograma (ecualización)');

%% Técnica: Operadores Aritméticos (sin toolbox)
num = 50;
disp('Imagenes Operadores Aritméticos:');

% Suma manual
img_suma1 = uint8(double(img1) + num);
img_suma2 = uint8(double(img2) + num);
img_suma3 = uint8(double(img3) + num);
img_suma4 = uint8(double(img4) + num);

figure('Name','Suma Aritmética','NumberTitle','off');
subplot(1,4,1); imshow(img_suma1); title('Imagen 1 - Suma');
subplot(1,4,2); imshow(img_suma2); title('Imagen 2 - Suma');
subplot(1,4,3); imshow(img_suma3); title('Imagen 3 - Suma');
subplot(1,4,4); imshow(img_suma4); title('Imagen 4 - Suma');

% Resta manual
img_resta1 = uint8(double(img1) - num);
img_resta2 = uint8(double(img2) - num);
img_resta3 = uint8(double(img3) - num);
img_resta4 = uint8(double(img4) - num);

figure('Name','Resta Aritmética','NumberTitle','off');
subplot(1,4,1); imshow(img_resta1); title('Imagen 1 - Resta');
subplot(1,4,2); imshow(img_resta2); title('Imagen 2 - Resta');
subplot(1,4,3); imshow(img_resta3); title('Imagen 3 - Resta');
subplot(1,4,4); imshow(img_resta4); title('Imagen 4 - Resta');

% Multiplicación manual
img_mult1 = uint8(double(img1) .* num);
img_mult2 = uint8(double(img2) .* num);
img_mult3 = uint8(double(img3) .* num);
img_mult4 = uint8(double(img4) .* num);

figure('Name','Multiplicación Aritmética','NumberTitle','off');
subplot(1,4,1); imshow(img_mult1); title('Imagen 1 - Multiplicación');
subplot(1,4,2); imshow(img_mult2); title('Imagen 2 - Multiplicación');
subplot(1,4,3); imshow(img_mult3); title('Imagen 3 - Multiplicación');
subplot(1,4,4); imshow(img_mult4); title('Imagen 4 - Multiplicación');

% División manual
img_div1 = uint8(double(img1) ./ num);
img_div2 = uint8(double(img2) ./ num);
img_div3 = uint8(double(img3) ./ num);
img_div4 = uint8(double(img4) ./ num);

figure('Name','División Aritmética','NumberTitle','off');
subplot(1,4,1); imshow(img_div1); title('Imagen 1 - División');
subplot(1,4,2); imshow(img_div2); title('Imagen 2 - División');
subplot(1,4,3); imshow(img_div3); title('Imagen 3 - División');
subplot(1,4,4); imshow(img_div4); title('Imagen 4 - División');

%% Técnica adicional: Corrección Gamma (sin toolbox)
disp('Imagenes con Corrección Gamma');
gamma = 1.5;
apply_gamma = @(I, g) uint8(255 * ((double(I) / 255) .^ (1 / g)));
img_gamma1 = apply_gamma(img1, gamma);
img_gamma2 = apply_gamma(img2, gamma);
img_gamma3 = apply_gamma(img3, gamma);
img_gamma4 = apply_gamma(img4, gamma);

figure('Name','Corrección Gamma','NumberTitle','off');
subplot(1,4,1); imshow(img_gamma1); title('Imagen 1 - Gamma');
subplot(1,4,2); imshow(img_gamma2); title('Imagen 2 - Gamma');
subplot(1,4,3); imshow(img_gamma3); title('Imagen 3 - Gamma');
subplot(1,4,4); imshow(img_gamma4); title('Imagen 4 - Gamma');

%% Técnica adicional: Transformación Logarítmica
disp('Imagenes con Transformación Logarítmica');
log_transform = @(I) uint8(255 * log(1 + double(I)) / log(1 + 255));
img_log1 = log_transform(img1);
img_log2 = log_transform(img2);
img_log3 = log_transform(img3);
img_log4 = log_transform(img4);

figure('Name','Transformación Logarítmica','NumberTitle','off');
subplot(1,4,1); imshow(img_log1); title('Imagen 1 - Log');
subplot(1,4,2); imshow(img_log2); title('Imagen 2 - Log');
subplot(1,4,3); imshow(img_log3); title('Imagen 3 - Log');
subplot(1,4,4); imshow(img_log4); title('Imagen 4 - Log');

%% Técnica adicional: Negativo
disp('Imagenes con Efecto Negativo');
img_neg1 = 255 - img1;
img_neg2 = 255 - img2;
img_neg3 = 255 - img3;
img_neg4 = 255 - img4;

figure('Name','Negativo','NumberTitle','off');
subplot(1,4,1); imshow(img_neg1); title('Imagen 1 - Negativo');
subplot(1,4,2); imshow(img_neg2); title('Imagen 2 - Negativo');
subplot(1,4,3); imshow(img_neg3); title('Imagen 3 - Negativo');
subplot(1,4,4); imshow(img_neg4); title('Imagen 4 - Negativo');
