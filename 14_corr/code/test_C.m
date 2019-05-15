%%
clear all
close all
clc

X = load_ply('../../../Workspace/data/faust/tr_reg_000.ply');
Y = load_ply('../../../Workspace/data/faust/tr_reg_001.ply');

P = speye(X.n);

colors = (Y.VERT - min(Y.VERT))./(range(Y.VERT));

figure
subplot(121), colormap(P*colors), plot_scalar_map(X, 1:X.n)
shading flat; freeze_colors
subplot(122), colormap(colors), plot_scalar_map(Y, 1:Y.n)
shading flat

%% Calcolo le autofunzioni di X e Y

[X.S,~,X.M] = calc_LB_FEM(X);
[X.phi, ~] = eigs(X.S, X.M, 20, 'sm');

[Y.S,~,Y.M] = calc_LB_FEM(Y);
[Y.phi, ~] = eigs(Y.S, Y.M, 20, 'sm');

%% Visualizzo un'autofunzione di X mappata su Y

figure, colormap(bluewhitered)
subplot(131), plot_scalar_map(X, X.phi(:,10)); axis off; view([0 90])
subplot(132), plot_scalar_map(Y, Y.phi(:,10)); axis off; view([0 90])
subplot(133), plot_scalar_map(Y, P*X.phi(:,10)); axis off; view([0 90])

%% Calcolo C e la visualizzo

C = Y.phi'*Y.M*(P*X.phi);

figure, colormap(bluewhitered)
imagesc(C),axis image,colorbar

%% Trasporto una funzione indicatrice usando C

f = zeros(X.n,1);
f(randi(X.n)) = 1;

g = Y.phi*C*(X.phi'*X.M*f);

figure
subplot(121), plot_scalar_map(X, f)
subplot(122), plot_scalar_map(Y, g)

%% Risolvo per C usando funzioni indicatrici come descrittori

fps = fps_euclidean(X.VERT, 50, 1);

F = sparse(fps, 1:50, 1, X.n, 50);
G = P*F;

A = X.phi'*X.M*F;
B = Y.phi'*Y.M*G;

% A*x = b in matlab x = A\b
C_risolta = (A'\B')';

figure, colormap(bluewhitered)
imagesc(C_risolta), axis image, colorbar

f = zeros(X.n,1);
f(randi(X.n)) = 1;

g = Y.phi*C_risolta*(X.phi'*X.M*f);

figure
subplot(121), plot_scalar_map(X, f)
subplot(122), plot_scalar_map(Y, g)
