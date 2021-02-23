% 对已经处理过的区分矩阵进行知识约简 
function [result,row]=redu(dism) 
[m,n]=size(dism); 
result=[]; 
row=0; 
if m<=0
     return;
end 
for i=1:n
      if dism(1,i)~=0
         row=row+1;
     end
 end
  result(1:row,:)=zeros(row,n);
 j=1;
 for i=1:row
      while dism(1,j)==0
         j=j+1;
      end
      result(i,j)=1;
      j=j+1;
 end
temp=[];
tempdis=[];
rowd=0;
rowd1=0;
 for i=2:m
     j=1;
     while j<=row
          temp=uni(dism(i,:),result(j,:));
         [s,n]=size(temp);
         rowd1=rowd+s;
          tempdis(rowd+1:rowd1,:)=temp;
         rowd=rowd1;
         j=j+1;
         temp=[];
   end
   result=[];
   result=disbe(tempdis);
   tempdis=[];
   [row,n]=size(result);
   rowd=0;
   rowd1=0;
end
