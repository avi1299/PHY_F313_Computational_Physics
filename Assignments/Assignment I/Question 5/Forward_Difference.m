function FD = Forward_Difference(x,y)
%FORWARD_DIFFERENCE Returns row of forward differences
FD=zeros(size(x,1));
for i=1:size(x,1)
    FD(i,1)=y(i);
end
column=0;
for j=2:size(x,1)
    column=j;
    for i=1:size(x,1)-j+1
        FD(i,j)=FD(i+1,j-1)-FD(i,j-1);
    end
    j=column;
end
FD
FD=FD(1,:);
end

