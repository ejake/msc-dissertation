m = dlmread('/media/andres/DATA/Documents/Seminario de Investigacion/VRP/Outcomes/demands - Sheet3.csv',',',1,0);
scatter(m(:,1), m(:,2), m(:,3), m(:,4))
title('Instance demands')
