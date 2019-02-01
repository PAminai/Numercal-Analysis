tic
clear;clc
disp('*part a : ')
a=[.003 59.14 59.17;5.291 -6.13 46.78];
size=size(a); 
n=size(1);%The number of rows in the matrix ( number of Equations )
A=a;
m=size(2);
A(:,m)=[];
b=a(:,m);
R=A\b;
fprintf('MATLAB Result : ');
R %exact solution
%elimination process
for i=1:n-1
    for j = i+1:n
        if abs(a(j,i))>abs(a(i,i))
            tmp=a(i,:);
            a(i,:)=a(j,:);
            a(j,:)=tmp;        
        end
    end
end
%creating triangle matrix :
for i=1:n-1
    for j=i+1:n
        a(j,:)=a(j,:)-(a(j,i)/a(i,i))*a(i,:);
    end
end
disp('triangle matrix : ')
disp(a)
%backward substitution
x=[];
x(n)=a(n,n+1)/a(n,n);
for i=n:-1:1
    H=[];
    for j=n:-1:i+1
        H=[H a(i,j)*x(j)];
    end
    H=sum(H);
    x(i)=(a(i,n+1)-H)/a(i,i);
end
fprintf('My Result : ')
x
clear;
disp('*part b : ')
a=[1 2 0 3 4;2 1 -1 1 1;3 -1 -1 2 -3;-1 2 3 -1 4];
size=size(a);
n=size(1);%The number of rows in the matrix ( number of Equations )
A=a;
m=size(2);%number of Columns
A(:,m)=[];
b=a(:,m);
R=A\b;
fprintf('MATLAB Result : ');
R %exact solution
%elimination process
for i=1:n-1
    for j = i+1:n
        if abs(a(j,i))>abs(a(i,i))
            tmp=a(i,:);
            a(i,:)=a(j,:);
            a(j,:)=tmp;       
        end
    end
end
%creating triangle matrix :
for i=1:n-1
    for j=i+1:n
        a(j,:)=a(j,:)-(a(j,i)/a(i,i))*a(i,:);
    end
end
disp('triangle matrix : ')
disp(a)
%backward substitution
x=[];
x(n)=a(n,n+1)/a(n,n);
for i=n:-1:1
    H=[];
    for j=n:-1:i+1
        H=[H a(i,j)*x(j)];
    end
    H=sum(H);
    x(i)=(a(i,n+1)-H)/a(i,i);
end
fprintf('My Result : ')
x
clear;
disp('*part c : ')
a=gallery('orthog',40);%Creating linear systems
a(40,:)=[];
size=size(a);
n=size(1);%The number of rows in the matrix ( number of Equations )
A=a;
m=size(2);%number of Columns
A(:,m)=[];
b=a(:,m);%computing the right-hand side column
R=A\b;
fprintf('MATLAB Result : ');
R %exact solution
%elimination process :
for i=1:n-1
    for j = i+1:n
        if abs(a(j,i))>abs(a(i,i))
            tmp=a(i,:);
            a(i,:)=a(j,:);
            a(j,:)=tmp;       
        end
    end
end
%creating triangle matrix :
for i=1:n-1
    for j=i+1:n
        a(j,:)=a(j,:)-(a(j,i)/a(i,i))*a(i,:);
    end
end
%backward substitution
x=[];
x(n)=a(n,n+1)/a(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+a(i,j)*x(j);
    end
    x(i)=(a(i,n+1)-sum)/a(i,i);
end
disp('My result : ')
x

toc



































