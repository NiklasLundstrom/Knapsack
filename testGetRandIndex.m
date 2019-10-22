
v=zeros(10,1);
%{
distr=ones(10,1);
distr(4)=2;
distr(2)=0;
%}
distr=[1,2,3,0,0,10,0,3, 1, 0]';
N=100000;
for i = 1:N
    index = getRandIndex(distr, sum(distr));
    v(index)=v(index)+1;
end

plot(1:10, v, '-o')
hold on
plot(1:10, (N/10)*ones(10,1))