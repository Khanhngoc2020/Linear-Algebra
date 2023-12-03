%% Original Cube
verticesCube = [
    -1, 1, 1,-1,-1, 1, 1 ,-1;
    -1,-1, 1, 1,-1,-1, 1, 1;
    -1,-1,-1,-1, 1, 1, 1, 1;
     1, 1, 1, 1, 1, 1, 1, 1
     ];

 facesCube = [
     1, 2, 6, 5;
     2, 3, 7, 6;
     3, 4, 8, 7;
     4, 1, 5, 8;
     1, 2, 3, 4;
     5, 6, 7, 8
     ];

%% Измените масштаб кубика

% Transformation matrix
scale = [0.5 0 0; 0 0.5 0; 0 0 0.5]; % matrix transfomation for scaling
rotation = [0;0;0]; % Choose any matrix transformation and set elements = 0
H_1 = [scale rotation; 0 0 0 1];
verticesCube2 = H_1 * verticesCube;

figure('Name', 'Cube3D', 'NumberTitle','off')

% Draw Cube
DrawShape(verticesCube, facesCube,'flat');
DrawShape(verticesCube2, facesCube, 'black');

% Set axis
title("Scale transformation for Cube")
xlabel('x','FontSize',10)
ylabel('y','FontSize',10)
zlabel('z','FontSize',10)
axis equal;
view(3)

hold on 
%% Переместите кубик

A = [0.5 0 0; 0 0.5 0; 0 0 -0.5]; % Scaling
B = [0;0;-2]; % Translation
H_2 = [A B; 0 0 0 1]; % H is matrix 4x4
Pt = H_2*verticesCube; 

figure('Name','Translation', NumberTitle='off')

DrawShape(verticesCube, facesCube, 'flat')
DrawShape(Pt, facesCube, 'black')

title("Translation")
xlabel('x','FontSize',10)
ylabel('y','FontSize',10)
zlabel('z','FontSize',10)
axis equal;
view(3)

hold on

%% вращение кубика
% rotate =[1 0 0; 0 cosd(30) -sind(30); 0 sind(30) cosd(30)]; % Rotation around the X-axis
% rotate = [cosd(30) 0 sind(30); 0 1 0; -sind(30) 0 cosd(30)]; % Rotation around the Y-axis
rotate = [cosd(30) -sind(30) 0; sind(30) cosd(30) 0; 0 0 1]; % Rotation around the Z-axis
scale =[0;0;0];
H_3 = [rotate scale; 0 0 0 1];
verticesCube3 = H_3 * verticesCube;

figure('Name','Rotation', NumberTitle='off')

DrawShape(verticesCube, facesCube, 'red')
DrawShape(verticesCube3, facesCube, 'blue')

title("Rotation")
xlabel('x','FontSize',10)
ylabel('y','FontSize',10)
zlabel('z','FontSize',10)
axis equal;
view(3)

hold on

%%  вращение кубика около одной вершины



%%
function DrawShape (vertices , faces , flat )
    patch ('Vertices', ( vertices (1:3,:) ./ vertices (4 ,:))', 'Faces', faces ,'FaceVertexCData',hsv(6),'FaceColor', flat, 'facealpha', 0.3)
end

%% Transformation Matrix
function matrix = getTranslated(dx, dy, dz)
matrix = [1 0 0 dx;
          0 1 0 dy;
          0 0 1 dz;
          0 0 0 1
         ];
end
% Rotation
function matrix = getRotated_x(theta)
matrix = [1        0         0       0;
          0 cosd(theta) -sind(theta) 0;
          0 sind(theta)  cosd(theta) 0;
          0        0         0       1
          ];
end
function matrix = getRotated_y(theta)
matrix = [0 cosd(theta) sind(theta) 0;
          1        0         0      0;
          0 sind(theta) cosd(theta) 0;
          0        0         0      1
          ];
end
function matrix = getRolated_z(theta)
matrix = [0 cosd(theta) -sind(theta) 0;
          0 sind(theta)  cosd(theta) 0;
          1        0         0       0;
          0        0         0       1
    ];
end

%Scaling
function matrix = getScale(Sx, Sy, Sz)
matrix = [Sx 0 0 0;
          0 Sy 0 0;
          0 0 Sz 0;
          0 0 0  1
          ];
end
