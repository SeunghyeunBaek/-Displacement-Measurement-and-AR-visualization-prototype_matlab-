global marker;
global vid ;
global Ratio;
global flag;
global data;
global count;
global time;
global r_dis_p;

   

%% ��Ŀ �ĺ�
    data = getsnapshot(vid);
    diff_im = imsubtract(data(:,:,1),rgb2gray(data));                      % gray scale ���� ���� 1;red
    diff_im = medfilt2(diff_im,[3,3]);                                     % �߰��� ����
    diff_im = im2bw(diff_im,0.18);                                         % ���ó��
    diff_im = bwareaopen(diff_im,300);                                     % 700 �ȼ� 0���� ó�� (����)
    bw = bwlabel(diff_im,8);                                               % ��İ� ���� - 8 connected object
    stats = regionprops (bw,'BoundingBox','Centroid');                    % set of properties specified by properties for 8- connected component
    axes(handles.axes3);
    imshow(data); 
%% ���� ����
    hold on
    
     if(flag == 1)
        break;
     end
%% ��Ŀ ��ǥ �ν�

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
      
     set(handles.Coordinate_etxt,'String', Coord);                                            % �ǽð� ��ǥ ���
     marker(object).p_dis = sqrt( (marker(object).x - marker(object).init_x)^2 + (marker(object).y- marker(object).init_y )^2 );  % �ȼ��� �Ÿ� ���
     marker(object).r_dis= marker(object).p_dis*Ratio;                                                                            % ���� �Ÿ� ���
         
     %r_dis_s = sprintf('%s %s',num2str((marker(3).r_dis(3)),'mm'));
     set(handles.Var_etxt,'String', num2str((marker(3).r_dis)));

     
   end
   
     count = count +1;     
     time(count) = toc;
     r_dis_p(count) = marker(3).r_dis;
     %������
     plot(handles.axes2,time,r_dis_p,'r--');
     xlabel(handles.axes2, 'time(s)');
     ylabel(handles.axes2, 'deflection(mm)');  
     
