% 判断x,y是否在indD中 
% x,y为索引值  
% 返回值p，如果x,y在indD中p=1否则p=0 
function p=isxybelongtoindD(x,y,d) 
if x<=0 | x>size(d) | y<=0 | y>size(d)
     p=-1;
     return;
end
if d(x)==d(y)
     p=1;
else p=0;
end
