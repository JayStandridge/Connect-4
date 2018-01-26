function[val]=run(strat4,strat42,strat5,strat52,dispboard)
board=zeros(6,7);
playing=1;
while playing
    if strat4(1)==1&&strat42(1)==1
        move=teach(board);
    else
        move=raulSux(board,strat4,strat42);
    end
    board=update(board,move);
    if dispboard
        clf
        dispBoard(board);
        pause(1)
    end
    if isWin(board)
        %title('RED WINS!')
        val=1;
        break
    end
    board=-1*board;
    board=update(board,raulSux(board,strat5,strat52));
    bool=isWin(board);
    board=-1*board;
    if dispboard
        clf
        dispBoard(board)
        pause(1)
    end
    if bool
        %title('YELLOW WINS!')
        val=0;
        break
    end
    
    if sum(validMoves(board,2))==0
        %title('TIE!')
        val=.5;
        break
    end
end
end
