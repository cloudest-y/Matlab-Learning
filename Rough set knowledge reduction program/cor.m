% 对已经处理过的区分矩阵求核 
function core=cor(dism) 
[m,n]=size(dism); 
core1=zeros(1,n); 
number=0; 
for i=1:m
      num=0;p=0;
     for j=1:n
          if dism(i,j)~=0
             num=num+1;
             p=j;
         end
     end
      if num==1
         core1(p)=1;
          number=number+1;
     end
 end  
     if number==0
     core=0;
 else
      core=zeros(1,number);
     j=1;
      for i=1:number
         while core1(j)==0
             j=j+1; 
        end
          core(i)=core1(j);
         j=j+1;
     end
 end
