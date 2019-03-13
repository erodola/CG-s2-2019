%%
clear all
close all
clc

M = load_off('../../02_repr/code/cat0.off');
M.normals = calc_normals(M);
M.tri_areas = calc_areas(M);

f = M.VERT(:,2);

figure
for i=0:0.01:1
    h = trisurf(...
        M.TRIV,...
        M.VERT(:,1),M.VERT(:,2),M.VERT(:,3),...
        f);
    h.EdgeColor = [1 0 0];
    axis equal
    axis off
    rotate3d on
    shading interp
    light
    camlight head
    lighting gouraud
    set(h, 'AmbientStrength', i)
    drawnow
end

%%

colors = hot(500);
colors = colors(end:-1:1,:);
colormap(colors)

n = 100;
r = ones(n,1);
g = linspace(1, 0, n)';
b = g;
whitered = [r, g, b];
colormap(whitered)
