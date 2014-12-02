% Comparative results
figure
plot(m(:,1),m(:,5),'o',m(:,1),m(:,7),'*',m(:,1),m(:,9),'x')
xlabel('n')
ylabel('Expected distance')
legend('rollout','ga','memetic','Location','northwest');

figure
boxplot(m(:,[5 7 9]),'labels',{'rollout','ga','memetic'});
ylabel('Expected distance')
