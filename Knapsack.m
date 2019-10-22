%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solver to the 1-0 Knapsack problem.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function globalMaxValue = Knapsack(p, e, m, N, n)
%% -------------------------------%
%           initiate              %
%---------------------------------%
%% Parameters
% p = Population size, number of ants
% e = Evaporation rate
% m = Pheromone deposition rate
% N = nbr of Generations
% n = nbr of ants to distr. pheromones each generation

%% Read weights from file
[sacks, maxCapacity] = readFile('BankProblem.txt');
nbrSacks = size(sacks, 1);
%% Set up sacks
sacks = sortrows(sacks, 1);
%% Initiate pheromone values
pheromones = ones(nbrSacks, 1, 'single');
%% Create ant skeleton, Candidate vector and Fitness vecktor
nbrAnts = p;
fitness = zeros(nbrAnts, 1, 'uint16');
%% -------------------------------%
%           run                   %
%---------------------------------%

globalMax = cell(2,1); globalMax{1} = zeros(N,1, 'single'); % Best solution {value, [path]}
for generation = 1:N
   %% Let the ants make their paths
   antPaths = cell(nbrAnts,1); 
   for ant = 1:nbrAnts
       candidates = pheromones;
       antPath = zeros(nbrSacks, 'uint8'); % We don't know the lenth of the path yet. uint8 possible because we know the size of the problem
       pathNode = 1;
       sumWeight = 0;
       sumCandidates = sum(candidates);
       while sumCandidates ~= 0
           sackIndex = getRandIndex(candidates, sumCandidates);
           antPath(pathNode) = sackIndex;
           pathNode = pathNode + 1;
           sumWeight = sumWeight + sacks(sackIndex, 1);
           candidates(sackIndex) = 0;
           candidates( sacks(:,1) > ( maxCapacity - sumWeight ) ) = 0;
       sumCandidates = sum(candidates);
       end
       antPaths{ant} = antPath(~(~antPath)); 
       % Ant turn complete.
       % Calculate fitness:
       fitness(ant) = sum( sacks(antPaths{ant}, 2) );
   end % All ants has taken one turn
   % If we have found a new global best solution, save it:
   [generationMax, index] = max(fitness);
   if generation == 1 || generationMax >= globalMax{1}(generation-1)
       globalMax{1}(generation) = generationMax;
       globalMax{2} = antPaths{index};
   else
        globalMax{1}(generation) = globalMax{1}(generation-1);
   end
   %% Delute pheromones:
   pheromones = pheromones*e;
   %% Add pheromones:
   addedPheromones = @(fit) m*single(fit);
   % Find the n best fitness values
   toSort = [fitness, (1:p)'];
   sorted = sortrows(toSort, 1);
   indexes = sorted(end-n+1:end, 2);
   for i = 1:n
       pheromones(antPaths{indexes(i)}) = pheromones(antPaths{indexes(i)}) + addedPheromones(fitness(indexes(i)));
   end
end

%% Return
globalMaxValue = globalMax{1};
end