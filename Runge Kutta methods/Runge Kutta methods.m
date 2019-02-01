tic
%1)Pendulum :
clc;clear;close all
L=10;
g=-9.8;
x=@(W) L*sin(W/L);
y=@(W) -L*cos(W/L);
h=.01;
w1=[7];
w2=[0];
X=[10*sin(0.7)];%initial value of x
Y=[-10*cos(0.7)];% initial value of y
t=[0];
for i=1:1000%Applying Runge_kutta 4th order system of eq .
        t=[t,i*h];
        k11=h*w2(i);
        k12=h*(-g*(w1(i)/L));
        k21=h*(w2(i)+k12/2);
        k22=h*(-g*(w1(i)+k11/2))/L;
        k31=h*(w2(i)+k22/2);
        k32=h*(-g*(w1(i)+k21/2))/L;
        k41=h*(w2(i)+k32);
        k42=h*(-g*(w1(i)+k31))/L;
        w1=[w1,w1(i)+(k11+2*k21+2*k31+k41)/6];% values of S(t) from t=0 to t=10 seconds
        w2=[w2,w2(i)+(k12+2*k22+2*k32+k42)/6];
        X=[X,x(w1(i))];
        Y=[Y,y(w1(i))];
end
%the position of the pendulum at t=10(s)
disp('pendulum : ')
fprintf('s(10) = ');disp(w1(1001))
fprintf('x(10) = ');disp(x(w1(1001)))
fprintf('y(10) = ');disp(y(w1(1001)));fprintf('\n\n\n')
figure
plot(t,w1)
xlabel('Time')
ylabel('S')
title('1)pendulum              S(t)')
grid on
figure
plot(t,X,'r')
xlabel('Time')
ylabel('X')
title('1)pendulum              X(t)')
grid on
figure
plot(t,Y,'b')
xlabel('Time')
ylabel('Y')
title('1)pendulum              Y(t)')
grid on
%2) Rocket:
disp('Rocket : ')
f=@(v)90.2-1.81125*(10^(-4))*v^(2);% my differential Eq
h=.01;
t=[0];
w=[0];%initial value of velocity
for i=1:1000 % Applying Runge_Kutta order four with h= 0.01
    t=[t,i*h];
    k1=h*f(w(i));
    k2=h*f(w(i)+k1/2);
    k3=h*f(w(i)+k2/2);
    k4=h*f(w(i)+k3);
    w=[w,w(i)+(k1+2*k2+2*k3+k4)/6];
end
w(1001);
fprintf('Final Velocity : ')
disp(w(1001))
B=min(t(find(w>343.2)));%Time which the rocket break the sound barrier
fprintf('Time which the rocket break the sound barrier : ')
disp(min(t(find(w>343.2))))
A=min(w(find(w>343.2)));
x=t;
y=w;
figure
plot(x,y,'r')
grid on
xlabel('Time')
ylabel('Velocity')
title('2)Rocket              velocity versus time for the rocket')
hold on
plot(B,A,'b*')
legend('velocity','break the sound barrier') 
toc
