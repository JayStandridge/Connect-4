function [ strat5, strat52, mut2 ] = mate( strat4,strat42, mut )
strat5=strat4+normrnd(0,mut,43,25);
strat52=strat42+normrnd(0,mut,26,7);
mut2=tanh(mut+normrnd(0,mut/2));
end