function [ move ] = neuralEval( board, strat4, strat42 )
temp=board;
board2(:,1)=board(:)';
board2(43)=1;
hidden=board2'*strat4;
hidden(hidden<0)=0;
hidden(26)=1;
output=(hidden*strat42).*validMoves(temp,1);
output(output<0)=0;
[~,move]=max(output);
if sum(output)==0
    [~,move]=max(validMoves(temp,2));
end
end