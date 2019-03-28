%%
close all
clear all
clc

M = load_off('c:/users/rodola/workspace/data/tosca/dog5.off');

figure, colormap(bluewhitered)

subplot(131)
f = M.VERT(:,1);
plot_scalar_map(M, f); axis off
t = max(abs(min(f)),abs(max(f)));
caxis([-t t])

subplot(132)
f = M.VERT(:,2);
plot_scalar_map(M, f); axis off
t = max(abs(min(f)),abs(max(f)));
caxis([-t t])

subplot(133)
f = M.VERT(:,3);
plot_scalar_map(M, f); axis off
t = max(abs(min(f)),abs(max(f)));
caxis([-t t])

%%

colors = (M.VERT - min(M.VERT)) ./ range(M.VERT);

figure
colormap(colors)
plot_scalar_map(M, 1:M.n);
shading flat
colorbar
