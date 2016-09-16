clear all;
N_cortes = 20;
Radio = 0.5;
indices_braid1 = [-2 +2 -1 +1];
indices_braid2 = [0 0 -1 +1];

dehornoy(indices_braid1,true, N_cortes, Radio);
