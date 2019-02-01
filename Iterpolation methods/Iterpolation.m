T=[1 6 11 16 21 26 31 36 41 46];%time values
Th=[7.2330 25.0000 53.4446 77.5804 90.7398 96.4352 98.6660 99.5060 99.8178 99.9330];%Thrust values
for j=1:numel(T)-1
        if T(j)<=18 && T(j+1)>=18
              break;
        end
end
P=[];%1st,2nd,3rd,4th,...,9th degree polynomials for Time=18 .
%we divide time values in two section . 
% the first section is T(1)to T(j) that we found j in previous loop . 
for i=1:j
    p1=[];
    X=T(j+1:-1:j-i+1);
    Y=Th(j+1:-1:j-i+1);
     if i==2
        figure
         plot(X,Y,'b*-')% second degree polynomial in a single plot
         hold on
         plot(T,Th,'ro:')
        grid on
        xlabel('Time')
        ylabel('Thrust')
        title('orginal data point')
     end
   
    for z=1:i+1
    L=(18-X(find(X~=(X(z)))))./(X(z)-X(find(X~=(X(z)))));%lagrange interpolation polynomial calculation. 
    a=prod(L)*Y(z);
    p1=[p1,a];
    end
    p1=sum(p1);
    P=[P,p1];

end
 %second secton loop contains T(j) to T(9) .
for i=j+1:numel(T)-1
    p2=[];
    X=T(j+i-3:-1:1);
    Y=Th(j+i-3:-1:1);
    for z=1:i+1
    L=(18-X(find(X~=(X(z)))))./(X(z)-X(find(X~=(X(z)))));
    a=prod(L)*Y(z);
    p2=[p2,a];
    end
    p2=sum(p2);
    P=[P,p2];
end
P %interpolation lagrange plynomial  which contains 1st degree to 9th for time=18. 
thrust=88
X=T(3:5);
Y=Th(3:5);
syms t
f(t)=((t-X(2))*(t-X(3)))/((X(1)-X(2))*(X(1)-X(3)))*Y(1)+((t-X(1))*(t-X(3)))/((X(2)-X(1))*(X(2)-X(3)))*Y(2)+((t-X(1))*(t-X(2)))/((X(3)-X(1))*(X(3)-X(2)))*Y(3)-thrust;
%now we should find root of f by newton's method
e=0.00001;%initial guess.
df=diff(f);
c=18;
s=c-double(f(c))/double(df(c));
while sqrt(s-c)>e
    c=s;
    s=c-double(f(c))/double(df(c));
end
F=@(t)((t-X(2))*(t-X(3)))/((X(1)-X(2))*(X(1)-X(3)))*Y(1)+((t-X(1))*(t-X(3)))/((X(2)-X(1))*(X(2)-X(3)))*Y(2)+((t-X(1))*(t-X(2)))/((X(3)-X(1))*(X(3)-X(2)))*Y(3)-thrust;
time=s%time which thrust=88
CheckResult=fzero(F,11)
plot(c,88,'k*')
legend('2nd degree ploynomial', 'data point','point which thrust=88')

    

    
    
        
        
        
        
            
    