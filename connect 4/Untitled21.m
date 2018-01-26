times=1;
while times>0
    connect
    times=times+1;
    plot(movmean(mean(mutRec),100))
    pause(.00000001)
end
