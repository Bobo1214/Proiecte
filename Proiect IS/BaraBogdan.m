load('proj_fit_28.mat')
x1=id.X{1};
x2=id.X{2};
y=id.Y;
for m=1:6

N1=length(x1);
N2=length(x2);

PHI=[];
for i=1:N1
    for j=1:N2
        z1=[];
        for f=1:m
            for b=1:m
                z=(x1(i).^(f-1))*(x2(j).^(b-1));
                z1=[z1 z];
            end
        end
        PHI=[PHI;z1];
    end
end

Y=y(:);
Teta=PHI\Y;
Y1=PHI*Teta;
Y2=reshape(Y1,[41,41]);


a=0;
for  s=1:(N1*N2)
a=a+(y(s)-Y2(s)).^2;
end
a1(m)=(1/(N1*N2))*a;
c=round(a1(m),4);


x3=val.X{1};
x4=val.X{2};
y2=val.Y;

N3=length(x3);
N4=length(x4);
PHI1=[];
for i=1:N3
    for j=1:N4
        z3=[];
        for f1=1:m
            for b1=1:m
                z2=(x3(i).^(f1-1))*(x4(j).^(b1-1));
                z3=[z3 z2];
            end
        end
        PHI1=[PHI1;z3];
end
end

Y3=PHI1*Teta;
Y4=reshape(Y3,[31,31]);

a2=0;
for  s1=1:(N3*N4)
a2=a2+(y2(s1)-Y4(s1)).^2;
end
a3(m)=(1/(N3*N4))*a2;
c1=round(a3(m),4);

end


figure(2);
mesh(x3,x4,y2);
hold on;
mesh(x3,x4,Y4);


%%
figure(1);
plot(a1);
title("MSE= " + c);
hold on;
plot(a3);
title("MSE= " + c1);
