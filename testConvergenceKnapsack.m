%% test 2 - convergence

N = 10000;
p = 20; % [10, 15, 20, 30, 50]
e = 0.92; % 0.82 [0.5, 0.62, 0.75, 0,82, 0.95]
m = 0.00001; % 0.00001
n = 3;

nbrItr = 10;
globalMax = zeros(N,nbrItr, 'uint16');

tic
parfor i= 1:nbrItr
    globalMax(:,i) = Knapsack(p, e, m, N, n);
end
toc
%%
figure
plot( [1,N]', 4528*ones(2,1), 'g')
hold on
for i=1:nbrItr
    plot(1:size(globalMax,1), globalMax(:,i))
end
%%
finalMax = max(globalMax(end,:))
%mean=uint16(sum(globalMax,2)./nbrItr);
%plot(1:size(globalMax,1), mean(:), 'LineWidth', 1)
beep on
beep
