global count;
global time;
global flag;
global data;

global current_coord_mat;
global dis_mat;

global x_marker;
global y_marker;
global x_index; 
global y_index;
global x_coord;
global y_coord ;
global x_length;
global n_line; 
 
flag = 0;
time = 0;


%% PreAllocation
current_coord_mat = cell(5,9);
for j = 1:9
    for i = 1:5
        current_coord_mat{i,j}(1,1) = 0;
        current_coord_mat{i,j}(1,2) = 0;
    end
end
dis_mat = zeros(5,9);
x_marker = [0 0 0 0 0];
y_marker = [0 0 0 0 0];
x_index = [0 0 0 0 0 0 0 0 0 ];
y_index = [0 0 0 0 0 0 0 0 0 ];
x_coord = [0 0 0 0 0 0 0 0 0 ];
y_coord = [0 0 0 0 0 0 0 0 0 ];
x_length = 1:640;

bb = [0 0 0 0];
bc = [0 0];
data = zeros(480,640,3);
diff_im = zeros(480,640);
bw  = zeros(480,640);

n_line = 1:640;
count = 1;


%% iter per frame
tic
while(1)
  
   
%% 마커 인식 + 좌표
   TrackingMarker



   hold off
%% FEM Model Disp
   
   ShowFEMModel;
   CalDis;
   Color;
   hold off
        
end
 

 


    