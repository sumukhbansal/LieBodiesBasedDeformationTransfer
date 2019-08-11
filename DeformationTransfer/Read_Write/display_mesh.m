function display_mesh( V,F,meshtype,cl,lin)

lc=strcat('.','r');
switch meshtype
    case 'mesh'
%                 hh = trisurf(F,V(:,1),V(:,2),V(:,3));%trisurf(Tri,X,Y,Z);
%         
%                 % Additional bit to control color of each patch individually
%                 set(hh,'FaceColor',cl,...
%                     'CDataMapping','scaled');
%                 view([-1,0,0]);
        
        p=patch('Vertices',V,'faces',F);
%         set(p,'FaceColor',[0,0.78,1],'EdgeColor','white')
%         set(p,'FaceColor',[0,0.78,1],'EdgeColor','None')
%             set(p,'FaceColor',cl,'EdgeColor','None')
             set(p,'FaceColor',cl,'EdgeColor','black')
%               set(p,'FaceColor',cl,'EdgeColor','white') 
       view([0,-.5,.5]);
       % Set visulization parameters
        axis image;
%         axis square;
%         camlight;
         axis off; 
           grid on;
%         camlight('left')
%         camlight('headlight')
        set(p, 'ambientStrength', 0.4);
        set(p, 'diffuseStrength', 0.4);
        set(p, 'FaceLighting', 'gouraud');%'flat', 'none'
        set(p, 'edgeLighting', 'gouraud');
        % set(p, 'FaceLighting', 'phong');
        % set(p, 'edgeLighting', 'phong');
        % camera parameters
%         view([.1,0,-.1]);
%         view([0,15]);
%        set(gca, 'cameraupvector', [0 1 0]);
        cameratoolbar('setmode', 'orbit');
        cameratoolbar('setcoordsys', 'y');
%         cameratoolbar('setcoordsys', 'x');
        cameratoolbar('show');
       
    case 'tetmesh'
        Ft=[F(:,[1 2 3]);F(:,[1 2 4]);F(:,[2 4 3]);F(:,[1 4 3])];
        p=patch('Vertices',V,'faces',Ft);
        set(p,'FaceColor',cl,'EdgeColor','black')
        view([0,-.5,.5]);
       % Set visulization parameters
        axis image;
        axis off; 
        grid on;
        set(p, 'ambientStrength', 0.4);
        set(p, 'diffuseStrength', 0.4);
        set(p, 'FaceLighting', 'gouraud');%'flat', 'none'
        set(p, 'edgeLighting', 'gouraud');

        cameratoolbar('setmode', 'orbit');
        cameratoolbar('setcoordsys', 'y');
        cameratoolbar('show');
        
       
    case 'points'
        plot3(V(:,1),V(:,2),V(:,3),lc);
        
end

