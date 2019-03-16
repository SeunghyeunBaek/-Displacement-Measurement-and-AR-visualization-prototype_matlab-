global current_coord_mat
global dis_mat
global k
global l

global avg_dis



avg_dis = (dis_mat(k,l) + dis_mat(k,l+1) + dis_mat(k+1,l) + dis_mat(k+1,l+1))/4;

 
 for s = 1:8
     for r = 1:4
     
    x = [cellfun(@(x) x(1), current_coord_mat(r,s)) cellfun(@(x) x(1), current_coord_mat(r,s+1)) cellfun(@(x) x(1), current_coord_mat(r+1,s+1)) cellfun(@(x) x(1), current_coord_mat(r+1,s))];
    y = [cellfun(@(x) x(2), current_coord_mat(r,s)) cellfun(@(x) x(2), current_coord_mat(r,s+1)) cellfun(@(x) x(2), current_coord_mat(r+1,s+1)) cellfun(@(x) x(2), current_coord_mat(r+1,s))];
 
     if avg_dis(r,s) >=30
            patch(x,y,'r');
     elseif avg_dis(r,s)>=25
            patch(x,y,'m');
     elseif avg_dis(r,s)>=20
            patch(x,y,'y');
     elseif avg_dis(r,s)>=10
            patch(x,y,'c');
     else
            patch(x,y,'g');
     end
     
     end
     
 end

 %colorbar;
 
 
% for l = 1:8
%     for k = 1:4
%         avg_dks = (dks_mat(k,l) + dks_mat(k,l+1) + dks_mat(k+1,l) + dks_mat(k+1,l+1))/4;
%         x = [current_coord_mat{k,l}(1) current_coord_mat{k,l+1}(1) current_coord_mat{k+1,l+1}(1) current_coord_mat{k+1,l}(1)];
%         y = [current_coord_mat{k,l}(2) current_coord_mat{k,l+1}(2) current_coord_mat{k+1,l+1}(2) current_coord_mat{k+1,l}(2)];
%         
%         if avg_dks >=30
%             latch(x,y,'r');
%         elseif avg_dks>=25
%             latch(x,y,'m');
%         elseif avg_dks>=20
%             latch(x,y,'y');
%         elseif avg_dks>=10
%             latch(x,y,'c');
%         else
%             latch(x,y,'g');
%         end
%         colorbar
%     end
% end
% hold off
% 
% toc
% 
