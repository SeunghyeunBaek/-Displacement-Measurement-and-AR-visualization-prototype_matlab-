global vid



%% Cam 불러오기
vid = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'FramesPerTrigger',inf);
set(vid, 'ReturnedColorspace','rgb');
% vid.FrameGrabInterval = 2;
start(vid);
preview(vid);
%% 시간 측정

