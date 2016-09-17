clear all;
N_cortes = 20;
Radio = 0.5;
representar = true;
indices_braid = [-1 2 3 2 +1];

es_trivial = dehornoy(indices_braid, representar, N_cortes, Radio);