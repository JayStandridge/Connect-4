function [handles] = checkWin(handles)
%CHECKWIN Summary of this function goes here
%   Detailed explanation goes here


%First let's check row by row
for row = 1:6
    counter = 0;
    for column = 1:7
        if(handles.gameBoard(row, column) == handles.user)   %
            counter = counter + 1;
            if(counter == 4)
                handles.gameOver = 1;
                return;
            end
        else
            counter = 0;
        end
    end
end

%Check column by column
for column = 1:7
    counter = 0;
    for row = 1:6
        if(handles.gameBoard(row,column) == handles.user)
            counter = counter + 1;
            if(counter == 4)
                handles.gameOver = 1;
                return;
            end
        else
            counter = 0;
        end
    end
end

%Diagonals
for row = 1:6
    column = 1;
    counter = 0;
    for rowI = row:6
        if(handles.gameBoard(rowI,column) == handles.user)
            counter = counter + 1;
            if(counter == 4)
                handles.gameOver = 1;
                return;
            end
        else
            counter = 0;
        end
        if column < 7
            column = column + 1;
        else break;
        end
    end
end

for row = 6:-1:1
    column = 1;
    counter = 0;
    for rowI = row:-1:1
        if(handles.gameBoard(rowI,column) == handles.user)
            counter = counter + 1;
            if(counter == 4)
                handles.gameOver = 1;
                return;
            end
        else
            counter = 0;
        end
        if column < 7
            column = column + 1;
        else break;
        end
    end
end

for column = 1:7
    row = 1;
    counter = 0;
    for columnI = column:7
       if(handles.gameBoard(row,columnI) == handles.user)
            counter = counter + 1;
            if(counter == 4)
                handles.gameOver = 1;
                return;
            end
        else
            counter = 0;
        end
        if row < 6
            row = row + 1;
        else break;
        end
    end
end   

for column = 1:7
    row = 6;
    counter = 0;
    for columnI = column:7
       if(handles.gameBoard(row,columnI) == handles.user)
            counter = counter + 1;
            if(counter == 4)
                handles.gameOver = 1;
                return;
            end
        else
            counter = 0;
        end
        if row > 1
            row = row - 1;
        else break;
        end
    end
end 
