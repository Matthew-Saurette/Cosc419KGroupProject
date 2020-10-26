%Main mfile to run everything / what we need%
clear;
clc;

f = 5;   %this still needs to be made

% Question 1a)
Y0a = [0 1 0 0;
       0 0 1 0;
       0 0 0 1];
del_e_s = 2;            %_s stands for standard parameters
del_oc_s = 1/2;
del_ic_s = -1/2;
gamma_s = 1/2;

[Yka, f, fevalsa] = nelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, f);

% Question 1b)
Y0b = Y0a + (9/5)*ones(3,4);   %translate Y0a by 9/5
%standard parameters as above
[Ykb, f, fevalsb] = nelderMead(Y0b, del_e_s, del_oc_s, del_ic_s, gamma_s, f);

% Question 1c)
del_e_n = 2;            %_n stands for new parameters - these are the ones we propose
del_oc_n = 1/2;
del_ic_n = -1/2;
gamma_n = 1/2;

[Ykc_s, f, fevalsc_s] = nelderMead(Y0a, del_e_n, del_oc_n, del_ic_n, gamma_n, f);
[Ykc_n, f, fevalsc_n] = nelderMead(Y0b, del_e_n, del_oc_n, del_ic_n, gamma_n, f);

% Question 1d)

%convergence plots go here


