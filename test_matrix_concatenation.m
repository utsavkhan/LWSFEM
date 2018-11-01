a = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
b = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
c = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];

le = size(a);
le = le(1);

l = 8;

c = zeros(l);
lol = 1;

% for bbb = 1:3
%     for i = 1:le
%         for j = 1:le
%             if lol == 1
%                 c(i,j) = c(i,j)+a(i,j);
%                 c(i,j)
%             else
%                 c(i+lol,j+lol) = c(i+lol,j+lol)+a(i,j);
%                 c(i+lol,j+lol)
%             end
%         end
%     end
%     lol = 2*bbb;
% end

    for i = 1:le
        for j = 1:le
            c(i,j) = c(i,j)+a(i,j);
        end
    end
    
    for i = 1:6
        for j = 1:6
            c(i+2,j+2) = c(i+2,j+2)+c(i,j);
        end
    end
