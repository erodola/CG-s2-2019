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
VERT = [L; 100*H] \ [zeros(n,3); 100*boundary_xyz];

neighs = calc_onering(struct('VERT',VERT,'TRIV',TRIV));

is_bd = false(n,1);
is_bd(boundary_idx) = true;

weights = calc_mean_value_coords(VERT, neighs, is_bd);

interactive_mean(VERT, TRIV, neighs, is_bd)
