function[]=runVsPlayer(strat4,strat42,neuralView)
board=zeros(6,7);
playing=1;
clf
exportAsGif=1;
filename='neuralView.gif';
if neuralView
    subplot(1,2,1)
    dispBoard(board)
    subplot(1,2,2)
    NeuralView( board,strat4(:,:,1),strat42(:,:,1))
else
    dispBoard(board)
end
if exportAsGif
    gif(filename);
end
while playing
    if length(size(strat4))==3
        val=pickaStrat();
        stratA=strat4(:,:,val);
        val=pickaStrat();
        stratA2=strat42(:,:,val);
        board=update(board,raulSux(board,stratA,stratA2));
    else
        board=update(board,raulSux(board,strat4,strat42));
    end
    if neuralView
        subplot(1,2,1)
        dispBoard(board)
        subplot(1,2,2)
        NeuralView( board,strat4(:,:,1),strat42(:,:,1) )
    else
        dispBoard(board)
    end
    pause(0)
    if isWin(board)
        title('RED WINS!')
        break
    end
    if exportAsGif
        gif;
    end
    board=-1*board;
    move=input('move?');
    pause(0)
    clf
    board=update(board,move);
    bool=isWin(board);
    board=-1*board;
    if neuralView
        subplot(1,2,1)
        dispBoard(board)
        subplot(1,2,2)
        NeuralView( board,strat4(:,:,1),strat42(:,:,1) )
    else
        dispBoard(board)
    end
    if bool
        title('YELLOW WINS!')
        break
    end
    if sum(validMoves(board,2))==0
        title('TIE!')
        break
    end
    if exportAsGif
        gif;
    end
end
end
