clear;
clc;
sup=3;
tran=[1 1 1 0 1;0 1 0 1 1;1 0 1 0 0;1 1 1 1 1;0 1 0 0 1;0 0 1 1 1;0 0 1 0 1;0 1 1 1 1;1 1 1 1 0];
[m1,n1]=size(tran);

%寻找一项集
co1=(1:n1)'
count_sup=sum(tran,1);
temp=find(count_sup>=sup);          %项集的支持度大于等于最小支持度；temp输出的代表符合标准的列数
co1=co1(temp);                      %使得col的数值与temp对应
count_co1_sup=count_sup(temp)';     %从count_sup中筛选符合的数据，以temp为筛选标准
L1=[co1 count_co1_sup]              %输出一个数值用中括号x=[...]

%产生二项集
% i=0; j=0 对前面的赋值清零
i=0;
j=0;

co2=nchoosek(co1,2)         %产生候选项
[m2,n2]=size(co2);          %查找候选项的支持度
count_co2_sup=zeros(m2,1);
for i=1:m2
      for j=1:m1
      
          if (tran(j,co2(i,1))==1)&& (tran(j,co2(i,2))==1)  %tran(m,n)表示tran矩阵的第m行第n列的元素
                                                            %tran[m,n]表示tran这个m行n列的矩阵
              count_co2_sup(i)=count_co2_sup(i)+1           %计算支持度
          end
       j=j+1;
      end
    m2=m2+1;
end

temp=find(count_co2_sup>=sup);   %对二项集进行修枝
co2=co2(temp,:);                 %加冒号是为了保证每列都与temp对应；，：寻找每行所有的列向量
count_co2_sup=count_co2_sup(temp,:);
L2=[co2 count_co2_sup]

%%寻找三项集
A=[co2(:,1)' co2(:,2)']
[mA nA]=size(A)
B(1)=A(1);
k=2;
for i=2:nA
      if (A(i)~= B(1:end))     % “~=”表示“不等于”，即A中第i个元素与B中所有的元素都不相等
      B(k)=A(i);
      k=k+1;
     end
        i=i+1;
end                    %得出B=[1,2,3,5,4],分别对应A(1)、A(4)、A(8)、A(9)、A(11)
 co3=nchoosek(B,3);    %产生候选项,频繁集的子集应该也是频繁集对三项集修枝
 [m3,n3]=size(co3);    %查找候选项的支持度
count_co3_sup=zeros(m3,1);
for i=1:m3
     for j=1:m1
         if (tran(j,co3(i,1))==1)&& (tran(j,co3(i,2))==1)&&(tran(j,co3(i,3))==1)
             count_co3_sup(i)=count_co3_sup(i)+1;
          end
      j=j+1;
     end
   m3=m3+1;
end
temp=find(count_co3_sup>=sup);   %对三项集进行修枝
co3=co3(temp,:)
count_co3_sup=count_co3_sup(temp,:);
L3=[co3 count_co3_sup]