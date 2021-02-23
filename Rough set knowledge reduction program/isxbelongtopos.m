% 判断x是否在正域pos中 
% x为索引值  
% 返回值p，如果x在pos中p=1否则p=0 
function p=isxbelongtopos(x,pos) 
[m,n]=size(pos); 
p=0; 
if x<=0
     p=-1;
     return;
 end
  for i=1:m
     if x==pos(i)
         p=1; 
         break;
     end
 end
