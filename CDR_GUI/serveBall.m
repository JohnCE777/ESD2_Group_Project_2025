% M.A.Schneider
% serveBall.m

clc;
clear all;
close all;

%Initialization Parameters
server_ip   = '127.0.0.1';     %IP address of the Unity Server
server_port = 55001;           %Server Port of the Unity Sever

client = tcpclient(server_ip,server_port,"Timeout",20);
fprintf(1,"Connected to server\n");

width = 1920;
height = 1080;

% relative link works when Current Folder is lecture15
serve = readmatrix("./datFiles/serve1.dat");

dataSize = size(serve);
numFrames = dataSize(1);

sampledServeCounter = 1;
framesTimeMs = 50; % this number changes framerate

for counter = 1:framesTimeMs:numFrames
    x = serve(counter,1);
    y = serve(counter,3);
    z = serve(counter,2);
    sampledServeCounter = sampledServeCounter+1;

    % image may be called dummy
    image = blenderLink(client,width,height,x,y,z,0,0,0,"tennisBall");
    imagesc(image)
    set(gcf, 'Position', get(0, 'Screensize'));
    axis off

    % send images

    % receive x,y,z,deltaT
    % time = time + deltaT;   % intended to ignore blender delays
end