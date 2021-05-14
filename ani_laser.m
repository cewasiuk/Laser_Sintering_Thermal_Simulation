u=273;
time = 10;
alpha = 20;
B= 10;
width = 100;
z=0;
x = linspace(-150,150,50); y = linspace(-150,150,50); [X,Y]= meshgrid(x,y);

for i = 1:time
    u = u + B.*alpha.*exp((-2.*(X.^2+Y.^2)./width.^2)-alpha.*z)
    surf(Y,X,u);
    c = colorbar
    c.Label.String = 'Temperature (K)';
    zlabel('Temperature (K)');
    xlabel('X Position (m)');
    ylabel('Y Position (m)');
    title( ['Regolith Temperature with Beam Width ',num2str(width), 'mm at time ', num2str(i),'s']);
    h= get(gcf,'CurrentAxes');
    zlim([273, max(max(u))]);
    Frames(i) = getframe(h);
    %pause(0.05)
end

movie2avi(Frames,'Output.avi','compression','Cinepak','fps',1);
