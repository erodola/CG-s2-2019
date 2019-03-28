%%
close all
clear all
clc

M = load_off('c:/users/rodola/workspace/data/tosca/dog5.off');
M = remesh(M, struct('vertices',5e3));

A = sparse(...
    [M.TRIV(:,1) ; M.TRIV(:,2) ; M.TRIV(:,3)],...
    [M.TRIV(:,2) ; M.TRIV(:,3) ; M.TRIV(:,1)],...
    1,...
    M.n,...
    M.n);
L = speye(M.n) - spdiag(1./sum(A,2))*A; % Laplaciano

figure
for a=0:0.01:2
    M.VERT = M.VERT - a*L*M.VERT; % Laplacian smoothing
    plot_mesh(M); shading interp
    light; lighting phong; camlight head; axis off
    drawnow
end
