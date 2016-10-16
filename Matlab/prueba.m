% clear all;
% a=trenza_cerrada([2 3]);
% explicacion=true;
% equi = es_trivial(a,explicacion);
% contador=0;
% 
% while(contador<5 && equi==2)
%     disp(contador);
%     if(contador~=0)
%         asignar_trenza(a,a3);
%     end
%     Veo si es trivial o no la trenza tras aplicar dehornoy
%     if(equi==2)
%       [e, final] = dehornoy(a,20,0.5,false);
%       a1 = trenza_cerrada(final);
%       equi = es_trivial(a1,explicacion);
%     end
% 
%     Aplico movimiento 2 de Markov tantas veces como sea posible
%     if(equi==2)
%        disp('Hago MV2');
%         [a2,equi] = MV2(a1);
%         equi = es_trivial(a2);
%     end
%     Aplico movimiento 1 de Markov. 
%     if(equi==2)
%        disp('Hago MV1');
%         [a3,equi]=MV1(a2);
%         equi = es_trivial(a3);
%     end
%     contador=contador+1;
% end
% 
% if(equi==0)
%     disp('No es trivial');
% elseif(equi==1)
%     disp('Si es trivial');
% else
%     disp('NO SE SABE');
% end
% 
% 
n=2;
v = -n:1:n;
centro = (length(v)+1)/2;
v(centro)=[];
n_v = repmat(v,1,length(v)/2);
C = nchoosek(n_v,(length(v)/2));
todas = unique(C,'rows');

%las meto en el archivo
fi = fopen('ejemplos.txt', 'wt');
for i=1:1:length(todas)
    fprintf(fi,'%i ',todas(i,:));
    fprintf(fi,'\n');
end

