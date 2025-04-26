% M.A.Schneider
% readServe.m

% relative link works when Current Folder is lecture15
serve = readmatrix("./datFiles/serve1.dat");

dataSize = size(serve);
numFrames = dataSize(1);

sampledServeCounter = 1;
framesTimeMs = 1;

for counter = 1:framesTimeMs:numFrames
    x = serve(counter,1);
    y = serve(counter,3);
    z = serve(counter,2);

    sampledServe(1,sampledServeCounter) = x;
    sampledServe(2,sampledServeCounter) = y;
    sampledServe(3,sampledServeCounter) = z;
    sampledServeCounter = sampledServeCounter+1;
end

scatter3(sampledServe(1,:),sampledServe(2,:),sampledServe(3,:))