clear;
clc;
sup=3;
tran=[1 1 1 0 1;0 1 0 1 1;1 0 1 0 0;1 1 1 1 1;0 1 0 0 1;0 0 1 1 1;0 0 1 0 1;0 1 1 1 1;1 1 1 1 0];
[m1,n1]=size(tran);

%Ѱ��һ�
co1=(1:n1)'
count_sup=sum(tran,1);
temp=find(count_sup>=sup);          %���֧�ֶȴ��ڵ�����С֧�ֶȣ�temp����Ĵ�����ϱ�׼������
co1=co1(temp);                      %ʹ��col����ֵ��temp��Ӧ
count_co1_sup=count_sup(temp)';     %��count_sup��ɸѡ���ϵ����ݣ���tempΪɸѡ��׼
L1=[co1 count_co1_sup]              %���һ����ֵ��������x=[...]

%�������
% i=0; j=0 ��ǰ��ĸ�ֵ����
i=0;
j=0;

co2=nchoosek(co1,2)         %������ѡ��
[m2,n2]=size(co2);          %���Һ�ѡ���֧�ֶ�
count_co2_sup=zeros(m2,1);
for i=1:m2
      for j=1:m1
      
          if (tran(j,co2(i,1))==1)&& (tran(j,co2(i,2))==1)  %tran(m,n)��ʾtran����ĵ�m�е�n�е�Ԫ��
                                                            %tran[m,n]��ʾtran���m��n�еľ���
              count_co2_sup(i)=count_co2_sup(i)+1           %����֧�ֶ�
          end
       j=j+1;
      end
    m2=m2+1;
end

temp=find(count_co2_sup>=sup);   %�Զ��������֦
co2=co2(temp,:);                 %��ð����Ϊ�˱�֤ÿ�ж���temp��Ӧ������Ѱ��ÿ�����е�������
count_co2_sup=count_co2_sup(temp,:);
L2=[co2 count_co2_sup]

%%Ѱ�����
A=[co2(:,1)' co2(:,2)']
[mA nA]=size(A)
B(1)=A(1);
k=2;
for i=2:nA
      if (A(i)~= B(1:end))     % ��~=����ʾ�������ڡ�����A�е�i��Ԫ����B�����е�Ԫ�ض������
      B(k)=A(i);
      k=k+1;
     end
        i=i+1;
end                    %�ó�B=[1,2,3,5,4],�ֱ��ӦA(1)��A(4)��A(8)��A(9)��A(11)
 co3=nchoosek(B,3);    %������ѡ��,Ƶ�������Ӽ�Ӧ��Ҳ��Ƶ�����������֦
 [m3,n3]=size(co3);    %���Һ�ѡ���֧�ֶ�
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
temp=find(count_co3_sup>=sup);   %�����������֦
co3=co3(temp,:)
count_co3_sup=count_co3_sup(temp,:);
L3=[co3 count_co3_sup]