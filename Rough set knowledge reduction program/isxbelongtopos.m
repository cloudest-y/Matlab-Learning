% �ж�x�Ƿ�������pos�� 
% xΪ����ֵ  
% ����ֵp�����x��pos��p=1����p=0 
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
