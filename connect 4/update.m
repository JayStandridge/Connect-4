function [ board ] = update( board, move )
move=8-move;
for i=1:6
    if board(7-i,move)==0
        board(7-i,move)=1;
        break
    end
end
end

