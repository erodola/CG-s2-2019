%%
clear all
close all
clc

dataset = '../../../Workspace/data/tosca/';

%% Calcola Shape DNA per tutte le shape nel dataset

shapes = dir(sprintf('%s/*.off', dataset));

k = 20;

all_dna = Inf(length(shapes), k);

for i=1:length(shapes)
    
    fprintf('Shape %d/%d\n', i, length(shapes))
    
    try
        X = load_off(sprintf('%s/%s', dataset, shapes(i).name));
        [X.S, ~, X.M] = calc_LB_FEM(X); 
        [~, dna] = eigs(X.S, X.M, k, 'sm');
        all_dna(i,:) = sort(diag(dna));
    catch
        fprintf('Error with shape %s\n', shapes(i).name)
    end
    
end

%% Ranking per una query a caso

query_idx = randi(length(shapes));

Q = load_off(sprintf('%s/%s', dataset, shapes(query_idx).name));
query_dna = all_dna(query_idx,:);

dist = pdist2(query_dna, all_dna);
[dist_sorted, ranking] = sort(dist);

figure
subplot(2,5,1), plot_mesh(Q); shading interp; axis off; light; camlight head; lighting phong;
title('query')
for i=1:5
    X = load_off(sprintf('%s/%s', dataset, shapes(ranking(i+1)).name));
    subplot(2,5,5+i), plot_mesh(X); shading interp; axis off; light; camlight head; lighting phong;
	title(sprintf('%d',i))
end
