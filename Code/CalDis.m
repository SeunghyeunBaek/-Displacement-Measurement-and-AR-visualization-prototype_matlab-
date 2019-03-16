global current_coord_mat
global init_coord_mat
global dis_mat
global Ratio

%% 현재좌표 - 나중좌표 실제 거리 계산
for j = 1:9
    for i = 1:5
        dis_mat(i,j) = Ratio*(sqrt((current_coord_mat{i,j}(1,1) - init_coord_mat{i,j}(1,1))^2 + (current_coord_mat{i,j}(1,2) - init_coord_mat{i,j}(1,2))^2));
    end
end
