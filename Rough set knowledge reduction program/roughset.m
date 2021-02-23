tic;
a=[ 1,1,1,1,0,0,0,0,1,1,0,1;
    0,0,0,0,0,0,0,0,0,0,0,0;
    1,0,1,0,0,0,0,0,0,1,0,0;
    0,0,0,1,1,1,1,0,1,0,1,1;
    1,0,0,1,1,1,1,1,0,1,1,0;
    0,1,0,1,1,1,1,1,1,0,0,1;
    1,0,0,0,1,1,1,0,0,1,1,1;
    1,1,1,1,0,0,0,0,1,1,0,1;
    1,0,1,1,1,0,0,0,1,1,0,1;
    1,1,1,1,0,0,0,0,1,1,0,1;
    1,0,1,1,1,0,0,0,1,1,0,1;
    1,0,1,1,1,0,0,0,1,1,0,1];
d=[1;0;0;0;0;0;0;1;1;1;1;1];
pos=posCD(a,d);
dismat=dismatrix(a,d,pos);
dism=disbe(dismat);
 tob_id_4294
core=cor(dism);
[red,row]=redu(dism);
time=toc

% 生成未经处理的区分矩阵dismat 
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
              if a(i,k)~=a(j,k
)                 dis(p,k)=1;
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

% 对已经处理过的区分矩阵进行知识约简 
function [red,row]=redu(dism) 
[m,n]=size(dism); 
red=[]; 
row=0; 
if m<=0
     return;
end 
for i=1:n
      if dism(1,i)~=0
         row=row+1;
     end
end
red(1:row,:)=zeros(row,n);
j=1;
for i=1:row
      while dism(1,j)==0
         j=j+1;
      end
      red(i,j)=1;
      j=j+1;
end
temp=[];
tempdis=[];
rowd=0;
rowd1=0;
 for i=2:m
     j=1;
     while j<=row
          temp=uni(dism(i,:),red(j,:));
         [s,n]=size(temp);
         rowd1=rowd+s;
          tempdis(rowd+1:rowd1,:)=temp;
         rowd=rowd1;
         j=j+1;
         temp=[];
   end
   red=[];
   red=disbe(tempdis);
   tempdis=[];
   [row,n]=size(red);
   rowd=0;
   rowd1=0;
end

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
 end  if number==0
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

%对区分矩阵的第i行和red(j,:)运算，即将a中 
%所有的1分别插入到red(j,:)中，待去掉包含关系 
function tempred=uni(disa,red) 
[m,n]=size(red); 
num=0; 
for i=1:n
      if disa(i)~=0
         num=num+1;
     end
 end
  tempred=ones(m*num,n);
  temp=[];
  j=1;
  for i=1:num
      while disa(j)==0
         j=j+1;
     end
      temp=red;
      temp(:,j)=ones(m,1);
      tempred((i-1)*m+1:i*m,:)=temp;
     j=j+1;
 end

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
