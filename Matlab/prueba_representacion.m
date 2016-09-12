N_cortes = 20;
Radio = 0.5;
indices_braid1=[2 -1 -2];
indices_braid2 =[1 -2 1];

%obtengo la trenza inversa de la segunda trenza. 
inversa_braid2 = fliplr(-indices_braid2);
indices_braid = [indices_braid1,inversa_braid2];
 
disp('Para ver si las trenzas dadas son equivalentes, tendremos que ver si la trenza');
seg = strcat(num2str(indices_braid),' es equivalente a la trenza trivial.');
disp(seg); disp(char(10));
es_trivial =  dehornoy(indices_braid,true, N_cortes, Radio);