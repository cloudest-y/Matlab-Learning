% �ж�x,y�Ƿ���indD�� 
% x,yΪ����ֵ  
% ����ֵp�����x,y��indD��p=1����p=0 
function p=isxybelongtoindD(x,y,d) 
if x<=0 | x>size(d) | y<=0 | y>size(d)
     p=-1;
     return;
end
if d(x)==d(y)
     p=1;
else p=0;
end
