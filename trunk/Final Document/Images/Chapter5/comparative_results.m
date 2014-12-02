% Comparative results
m = dlmread('/media/andres/DATA/Documents/Seminario de Investigacion/VRP/Outcomes/Consolidate outcomes - forecasting.csv',',',1,1);

figure
plot(m(:,1),m(:,5),'o',m(:,1),m(:,7),'*',m(:,1),m(:,9),'x')
xlabel('n')
ylabel('Expected distance')
legend('rollout','ga','memetic','Location','northwest');

figure
boxplot(m(:,[5 7 9]),'labels',{'rollout','ga','memetic'});
ylabel('Expected distance')


%time
figure
stem(m(:,1),m(:,[6 8]))
legend('ga','memetic','Location','northwest');
xlabel('n')
ylabel('Running time')
set(gca,'XLim',[0 160]);


%ra
scatter3(m(:,4),m(:,1),m(:,2),m(:,3),m(:,5),'fill')
zlabel('Q')
ylabel('n')
xlabel('time(s)')
%size - range
%color - expected distance

%ga
scatter3(m(:,6),m(:,1),m(:,2),m(:,3),m(:,7),'fill')
zlabel('Q')
ylabel('n')
xlabel('time(s)')
%size - range
%color - expected distance

%memetic
scatter3(m(:,8),m(:,1),m(:,2),m(:,3),m(:,9),'fill')
zlabel('Q')
ylabel('n')
xlabel('time(s)')
%size - range
%color - expected distance


%size - expected distance
%color - range

