function [TRIV,A,boundary_xyz,boundary_idx] = create_grid_topology(k)

TRIV = [];

% create the k-by-k grid
i = 1;
for c=1:(k-1)
    for r=1:(k-1)
        
        t1 = i;
        t2 = t1+1;
        t3 = t1+k;
        TRIV = [TRIV ; t1 t2 t3];
        
        t1 = i+1;
        t2 = t1+k;
        t3 = t2-1;
        TRIV = [TRIV ; t1 t2 t3];
        
        i = i+1;
    end
    i = i+1;
end

m = size(TRIV,1);
n = max(TRIV(:));

% adjacency
A = sparse(...
    [TRIV(:,1); TRIV(:,2); TRIV(:,3)], ...
    [TRIV(:,2); TRIV(:,3); TRIV(:,1)], ...
    1, ...
    n, n, 3*m);
A = A+A';
A = double(A~=0);

% boundary coordinates

zero_to_one = linspace(0,1,k)';
boundary_xyz = [...
    [zero_to_one ones(k,1) zeros(k,1)]; ...
    [ones(k-1,1) zero_to_one(end-1:-1:1) zeros(k-1,1)];...
    [zero_to_one(end-1:-1:1) zeros(k-1,2)];...
    [zeros(k-2,1) zero_to_one(2:end-1) zeros(k-2,1)] ];

boundary_idx = [ 1:k, (2*k:k:n), (n-1:-1:n-k+1), (n-2*k+1:-k:k+1)];

% boundary_xyz = [...
%     cos(linspace(0,2*pi,length(boundary_idx)))',...
%     sin(linspace(0,2*pi,length(boundary_idx)))',...
%     zeros(length(boundary_idx),1)];

end
