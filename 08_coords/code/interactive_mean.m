function interactive_mean(V, F, neighs, is_bd)

  figure, colormap([1 1 1])
  
  weights = calc_mean_value_coords(V, neighs, is_bd);
    
  tsh = trisurf(F,V(:,1),V(:,2),V(:,3),'ButtonDownFcn',@onmeshdown);
  p = get(tsh,'Parent');
  set(p,'ButtonDownFcn',@onvoiddown);
  view(2);
  axis equal
  axis manual
  axis off
  down_pos = [];
  drag_pos = [];
  down_V = [];
  selected_v = [];

    % what happens when you click outside the mesh
    function onvoiddown(src,ev)
      % do nothing
    end

    % what happens when you click on the mesh
    function onmeshdown(src,ev)
      selected_v = [];
      down_pos=get(gca,'currentpoint');
      set(gcf,'windowbuttonmotionfcn',@drag) 
      set(gcf,'windowbuttonupfcn',@up)
      down_V = get(tsh,'Vertices');
    end

    function drag(src,ev)
      drag_pos=get(gca,'currentpoint'); 
      new_vert = down_V;
      
      if isempty(selected_v)
          [~,selected_v] = min(pdist2(drag_pos(1,1:2), new_vert(:,1:2)));
      end
      
      if is_bd(selected_v)
          
          new_vert(selected_v,1) = (drag_pos(1,1) - down_pos(1,1)) + down_V(selected_v,1);
          new_vert(selected_v,2) = (drag_pos(1,2) - down_pos(1,2)) + down_V(selected_v,2);
          
%           weights = calc_mean_value_coords(new_vert, neighs, is_bd);
          
          for i=1:length(neighs)
              if is_bd(i)
                  continue
              end
              new_vert(i,1:2) = (new_vert(neighs{i},1:2)'*weights{i})';
          end
          
          set(tsh, 'Vertices', new_vert);
          axis image
          
      end
    end

    function up(src,ev) 
        set(gcf,'windowbuttonmotionfcn',''); 
        set(gcf,'windowbuttonupfcn',''); 
    end

end
