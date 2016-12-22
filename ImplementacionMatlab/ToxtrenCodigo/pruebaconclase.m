%Leo del archivo
clear all;
warning('off','all');
contador_t=0;
fu=fopen('ej5.txt','r');
A=textscan(fu,'%f %f %f %f %f');
A=cell2mat(A);
fclose(fu);
fisol = fopen('ej5new.txt', 'wt');

for i=1:1:length(A)
    clearvars -except i A contador_t fisol;
    a=trenza_cerrada(A(i,:));
    explicacion=false;
    equi = es_trivial(a,explicacion);
    contador=0;

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







