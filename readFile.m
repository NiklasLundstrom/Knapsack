%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read values and weights of sack from file.
% return sacks=[values, weights], maxCapacity of truck
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [sacks, maxCapacity] = readFile( fileName )

fileID = fopen(fileName, 'r');

nbrSacks = (numel(textread(fileName,'%1c%*[^\n]'))-1)/3;

maxCapacity = fscanf(fileID, ['security van capacity: %d']);
fgetl(fileID); % skip first line
sacks = zeros(nbrSacks, 2, 'single');
for i = 1:nbrSacks
    
    % Skip line stating number of sack
    fgetl(fileID); 
    
    % Read weight of sack number i
    line = fgetl(fileID);
    index = strfind(line, 'weight:');
    sacks(i,1) = sscanf(line(index(1) + 7:end), '%g', 1);
    
    % Read value of sack number i
    line = fgetl(fileID);
    index = strfind(line, 'value:');
    sacks(i, 2) = sscanf(line(index(1) + 6:end), '%g', 1);
end

fclose(fileID);

end