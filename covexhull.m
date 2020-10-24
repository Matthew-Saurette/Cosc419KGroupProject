x=[0,1,0,0];
y=[0,0,1,0];
z=[0,0,0,1];
x2=[0,-1,0,0];
y2=[0,0,-1,0];
z2=[0,0,0,-1];

[k1,av1] = convhull(x,y,z);
[k2,av2] = convhull(x2,y2,z2);

s1 = trimesh(k1,x,y,z,'FaceColor','cyan','DisplayName','Y0')
hold on
s2 = trimesh(k2,x2,y2,z2,'FaceColor','cyan','DisplayName','Y1')
alpha(s1,0.1)
legend show
