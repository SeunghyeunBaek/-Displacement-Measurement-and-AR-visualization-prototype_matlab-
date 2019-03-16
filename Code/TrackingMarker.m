global marker;
global vid ;
global Ratio;
global flag;
global data;
global count;
global time;
global r_dis_p;

   

%% 마커 식별
    data = getsnapshot(vid);
    diff_im = imsubtract(data(:,:,1),rgb2gray(data));                      % gray scale 영상 제거 1;red
    diff_im = medfilt2(diff_im,[3,3]);                                     % 중간값 필터
    diff_im = im2bw(diff_im,0.18);                                         % 흑백처리
    diff_im = bwareaopen(diff_im,300);                                     % 700 픽셀 0으로 처리 (필터)
    bw = bwlabel(diff_im,8);                                               % 행렬값 리턴 - 8 connected object
    stats = regionprops (bw,'BoundingBox','Centroid');                    % set of properties specified by properties for 8- connected component
    axes(handles.axes3);
    imshow(data); 
%% 종료 조건
    hold on
    
     if(flag == 1)
        break;
     end
%% 마커 좌표 인식

   for object = 1:length(stats)
              
     bb = stats(object).BoundingBox;
        
     bc = stats(object).Centroid;
        
     rectangle('Position',bb,'EdgeColor','r','LineWidth',2);
     
     plot(bc(1),bc(2),'-m+');
         
     %a =  text(bc(1),bc(2),['(' num2str(round(bc(1))) ',' num2str(round(bc(2))) ')']);     
     %set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
     
     marker(object).x = round(bc(1));
     marker(object).y = round(bc(2));
     
     Coord = sprintf('%s %s %s',num2str(marker(3).x),',',num2str(marker(3).y));
      
     set(handles.Coordinate_etxt,'String', Coord);                                            % 실시간 좌표 출력
     marker(object).p_dis = sqrt( (marker(object).x - marker(object).init_x)^2 + (marker(object).y- marker(object).init_y )^2 );  % 픽셀간 거리 계산
     marker(object).r_dis= marker(object).p_dis*Ratio;                                                                            % 실제 거리 계산
         
     %r_dis_s = sprintf('%s %s',num2str((marker(3).r_dis(3)),'mm'));
     set(handles.Var_etxt,'String', num2str((marker(3).r_dis)));

     
   end
   
     count = count +1;     
     time(count) = toc;
     r_dis_p(count) = marker(3).r_dis;
     %데이터
     plot(handles.axes2,time,r_dis_p,'r--');
     xlabel(handles.axes2, 'time(s)');
     ylabel(handles.axes2, 'deflection(mm)');  
     
