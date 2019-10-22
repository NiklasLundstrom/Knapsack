%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Returns the index of the next sack.
% Candidates is a list of all pheromones, where it equals 
% zero if either sack is already in the ants path, or if 
% the sack is to heavy to add to the truck.
% totSumCandidates is the total sum of pheromones from 
% all current candidates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function i = getRandIndex( candidates, totSumCandidates )

randNbr = totSumCandidates*rand;

sumCandidates = 0;
for i = 1:size(candidates, 1)
    sumCandidates = sumCandidates + candidates(i);
    if( randNbr < sumCandidates )
        return
    end    
end

end