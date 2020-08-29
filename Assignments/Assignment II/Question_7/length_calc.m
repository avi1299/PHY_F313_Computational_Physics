function length = length_calc(x,y)
n = numel(x);
length = 0.0;
for i = 1:n-1
  length = length + sqrt( (x(i+1)-x(i))^2 + (y(i+1)-y(i))^2 );
end
end

