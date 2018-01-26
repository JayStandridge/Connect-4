function [ vector ] = validMoves( board, num )
vector=fliplr(1-abs(board(1,:)));
if num==2
    return
end
for i=1:7
    for j=1:7
        tempBoard=update(-1*update(board,i),j);
        if isWin(tempBoard)
            vector(8-i)=0;
        end
%         for k=1:7
%             for l=1:7
%                 if isWin(update(-1*update(tempBoard,k),l))
%                     vector(8-i)=0;
%                 end
%             end
%         end
    end
end
