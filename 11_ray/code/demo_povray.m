%%
clear all
close all
clc

M = load_off('c:/users/rodola/workspace/data/tosca/cat2.off');

M.VERT = M.VERT - mean(M.VERT);

f = M.VERT(:,1);
f = mean(f(M.TRIV), 2);

colors = jet(300);

idx = floor(299*(f-min(f))./range(f)) + 1;

save_mesh_povray(...
    './cat.mesh',...
    M,...
    colors(idx,:));

