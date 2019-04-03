%%
clear all
close all
clc

X = load_ply('./bunny/bun000.ply');
Y = load_ply('./bunny/bun045.ply');

Y.fps = fps_euclidean(Y.VERT, 500, 1);

colors = [1 0 0; 0 0 1];
figure, colormap(colors)

errs = [];

for iter=1:20
    
    clf;
    plot_scalar_map(X, ones(X.n,1)); shading interp; light
    hold on
    plot_scalar_map(Y, 2*ones(Y.n,1)); shading interp; light
%     plot_cloud(Y, Y.fps, 'w.')
    drawnow
    
    [idx, dist] = knnsearch(X.VERT, Y.VERT(Y.fps,:));
    
    err = sum(dist);
    fprintf('%.4f\n', err)
    
    errs = [errs err];
    
    % costruisco i due insiemi di punti
    rl = X.VERT(idx,:);
    rr = Y.VERT(Y.fps,:);
    
    % calcolo i centroidi
    cl = mean(rl);
    cr = mean(rr);
    
    % passo a coordinate baricentriche
    rl_ = rl - cl;
    rr_ = rr - cr;
    
    % calcolo la rotazione
    M = rr_'*rl_;
%     U = M*(M'*M)^(-0.5);
    [u,s,v] = svd(M);
    R = u*v';
    
    % calcolo la traslazione
%     t = (cr' - R*cl')';
    t = cr - cl*R';
    
    % applico la roto-traslazione
    X.VERT = (R*X.VERT' + t')';
    
end

figure, plot(errs)
