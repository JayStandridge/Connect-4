generations=100;
first=1;
humanInTheLoop=0;
population=4;
dispboard=0;
if ~first
    load('strat4.mat')
    load('strat42.mat')
    load('mut.mat')
else
    strat5=.25*(rand(43,25,population)-.5);
    strat52=.25*(rand(26,7,population)-.5);
    mut=.1*ones(population,1);
    clear mutRec
    clear scoRec
end
mutRec(:,1)=mut;
scoRec(:,1)=ones(population/2,1);
for i=1:generations
    score=zeros(population,1);
    for j=1:population
        for k=1:population+humanInTheLoop
            if j==k
                continue
            elseif k==population+1
                v=run(1,1,strat5(:,:,j),strat52(:,:,j),dispboard);
                score(j)=score(j)+5*(1-v);
            else
                v=run(strat5(:,:,j),strat52(:,:,j),strat5(:,:,k),strat52(:,:,k),dispboard);
                score(j)=score(j)+v;
                score(k)=score(k)+1-v;
            end
            
            clc
            disp(i)
            disp(j)
            disp(k)
        end
    end
    while size(strat5,3)>floor(population/2)
        [~,x]=min(score);
        score(x)=[];
            
        strat5(:,:,x)=[];
        strat52(:,:,x)=[];
        mut(x)=[];
    end
    for j=floor(population/2)+1:population
        [strat5(:,:,j),strat52(:,:,j),mut(j)]=mate(strat5(:,:,j-floor(population/2)),strat52(:,:,floor(population/2)),mut(floor(population/2)));
    end
    for j=1:population
        if isnan(strat5(1,1,j))
            strat5(:,:,j)=.25*(rand(43,25,1)-.5);
        end
        if isnan(strat52(1,1,j))
            strat52(:,:,j)=.25*(rand(26,7,1)-.5);
        end
        if isnan(mut(j))
            mut(j)=.1;
        end
    end 
    mutRec(:,size(mutRec,2)+1)=mut;
    scoRec(:,size(scoRec,2)+1)=score;
end
save('strat4.mat','strat4')
save('strat42.mat','strat42')
save('mut.mat','mut')
