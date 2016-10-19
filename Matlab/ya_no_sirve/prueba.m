%Leo del archivo
clear all;
warning('off','all');
contador_t=0;
fu=fopen('ej5.txt','r');
A=textscan(fu,'%f %f %f %f %f');
A=cell2mat(A);
fclose(fu);
fisol = fopen('ej5sol2.txt', 'wt');

for i=1:1:length(A)
    clearvars -except i A contador_t fisol;
    a=trenza_cerrada(A(i,:));
    explicacion=false;
    equi = es_trivial(a,explicacion);
    contador=0;

    while(contador<3 && equi==2)
        if(contador~=0)
            asignar_trenza(a,a4);
        end
      % Aplico movimiento 1 de Markov. 
        if(equi==2)
            if(explicacion)
                disp('Hago MV1');
            end
            [a1,equi]=MV1(a);
            equi = es_trivial(a1,explicacion);
        end
      %  Veo si es trivial o no la trenza tras aplicar dehornoy
        if(equi==2)
          [e, final] = dehornoy(a1,20,0.5,false);
          a2 = trenza_cerrada(final);
          equi = es_trivial(a2,explicacion);
        end

      %  Aplico movimiento 2 de Markov tantas veces como sea posible
        if(equi==2)
            if(explicacion)
                disp('Hago MV2');
            end
            [a3,equi] = MV2(a2);
            equi = es_trivial(a3,explicacion);
        end
      % Aplico movimiento 1 de Markov. 
        if(equi==2)
            if(explicacion)
                disp('Hago MV1');
            end
            [a4,equi]=MV1(a3, true);
            equi = es_trivial(a4,explicacion);
        end
        contador=contador+1;
    end

%     if(equi==0)
%         salida = strcat(num2str(A(i,:)),': No es trivial.');
%     elseif(equi==1)      
%         salida = strcat(num2str(A(i,:)),': Si es trivial.');
%     else
%         salida = strcat(num2str(A(i,:)),': NO SABEMOS SI ES O NO TRIVIAL.');
%     end
%     fprintf(fisol,'%s\n ',salida); 
    
    if(equi==2)
        contador_t = contador_t +1;
        salida = strcat(num2str(A(i,:)),': NO SABEMOS SI ES O NO TRIVIAL.');
        fprintf(fisol,'%s\n ',salida); 
    end

end

salida2 = strcat('Numero de trenzas cerradas sin clasificar: ',num2str(contador_t));   

fprintf(fisol,'%s ',salida2);
fprintf(fisol,'\n');
fclose(fisol);








% 
% n=2;
% v = -n:1:n;
% centro = (length(v)+1)/2;
% v(centro)=[];
% n_v = repmat(v,1,length(v)/2);
% C = nchoosek(n_v,(length(v)/2));
% todas = unique(C,'rows');
% 
% %las meto en el archivo
% fi = fopen('ej2.txt', 'wt');
% for i=1:1:length(todas)
%     fprintf(fi,'%i ',todas(i,:));
%     fprintf(fi,'\n');
% end
% fclose(fi);





