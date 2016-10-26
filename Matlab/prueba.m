%Leo del archivo
clear all;
warning('off','all');
contador_t=0;
fu=fopen('ej4.txt','r');
A=textscan(fu,'%f %f %f %f');
A=cell2mat(A);
fclose(fu);
fisol = fopen('ej4o26.txt', 'wt');

for i=1:1:length(A)
    clearvars -except i A contador_t fisol;
    a=trenza_cerrada(A(i,:));
    explicacion=false;
    equi = es_trivial_base(a,explicacion);
    contador=0;

    while(contador<4 && equi==2)
        if(contador~=0)
            asignar_trenza(a,a4);
        end
      % Aplico movimiento 1 de Markov. 
        if(equi==2)
            if(explicacion)
                disp('Hago MV1');
            end
            [a1,equi]=MV1(a);
            [e, final] = dehornoy(a1,20,0.5,explicacion);
            if(e==1)
                equi=1;
            end
            a2 = trenza_cerrada(final);
        end
        
      %Aplico movimiento 2 de Markov tantas veces como sea posible
        if(equi==2)
            if(explicacion)
                disp('Hago MV2');
            end
            [a3,equi] = MV2(a2);
            [e3, final3] = dehornoy(a3,20,0.5,explicacion);
             if(e3==1)
                equi=1;
             end
            a4 = trenza_cerrada(final3);
        end
        contador=contador+1;
    end

    if(equi==2)
        contador_t = contador_t +1;
        salida = strcat(num2str(A(i,:)),': NO SABEMOS SI ES O NO TRIVIAL.');
        fprintf(fisol,'%s\n ',salida); 
    end
%     if(equi==0)
%         salida = strcat(num2str(A(i,:)),': No es trivial.');
%     elseif(equi==1)      
%         salida = strcat(num2str(A(i,:)),': Si es trivial.');
%     else
%         salida = strcat(num2str(A(i,:)),': NO SABEMOS SI ES O NO TRIVIAL.');
%     end
%     fprintf(fisol,'%s\n ',salida); 
    

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





