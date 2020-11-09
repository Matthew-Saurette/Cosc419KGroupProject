% Place to check vector calculations before pushing into main

clc;
clear all;
Y = [0 0 0; 1 0 0; 0 1 0; 0 0 1];
x_c = (1/rank(Y))*sum(Y(1:rank(Y),:));

Y(rank(Y) + 1,:);
x_r = x_c + (x_c - Y(rank(Y) + 1, :));
y = [5,4,3,2,1;
    5,4,3,2,1]
x = [2,1,4,3,5]
sortSimplex(y,x,"shrink")

% Question 1a)
Y0a = [1 1 0 0;
       1 0 1 0;
       1 0 0 1];
Y0a = 2.*Y0a(:,1) - Y0a
 

