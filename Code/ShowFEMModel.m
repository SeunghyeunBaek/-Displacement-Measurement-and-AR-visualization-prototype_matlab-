global marker
global data
global p_height
global current_coord_mat
global init_coord_mat

global x_marker;
global y_marker;
global x_index; 
global y_index;
global x_coord;
global y_coord ;
global x_length;

global n_line


%% 좌표 업데이트




x_coord = cellfun(@(x) x(1), init_coord_mat(3,1:9));
y_coord = cellfun(@(x) x(2), init_coord_mat(3,1:9));
% x_index = find(x_length == x_coord);
% y_index = find(x_length == y_coord);





for i = 1:9
    
    x_index(i) = find(x_length == init_coord_mat{3,i}(1));
    y_index(i) = find(x_length == init_coord_mat{3,i}(2));

    if(i<6)
    x_marker(i) = marker(i).x;
    y_marker(i) = marker(i).y;
    end
    
end



%% 곡선 산출 Curve_fitting

p = polyfit(x_marker,y_marker,3);
y = p(1)*x_length.^3+p(2)*x_length.^2+p(3)*x_length+p(4);

%% 법선 기울기 
dx = diff(x_length);
dy = diff(y);
slope = - dx./dy;

y_fitted = polyval(p,x_length);

%% 법선 산출, 출력
% current_coord_mat
current_coord_mat = cell(5,9);

axes(handles.axes5);

plot(x_length,y_fitted-p_height/2,'Linewidth',1,'Color','y');
hold on
imshow(data);
plot(x_length,y_fitted-p_height/4,'Linewidth',1,'Color','y');
plot(x_length,y_fitted, 'Linewidth',2.,'Color','y');
plot(x_length,y_fitted+p_height/4,'Linewidth',1,'Color','y');
plot(x_length,y_fitted+p_height/2,'Linewidth',1,'Color','y');



for j = 1 : 9
    
    n_line = (x_length - x_coord(j))*slope(x_index(j))+y(x_index(j));
       
    P.u  = InterX([x_length;n_line],[x_length;y_fitted-p_height/2]);
    P2.u = InterX([x_length;n_line],[x_length;y_fitted-p_height/4]);
    P2.d = InterX([x_length;n_line],[x_length;y_fitted+p_height/4]);
    P.d  = InterX([x_length;n_line],[x_length;y_fitted+p_height/2]);
        
    
    if ( P.u(1,1) <= P.d(1,1))
        max = P.d(1,1);
        min = P.u(1,1);
    else
        max = P.u(1,1);
        min = P.d(1,1);
    end
    
    n_range = min : 1 : max;
    nn_line = (n_range - x_coord(j))*slope(x_index(j))+y(x_index(j));
    plot(n_range,nn_line,'Linewidth',1,'Color','y');
    plot(P.u(1,1),P.u(2,1),'ro',P.d(1,1),P.d(2,1),'ro',P2.u(1,1),P2.u(2,1),'ro',P2.d(1,1),P2.d(2,1),'ro');
    
    current_coord_mat{1,j} = [P.u(1,1)  P.u(2,1)];
    current_coord_mat{2,j} = [P2.u(1,1) P2.u(2,1)];
    current_coord_mat{4,j} = [P2.d(1,1) P2.d(2,1)];
    current_coord_mat{5,j} = [P.d(1,1)  P.d(2,1)];
end

set(handles.axes5,'Ydir','reverse');


for j = 1:5
    current_coord_mat{3,j*2-1} = [marker(j).x marker(j).y];
    if j<5
       current_coord_mat{3,j*2} = [round((marker(j).init_x + marker(j+1).init_x)/2)  polyval(p,round((marker(j).init_x + marker(j+1).init_x)/2))];
    end

end


 



