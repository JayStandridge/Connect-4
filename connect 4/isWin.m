function [ bool ] = isWin( board )
bool=0;
board(board<=0)=0;
for i=1:6
    if sum(board(i,1:4))==4
        bool=1;
        return
    elseif sum(board(i,2:5))==4
        bool=1;
        return
    elseif sum(board(i,3:6))==4
        bool=1;
        return
    elseif sum(board(i,4:7))==4
        bool=1;
        return
    end
end
for i=1:7
    if sum(board(1:4,i))==4
        bool=1;
        return
    elseif sum(board(2:5,i))==4
        bool=1;
        return
    elseif sum(board(3:6,i))==4
        bool=1;
        return
    end
end        
for i=1:3
    for j=1:4
        if board(i,j)&&board(i+1,j+1)&&board(i+2,j+2)&&board(i+3,j+3)
            bool=1;
            return
        end
    end
end
for i=1:3
    for j=4:7
        if board(i,j)&&board(i+1,j-1)&&board(i+2,j-2)&&board(i+3,j-3)
            bool=1;
            return
        end
    end
end
end