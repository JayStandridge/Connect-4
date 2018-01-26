function [ move ] = raulSux( board,strat4,strat42 )
for i=1:7
    if isWin(update(board,i))
        move=i;
        return
    end
end
board=-board;
for i=1:7
    if isWin(update(board,i))
        move=i;
        return
    end
end
board=-1*board;
move=neuralEval(board,strat4,strat42);
end