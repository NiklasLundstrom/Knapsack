%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Removes (set pheromone to zero) all sacks from Candidates 
% that are to heavy to go on the truck.
% returns the updated candidate vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function candidates = removeToHeavySacks( candidates, weights, weightFree)

    i = size(candidates,1);
    % Jump over zeroes in the end
    while ~candidates(i)
        i = i-1;
    end
    % Remove all sacks that are to heavy
    while (~candidates(i)) || (weights(i) > weightFree)
        candidates(i) = 0;
        i = i-1;
    end

end