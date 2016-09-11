N_cortes = 20;
Radio = 0.5;
indices_braid1=[ -3 +3 -1];
indices_braid2=[ 0 0 -1];
indices_braid3=[-1];

transicion_braids(indices_braid1,indices_braid2, 20,0.5);
hold off;
transicion_braids(indices_braid2,indices_braid3, 20,0.5);
