%% %%%%  example %%%%%%%%%
 clear
 clc
%% t
t=[1:100000]./1200;
%% input £¨8£©
I(:,1)=sin(t);
I(:,2)=sin(1/2*t+60);
I(:,3)=sawtooth(2*t+60);
I(:,4)=sin(1/2*t+20);
I(:,5)=sawtooth(1/4*t+100);
I(:,6)=sin(2*t+20);
I(:,7)=sin(3*t+34);
I(:,8)=sin(1/9*t+25);

%% output £¨5£©
S(:,1)=I(:,1)-2*I(:,3)+4*I(:,4).^2-I(:,5).*I(:,4)+8*I(:,6).^2-I(:,7).*I(:,4);
S(:,2)=(I(:,2)+7*I(:,7).*I(:,4)-1*I(:,4)-I(:,5).^2+9*I(:,6)+7*I(:,7)).^2;
S(:,3)=I(:,1)+2*I(:,3).*I(:,4)+1*I(:,4)+I(:,5)+8*I(:,6)+2*I(:,7);
S(:,4)=I(:,1).^2+I(:,2)+I(:,3)+I(:,4).^3+I(:,5)+I(:,6)+I(:,7)+I(:,8).*I(:,4);
S(:,5)=-I(:,1)-I(:,2).^6+I(:,3)+I(:,4)+I(:,5)-I(:,6)+I(:,7)-I(:,8).*I(:,4);

X=I';
Y=S';
% 
for i=1:size(X,1)
X(i,:)=mapminmax(X(i,:),-1,1);
end
for i=1:size(Y,1)
Y(i,:)=mapminmax(Y(i,:),-1,1);
end


%%  train
m=100;
c=100000;
nl=5;% number of layers
net=TLCnet(X,Y,nl,m,c);%training net

plot(net{3});

%%  test
Y_pre=test_TLCnet(net,X);%test net

for i=1:5
    figure
    plot(Y(i,:));
    hold on;
    plot(Y_pre(i,:));
end






