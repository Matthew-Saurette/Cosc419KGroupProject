clc;
clear all;

Y = [0 0 0; 1 0 0; 0 1 0; 0 0 1];
x_c = (1/rank(Y))*sum(Y(1:rank(Y),:))

Y(rank(Y) + 1,:)
x_r = x_c + (x_c - Y(rank(Y) + 1, :))
f_r = 