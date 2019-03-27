%%
close all
clear all
clc

k = 10;

[TRIV,A,boundary_xyz,boundary_idx] = create_grid_topology(k);

n = size(A,1);
boundary_n = length(boundary_idx);

L = speye(n) - spdiag(1./sum(A,2))*A;
H = sparse(1:boundary_n, boundary_idx, 1, boundary_n, n);
VERT_ls = [L; H] \ [zeros(n,3); boundary_xyz];

interactive_ls(VERT_ls, TRIV, L, H, boundary_xyz)
