% Original Cube

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

% Part 6: Реализация 
verticesCube_1 = getTranslated_Scale(20,-10,5, 2, 2, 4) * getRotated_y(25)*verticesCube;
verticesCube_2 = getTranslated_Scale(15, 5, -10, 3, 1, 3)*getRotated_z(150)*getRotated_x(35)*verticesCube;

% Параметры для камеры
cameraPos = [20 20 15];
cameraTarget =[6 5 3]; 
cameraUp = [0 1 0];

viewMatrix1 = lookat(cameraPos, cameraTarget, cameraUp) * verticesCube;
viewMatrix2 = lookat(cameraPos, cameraTarget, cameraUp) * verticesCube_1;
viewMatrix3 = lookat(cameraPos, cameraTarget, cameraUp) * verticesCube_2;


% Part 7: Реализация перспективы
figure()
fov = 25;
aspect = 1;
n = 3;
f = 2;

Perspective_1 = createPerspective(fov,aspect,n,f,viewMatrix1);
Perspective_2 = createPerspective(fov,aspect,n,f,viewMatrix2);
Perspective_3 = createPerspective(fov,aspect,n,f,viewMatrix3);

DrawShape(Perspective_1, facesCube, 'flat')
DrawShape(Perspective_2, facesCube, 'flat')
DrawShape(Perspective_3, facesCube, 'flat')

xlim([10 20])
ylim([-20 20])
zlim([-20 20])


view(3)
axis equal;
hold on

function Perspective = createPerspective(fovy, aspect, near, far,v)
    top = near * tand((fovy)/2);
    bottom = -top;
    right = top * aspect;
    left = -right;
    %Move the Frustum Apex to the Origin
    frustum_to_Origin = [1         0         0         -(left+right)/2;
                         0         1         0         -(bottom+top)/2;
                         0         0         1                0;
                         0         0         0                1
                         ];

    perspec_cal = [near 0   0   0;
                    0   near 0   0;
                    0    0   1   0;
                    0    0  -1   0
                    ];
    
    %Scale the View Window to (-1,1) to (+1,+1)
    scale_wind = [ 2/(right-left)         0           0            0;
                        0         2/(top-bottom)      0            0;
                        0                 0           1            0;
                        0                 0           0            1
                ];
    %Mapping Depth (z values) to (-1,+1)
    c1 = 2*far*near/(near-far);
    c2 = (far+near)/(far-near);
      
    map = [1 0   0  0;
           0 1   0  0;
           0 0 -c2 c1;
           0 0 -1   0];
    Perspective = scale_wind*perspec_cal*map*frustum_to_Origin*v;
end

% Funtions
% DrawShape
function DrawShape (vertices , faces , flat )
    patch ('Vertices', ( vertices (1:3,:) ./ vertices (4 ,:))', 'Faces', faces ,'FaceVertexCData',hsv(6),'FaceColor', flat, 'facealpha', 0.3)
end

% Scale
function matrix = getTranslated_Scale(dx, dy, dz, Sx, Sy, Sz)
    matrix = [ Sx 0  0  dx;
               0  Sy 0  dy;
               0  0  Sz dz;
               0  0  0  1
              ];
end

% viewMatrix
function viewMatrix = lookat(eye, target, up)
    f = normalize(eye - target); % axis z
    s = normalize(cross(up,f));  % axis x
    u = cross(f,s);              % axis y
     
    viewMatrix =[ s(:,1)  s(:,2)   s(:,3)   -dot(s,eye);
                   u(:,1)  u(:,2)   u(:,3)   -dot(u,eye);
                   f(:,1)  f(:,2)   f(:,3)   -dot(f,eye);
                      0       0        0           1
                  ];
end

% Rotation
function matrix = getRotated_x(theta)
    matrix = [1        0         0          0;
              0  cosd(theta) -sind(theta)   0;
              0  sind(theta)  cosd(theta)   0;
              0        0         0          1
             ];
 
end
function matrix = getRotated_y(theta)
    matrix = [ cosd(theta)  0   sind(theta)  0;
                    0       1       0        0;
              -sind(theta)  0   cosd(theta)  0;
                  0         0       0        1
             ];
end
 
function matrix = getRotated_z(theta)
    matrix = [cosd(theta) -sind(theta)  0    0;
              sind(theta)  cosd(theta)  0    0;
                   0           0        1    0;
                   0           0        0    1
             ];
end

