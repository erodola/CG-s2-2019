function interactive_ls(V, F, L, H, boundary_xyz)

  figure, colormap([1 1 1])
  colors = jet(size(boundary_xyz,1));

  tsh = trisurf(F,V(:,1),V(:,2),V(:,3)); hold on
%   plot_boundary_edges(struct('VERT',V,'TRIV',F), calc_boundary_edges(F), 1)

  bdh = scatter3(...
      boundary_xyz(:,1),boundary_xyz(:,2),boundary_xyz(:,3),...
      50, colors, 'fill',...
      'ButtonDownFcn',@onbtndown);
  
  p = get(bdh,'Parent');
  set(p,'ButtonDownFcn',@onvoiddown);
  
  view([0 -90]);
  axis equal; axis off
  
  down_pos = [];
  drag_pos = [];
  down_V = [];
  selected_v = [];

    % what happens when you click outside the mesh / scatter
    function onvoiddown(src,ev)
      % do nothing
    end

    % what happens when you click on the scatter points
    function onbtndown(src,ev)
      selected_v = [];
      down_pos=get(gca,'currentpoint');
      set(gcf,'windowbuttonmotionfcn',@drag)
      set(gcf,'windowbuttonupfcn',@up)
      down_V = [...
          get(bdh,'XData')',...
          get(bdh,'YData')'];
    end

    function drag(src,ev)
      drag_pos=get(gca,'currentpoint'); 
      new_vert = down_V;
      if isempty(selected_v)
          [~,selected_v] = min(pdist2(drag_pos(1,1:2), new_vert(:,1:2)));
      end
      new_vert(selected_v,1) = drag_pos(1,1);
      new_vert(selected_v,2) = drag_pos(1,2);
      set(bdh, ...
          'XData', new_vert(:,1)', ...
          'YData', new_vert(:,2)');
      set(tsh, ...
          'Vertices', ...
          [L; H] \ [zeros(size(L,1),3); [new_vert zeros(size(boundary_xyz,1),1)]]);
      axis image
    end

    function up(src,ev) 
        set(gcf,'windowbuttonmotionfcn',''); 
        set(gcf,'windowbuttonupfcn',''); 
    end

end
