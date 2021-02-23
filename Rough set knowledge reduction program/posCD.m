% a为条件属性矩阵，d为决策属性向量 
% pos为正域,保存条件属性矩阵的索引值 
function pos=posCD(a,d) 
[m,n]=size(a); 
p=m; 
index=0;
for i=1:m
      if a(i,1)~=-1
         for j=i+1:m
              if a(j,1)~=-1 &(a(i,:)==a(j,:)&d(i)~=d(j))
                 a(j,1)=-1;p=p-1;index=1;
             end 

        end
          if index==1
              a(i,1)=-1;p=p-1;index=0;
         end
     end
 end
  pos=zeros(p,1);
 i=1;
  for r=1:p
      while a(i,1)==-1&i<=m
         i=i+1;
     end
     pos(r)=i;
     r=r+1;
     i=i+1;
 end
