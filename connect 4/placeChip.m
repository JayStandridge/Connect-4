function handles = placeChip(handles, index)
%PLACECHIP Summary of this function goes here
%   Detailed explanation goes here

if(index >= 1 && index <= 8) %Important for mouseclick position, not so for keypressfunc.
    index = floor(index);
else 
    handles.failed = 1;
    return;
end

%Checking which row on the index-column is already occupied
for i = 1:6
    if handles.gameBoard(i,index) == 0
        handles.gameBoard(i,index) = handles.user;
        if handles.user == 1
           handles.gObjects((index-1)*7+i) = rectangle('Position',[index i 1 1],...
               'HitTest','off', 'FaceColor','y','Curvature',1); 
        else
           handles.gObjects((index-1)*7+i) = rectangle('Position',[index i 1 1],...
               'HitTest','off', 'FaceColor','r','Curvature',1);
        end
    break;
    end
end
%disp(handles.gameBoard);
end

