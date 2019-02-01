clear all
close all
clc
F=@(t)(2/sqrt(pi))*exp(-t.^2);
figure
ezplot('(2/sqrt(pi))*exp(-t.^2)')
grid on
x=[0.5 1 2 3];
N1=1000;
N2=10000;
e1=[];%composite simpson by N1=1000
e2=[];%composite simpson by N2=10000
format long
for i=1:numel(x);
    h=x(i)/N1;
    H=2*x(i)/N1;
    a=0;
        b=a+H;
        E=[];
    for j=1:N1/2
        
        E(j)=(h/3)*(F(a)+F(b)+4*F((a+b)/2));
        a=b;
        b=a+H;
    end
    e1(i)=sum(E);
end
disp('composite simpson with N=1000 :')
e1

for i=1:numel(x);
    h=x(i)/N2;
    H=2*x(i)/N2;
    a=0;
        b=a+H;
        E=[];
    for j=1:N2/2
        
        E(j)=(h/3)*(F(a)+F(b)+4*F((a+b)/2));
        a=b;
        b=a+H;
    end
    e2(i)=sum(E);
end
disp('composite simpson with N=10000 :')
e2
% now i use erf() function.m and compare it to e1 & e2
disp('erf() function in Matlab : ')
erf=[erf(0.5) erf(1) erf(2) erf(3)]
X=[0:0.1:3];
e3=[];
for i=1:numel(X);
    h=X(i)/N1;
    H=2*X(i)/N1;
    a=0;
        b=a+H;
        E=[];
    for j=1:N1/2
        
        E(j)=(h/3)*(F(a)+F(b)+4*F((a+b)/2));
        a=b;
        b=a+H;
    end
    e3(i)=sum(E);
end
figure
plot(X,e3,'r*--')
title('erf(x)')
grid on
% Total impulse
Time=[0 1 6 11 16 21 26 31 36 41 46 51];
Thrust=[0 7.2330 25.0000 53.4446 77.5804 90.7398 96.4352 98.6660 99.5060 99.8178 99.9330 100];
h1=Time(3)-Time(2);
Impulse=[];
for i=1:10
    Impulse(i)=(h1/2)*(Thrust(i+1)+Thrust(i+2));
end
    h2=Time(2)-Time(1);
    Impulse(numel(Impulse)+1)=(h2/2)*(Thrust(1)+Thrust(2));
    Impulse=sum(Impulse)
    disp('trapz() fuantion in matlab : ')
    % now i use trapz(x,y) function.m and compare it to value of Impulse
    trapz_Impulse=trapz(Time,Thrust)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    