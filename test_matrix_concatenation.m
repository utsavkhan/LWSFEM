a = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
b = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];

le = size(a);
le = le(1);

l = size(a);
l = l(1) + l(1)/2;

c = zeros(l);

for i = 1:le
    for j = 1:le
        c(i,j) = c(i,j)+a(i,j);
        c(i+le/2,j+le/2) = c(i+le/2,j+le/2)+b(i,j);
    end
end
