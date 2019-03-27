function weights = calc_mean_value_coords(VERT, neighs, is_bd)

n = size(VERT,1);
weights = cell(n,1);

for i=1:n
    
    if is_bd(i)
        continue
    end
    
    nn = neighs{i};
    weights{i} = zeros(length(nn),1);
    
    for j=1:length(nn)
        
        common = intersect(nn,neighs{nn(j)});
        
        assert(length(common)==2)
        
        e0 = VERT(nn(j),:)-VERT(i,:);
        len = norm(e0);
        e1 = VERT(common(1),:)-VERT(i,:);
        e2 = VERT(common(2),:)-VERT(i,:);
        a1 = acos( (e1*e0')/(norm(e1)*len) );
        a2 = acos( (e2*e0')/(norm(e2)*len) );
        
        assert(isreal(a1))
        assert(isreal(a2))
        
        weights{i}(j) = (tan(a1/2)+tan(a2/2)) / len;
        
    end
    
    weights{i} = weights{i}./sum(weights{i});
    
end

end
