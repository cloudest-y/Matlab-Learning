%�����־���ĵ�i�к�result(j,:)���㣬����a�� 
%���е�1�ֱ���뵽result(j,:)�У���ȥ��������ϵ 
function tempresult=uni(disa,result) 
[m,n]=size(result); 
num=0; 
for i=1:n
      if disa(i)~=0
         num=num+1;
     end
 end
  tempresult=ones(m*num,n);
  temp=[];
  j=1;
  for i=1:num
      while disa(j)==0
         j=j+1;
     end
      temp=result;
      temp(:,j)=ones(m,1);
      tempresult((i-1)*m+1:i*m,:)=temp;
     j=j+1;
 end
