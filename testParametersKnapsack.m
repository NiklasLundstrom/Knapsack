%% test 1 - parameters
N = linspace(800,800, 8)';

p = 64; % [2, 4, 8, 16, 32, 64]';
e = 0.95; % [0.5, 0.75, 0.95, 0.99, 1]';
m = 0.001;

nbrParamTests = size(N, 1);
globalMax = zeros(nbrParamTests,1);
%figure
%hold on

tic
parfor i = 1:nbrParamTests
    globalMax(i) = Knapsack(p, e, m, N(i));
    %plot(p(1:i), globalMax(1:i), 'o-')
    %pause(1);
end
toc

figure
plot(N, globalMax, 'o')