function dismat=dismatrix(a,d,pos) 
[m,n]=size(a); 
p=1;  
index1=0;
index2=0;
index=0; 
dis=-1*ones(m*(m-1)/2,n); 
for i=1:m 
    for j=i+1:m 
         if (isxbelongtopos(i,pos)&~isxbelongtopos(j,pos))...
                 |(~isxbelongtopos(i,pos)&isxbelongtopos(j,pos))...
                  |(isxbelongtopos(i,pos)&isxbelongtopos(j,pos)&~isxybelongtoindD(i,j,d))
             index2=1;
         end
          if index2==0
             continue;
         end
          for k=1:n
              if a(i,k)~=a(j,k)
                 dis(p,k)=1;
                 index1=1;
             else dis(p,k)=0;
             end
         end
          if index1==1
              p=p+1;index=1;
         end
          index1=0;
         index2=0;
     end
 end
  if p<=m*(m-1)/2
      if index==0         
	dismat=[];
         return;
     end
      if dis(p,1)==-1
         p=p-1;
     end
  else p=m*(m-1)/2;
 end 
dismat=dis(1:p,:);