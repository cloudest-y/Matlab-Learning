function dism=disbe(dis) 
[m,n]=size(dis); 
p=m; for i=1:m      
if dis(i,1)~=-1
         for j=1:m
               if i~=j & dis(j,1)~=-1
                  if dis(i,:)<=dis(j,:)
                      dis(j,1)=-1;
                      p=p-1;
                   elseif dis(i,:)>=dis(j,:)
                      dis(i,:)=dis(j,:);
                      dis(j,1)=-1;
                      p=p-1;
                  end
               end
                        end
     end
 end
  dism=ones(p,n);
  j=1;
  for i=1:p
      while j<=m & dis(j,1)==-1
         j=j+1;
     end
      dism(i,:)=dis(j,:);
     j=j+1;
 end
