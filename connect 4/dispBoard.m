function [  ] = dispBoard( board )
hold on
axis([.5 7.5 0 6.5])
axis square
for i=1:6
    for j=1:7
        if board(i,j)==1
            scatter(8-j,7-i,500,'r','filled')
        end
        if board(i,j)==-1
            scatter(8-j,7-i,500,'y','filled')
        end
    end
end
grid on
hold off
end

