%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main script for solving the 1-0 Knapsack problem.
% N = nbr of Generations
% p = Population size, number of ants
% e = Evaporation rate
% m = Pheromone deposition rate
% n = nbr of ants to distr. pheromones each generation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = 20;
N = 10000/p;
e = 0.92;
m = 0.00001;
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
hold on
for i=1:nbrItr
    plot(1:size(globalMax,1), globalMax(:,i))
end
%%
mean=uint16(sum(globalMax,2)./nbrItr);
plot(1:size(globalMax,1), mean(:), 'LineWidth', 1)
