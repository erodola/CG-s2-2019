% Autore: Arianna Rampini

clc 
clear all
close all

Im = imread('lena.png');
n = size(Im, 1);

Red = Im(:, :, 1);
vecRed = double(Red(:));
Green = Im(:, :, 2);
vecGreen = double(Green(:));
Blue = Im(:, :, 3);
vecBlue = double(Blue(:));

%%

% ESERCIZIO LEZIONE 6/03

L = 32;

Base = spalloc(n^2, (n/L)^2, n^2);
for i=1:n/L
    for j =1:n/L
        ind_x = (i-1)*L;
        ind_y = (j-1)*L;
        singleElement = sparse(repmat(1:L, L, 1)+ind_x, repmat(1:L, L, 1)'+ind_y, ...
            ones(L, L), n, n);
        Base = Base + sparse(1:n^2, (i+(j-1)*(n/L))*ones(1, n^2), ...
            singleElement(:), n^2, (n/L)^2);
    end
end

coeff = Base \ vecRed;
vecRed_new = Base * coeff;
coeff = Base \ vecGreen;
vecGreen_new = Base * coeff;
coeff = Base \ vecBlue;
vecBlue_new = Base * coeff;

Im_new = uint8(cat(3, reshape(vecRed_new, n, n), ...
    reshape(vecGreen_new, n, n), ...
    reshape(vecBlue_new, n, n)));

figure,
subplot(1, 2, 1), imagesc(Im), axis equal, xlim([1 n]), ylim([1 n])
subplot(1, 2, 2), imagesc(Im_new), axis equal, xlim([1 n]), ylim([1 n])


%%

% un esempio di cambio di base (nello spazio vettoriale di dimensione 3*n^2)

N = 3 * n^2;
coeff_original = cat(1, vecRed, vecGreen, vecBlue);
Base_original = sparse(1:N, 1:N, ones(1, N), N, N);

r = 1:n^2;
g = n^2+1:2*n^2;
b = 2*n^2+1:N;

% una possibile nuova base, ottenuta componendo i vettori della base di partenza:
Base_new = cat(2, (1/sqrt(2))*(Base_original(:,r) + Base_original(:,g)),...
                  (1/sqrt(2))*(Base_original(:,g) + Base_original(:,b)),...    
                  (1/sqrt(2))*(Base_original(:,b) + Base_original(:,r)));

% se uso il "vector matrix" precedente con la nuova base ottengo una immagine diversa 
vec_new = Base_new * coeff_original;

vecRed_new = vec_new(r);
vecGreen_new = vec_new(g);
vecBlue_new = vec_new(b);

Im_new = uint8(cat(3, reshape(vecRed_new, n, n), ...
    reshape(vecGreen_new, n, n), ...
    reshape(vecBlue_new, n, n)));

figure,
subplot(1, 3, 1), imagesc(Im), axis equal, xlim([1 n]), ylim([1 n])
subplot(1, 3, 2), imagesc(Im_new), axis equal, xlim([1 n]), ylim([1 n])

% nella nuova base il "vector matrix" corretto è dato da:
coeff_new = Base_new \ coeff_original;
vec_new = Base_new * coeff_new;

vecRed_new = vec_new(r);
vecGreen_new = vec_new(g);
vecBlue_new = vec_new(b);

Im_new = uint8(cat(3, reshape(vecRed_new, n, n), ...
    reshape(vecGreen_new, n, n), ...
    reshape(vecBlue_new, n, n)));

subplot(1, 3, 3), imagesc(Im_new), axis equal, xlim([1 n]), ylim([1 n])

%%

% due esempi di mappe lineari

% mappa che genera rumore:
w = 0.6;
shift = 0.7;
random_map = sparse(1:n^2, 1:n^2, w*rand(n^2,1) + shift, n^2, n^2);

vecRed_new = random_map * vecRed;
vecGreen_new = random_map * vecGreen;
vecBlue_new = random_map * vecBlue;

Im_new = uint8(cat(3, reshape(vecRed_new, n, n), ...
    reshape(vecGreen_new, n, n), ...
    reshape(vecBlue_new, n, n)));

figure,
subplot(1, 3, 1), imagesc(Im_new), axis equal, xlim([1 n]), ylim([1 n])

% mappa che esegue uno shift (con condizioni al bordo periodiche):
shift_map_up = sparse(mod((1:n^2)+30, n^2)+1, 1:n^2, ones(n^2, 1), n^2, n^2);
shift_map_down = sparse(mod((1:n^2)-30, n^2)+1, 1:n^2, ones(n^2, 1), n^2, n^2);

vecRed_new = shift_map_up * vecRed;
vecGreen_new = vecGreen;
vecBlue_new = shift_map_down * vecBlue;

Im_new = uint8(cat(3, reshape(vecRed_new, n, n), ...
    reshape(vecGreen_new, n, n), ...
    reshape(vecBlue_new, n, n)));

subplot(1, 3, 2), imagesc(Im_new), axis equal, xlim([1 n]), ylim([1 n])

% composizione delle due mappe (Q: commutano?)
vecRed_new = random_map * shift_map_up * vecRed;
vecGreen_new = random_map * vecGreen;
vecBlue_new = random_map * shift_map_down * vecBlue;

Im_new = uint8(cat(3, reshape(vecRed_new, n, n), ...
    reshape(vecGreen_new, n, n), ...
    reshape(vecBlue_new, n, n)));

subplot(1, 3, 3), imagesc(Im_new), axis equal, xlim([1 n]), ylim([1 n])
