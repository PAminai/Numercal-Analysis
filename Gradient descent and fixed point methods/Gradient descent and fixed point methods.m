tic

clear;close all;clc;
%#Gradient discent method
A=[5 -2 3;-3 9 1;2 -1 -7];%Augmented matrix
b=[-1;2;3];% Right hand side matrix
H=@(x)[5*x(1)-2*x(2)+3*x(3)+1;-3*x(1)+9*x(2)+x(3)-2;2*x(1)-x(2)-7*x(3)-3];
J=[5 -2 3;-3 9 1;2 -1 -7];%Jacobian of H(x)
F=@(x) sum(H(x).^2)/2;%our objective function as the norm of H(x)
GF=@(x)J'*H(x);
L=10^(-3);%Gamma value
x=[0;0;0];%initial guess.
eps=10^(-8);
i=1;
f=[];
f(i)=F(x);
p=[x];
t=[i];
while f(i)>eps %==> observation the Stopping criteria
    i=i+1;
    t=[t,i];
    x=x-L*GF(x);
    p=[p,x];
    f(i)=F(x);
end
disp('#Gradient discent method : ')
x
i1=i%final interation value
x1=p(1,:);
x2=p(2,:);
x3=p(3,:);
figure
%subtitle('Gradient discent');
subplot(3,1,1);
plot(t,x1,'r.')
title('x1')
grid on
subplot(3,1,2);
plot(t,x2,'b.')
title('x2')
grid on
subplot(3,1,3);
plot(t,x2,'g.')
title('x3')
grid on
%#Fixed point method
x=[0;0;0];
%followin jacobian method as a type of fixed point method:
X=@(x)[(2*x(2)-3*x(3)-1)/5;(3*x(1)-x(3)+2)/9;(2*x(1)-x(2)-3)/7];
i=1;
p=[x];
t=[i];
while abs(X(x(:,i))-x(:,i))>eps%==> observation the Stopping criteria
i=i+1;
x(:,i)=X(x(:,i-1));
p(:,i)=x(:,i);
t(:,i)=i;
end
disp('#Fixed point method : ')
x=x(:,i)
i2=i%final interation value

disp('#Matlab result : ');
x=A\b

x1=p(1,:);
x2=p(2,:);
x3=p(3,:);
figure
%subtitle('Fixed point');
subplot(3,1,1);
plot(t,x1,'r*--')
title('x1')
grid on
subplot(3,1,2);
plot(t,x2,'b*--')
title('x2')
grid on
subplot(3,1,3);
plot(t,x2,'g*--')
title('x3')
grid on
fprintf('As you see Fixed point method is easier to code and coverges faster !!!')
toc