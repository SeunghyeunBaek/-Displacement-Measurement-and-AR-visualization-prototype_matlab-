global marker;
global vid;
global p_length;
global x_edge
global y_edge
global p_height;
global init_coord_mat


%% for color function
global k
global l
global avg_dis

%% for FEM function



%% PreAllocation

init_coord_mat = cell(5,9);
for j = 1:9
    for i = 1:5
        init_coord_mat{i,j}(1,1) = 0;
        init_coord_mat{i,j}(1,2) = 0;
    end
end
k = 1:4;
l = 1:8;
avg_dis = zeros(1,32);


%% Red Marker �ν� + Bounding Box + Centroid ����

data = getsnapshot(vid);
    
    diff_im = imsubtract(data(:,:,1),rgb2gray(data)); %% gray scale ���� ����
    diff_im = medfilt2(diff_im,[3,3]); % �߰��� ����
    diff_im = im2bw(diff_im,0.18); %% ���ó��
    diff_im = bwareaopen(diff_im,300); % 300������ �ȼ� 0���� ó�� (����)
    
    bw = bwlabel(diff_im,8); %% ��İ� ���� - 8 connected object
    stats = regionprops (bw,'BoundingBox','Centroid'); %% set of properties specified by properties for 8- connected component
    axes(handles.axes3);
    imshow(data);
    
    hold all
     
    for object = 1:length(stats)
        
    bb = stats(object).BoundingBox;
    bc = stats(object).Centroid;
    
    rectangle('Position',bb,'EdgeColor','r','LineWidth',2);
     
    plot(handles.axes3,bc(1),bc(2),'-m+');
    a =  text(bc(1),bc(2),['(' num2str(round(bc(1))) ',' num2str(round(bc(2))) ')']);     
    set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
    
    
    marker(object).init_x = round(bc(1));
    marker(object).init_y = round(bc(2));
    x = num2str(marker(object).init_x);
    y = num2str(marker(object).init_y);
    str = sprintf('%s %s %s',x,',',y);
    
    set(handles.init_coord_etxt,'String',str);
    
    end
     %% ���� ���̸� �����ϱ� ���� ��ǥ �Է�  
    x_edge = [0;0];
    y_edge = [0;0];
    n = 0;
    button = 1;
    
    while n<2
            
    [xi, yi, button] = ginputc(1, 'LineStyle', ':');                       %���콺�� Ŭ���� ��ǥ�� �޴´�.
    plot(xi,yi,'ro');                                                       %���콺�� Ŭ���� ��ǥ�� o�� ��´�.
    n=n+1;                                                                   %ī��Ʈ�ؼ� ��´�.
    x_edge(n,1)=xi;                             
    y_edge(n,1)=yi;                           
      
    end
    
    t = 1:n; 
    ts=1:0.1:n;
    xs=spline(t,x_edge,ts);      
    ys=spline(t,y_edge,ts);
    
    c1.x = x_edge(1,1);
    c2.x = x_edge(2,1);
    c1.y = y_edge(1,1);
    c2.y = y_edge(2,1);
    
    p_length = abs(marker(1).init_x-marker(5).init_x); % ���� ����
    p_height = abs(c2.y-c1.y); % ���� ����
    p_lang = num2str(p_length);  
    set(handles.P_length_etxt,'String',p_lang);
    %rectangle('Position',[c1.x, c1.y, p_length, p_height],'EdgeColor','y','LineWidth',2); % �簢�� ����
        
    %% init_coord_mat 
    for j = 1:5
        init_coord_mat{1,2*j-1} = [marker(j).init_x c1.y];
        if j<5
            init_coord_mat{1,2*j} = [round((marker(j).init_x + marker(j+1).init_x)/2) c1.y];
        end
    end
    for j =1: 5
        init_coord_mat{2,2*j-1} = [marker(j).init_x marker(j).init_y-p_height/4];
        init_coord_mat{3,2*j-1} = [marker(j).init_x marker(j).init_y];
        init_coord_mat{4,2*j-1} = [marker(j).init_x marker(j).init_y+p_height/4];
          if j<5
            init_coord_mat{2,2*j} = [round((marker(j).init_x + marker(j+1).init_x)/2) marker(j).init_y-p_height/4];
            init_coord_mat{3,2*j} = [round((marker(j).init_x + marker(j+1).init_x)/2) marker(j).init_y];
            init_coord_mat{4,2*j} = [round((marker(j).init_x + marker(j+1).init_x)/2) marker(j).init_y+p_height/4];
          end
     end
    for j = 1: 5
        init_coord_mat{5,2*j-1} = [marker(j).init_x,c2.y];
          if(j<5)
            init_coord_mat{5,2*j} = [round((marker(j).init_x + marker(j+1).init_x)/2) c2.y];
          end
     end
    %% grid ���
    
    for i = 1: 5
    plot([marker(1).init_x,marker(5).init_x],[init_coord_mat{i,1}(2) init_coord_mat{i,9}(2)],'LineWidth',2,'Color','y');
    end
    for i = 1 : 9
    plot([init_coord_mat{1,i}(1) init_coord_mat{5,i}(1)],[init_coord_mat{5,i}(2) init_coord_mat{1,i}(2)],'LineWidth',2,'Color','y');
    end
 
   