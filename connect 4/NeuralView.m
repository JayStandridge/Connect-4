function [  ] = NeuralView( board,strat4,strat42 )
temp=board;
hold on
axis([-.25 2.25 0 43])
board2(:,1)=board(:)';
count=1;
for i=1:42
    scatter(0,i,35,'k','filled');
    if board(i)==1
        scatter(0,i,30,'r','filled');
        for j=1:25
            if (strat4(i,j))>2.5
                line([0,1],[i,j+8],'color','r')
            end
        end
    elseif board(i)==-1
        scatter(0,i,30,'y','filled');
        for j=1:25
            if (strat4(i,j))>2.5
                line([0,1],[i,j+8],'color','y')
            end
        end
    else
        scatter(0,i,30,'w','filled');
    end
    
end

board2(43)=1;
hidden=board2'*strat4;
hidden(hidden<0)=0;
hidden=hidden/max(hidden);
for i=1:25
    scatter(1,i+8,35,'k','filled');
    scatter(1,i+8,30,[1-hidden(i) 1-hidden(i) 1-hidden(i)],'filled');
    for j=1:7
        if (strat42(i,j))>3
            line([1,2],[i+8,j+17],'color',[1-hidden(i) 1-hidden(i) 1-hidden(i)])
        end
    end
end
hidden(26)=1;
output=(hidden*strat42).*validMoves(temp,1);
output(output<0)=0;
output=output/max(output);
for i=1:7
    scatter(2,i+17,35,'k','filled');
    scatter(2,i+17,30,'w','filled');
    scatter(2,i+17,30,[1-output(i) 1-output(i) 1-output(i)],'filled');
end
%scatter(2,neuralEval( board, strat4, strat42 )+17,'g','filled');
end

