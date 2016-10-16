
%TRENZA clase trenza.
% trenza Properties:
%    indices_trenza - indices de los cruces de la trenza
%    n_cadenas - numero de cadenas de la trenza
%
% trenza Methods:
%   asignar_trenza - Asigno los valores de la trenza2 a la trenza1. 
%   dehornoy - Reduccion Dehornoy de una trenza dada. 
%   equivalentes - Comprobar si dos trenzas dadas son o no.
%   es_trivial - Comprobar si una trenza dada es o no equivalente a la trenza trivial.
%   exp - Exponente de una trenza dada.
%   get_indices - Obtener los indices de una trenza dada. 
%   get_n - Obtener el numero de cadenas de una trenza dada. 
%   inver - Obtener trenza inversa de una trenza dada.
%   length - Obtener numero de cruces de una trenza dada.
%   matriz_burau - Matriz Burau de una trenza dada. 
%   perm - Permutacion de una trenza dada.
%   pote - Obtener la trenza potencia de una trenza dada.
%   producto - Obtener la trenza producto de dos trenzas dadas. 
%   pura - Comprobar si una trenza dada es pura.
%   representar_trenza - Representacion 3D de la trenza.
%   set_indices - Establece nuevos indices y numero de cadenas a la trenza dada.
%   set_n - Establece el numero de cadenas de una trenza dada.
%   trenza - Contructor de la clase trenza.

classdef trenza<handle

    properties
        indices_trenza = int32([]) %indices de los cruces de la trenza
        n_cadenas                         % numero de cadenas de la trenza 
    end
    
    methods    
        function br = trenza(trenza_cad_char, n_cad)
        %TRENZA Contructor de la clase trenza. 
        %Entrada: cadena que representa a una trenza y numero de
        %cadenas de la trenza (este parametro se puede omitir).
        %Ejemplo: trenza('+s1-s2',4) o trenza([1 -2],4)
        %trenza('cadena_representativa'): crea una trenza con los cruces
        %de la cadena_representativa y el numero de cadenas minimo
        %necesario.
        %trenza('cadena_representativa',n_cadenas): crea una trenza con
        %los cruces de la cadena_representatita y n_cadenas. 
            if nargin == 0, return; end;
            if(~ischar(trenza_cad_char))  %Introducimos la trenza a partir de los indices entre []
                br.indices_trenza=trenza_cad_char;
            else                         %Introducimos la trenza a partir de una secuencia '+-si'
                n_aux_cruces=1;
                br.indices_trenza = zeros(1,length(trenza_cad_char)/3);
                for i=1:length(trenza_cad_char)
                    if(strcmpi(trenza_cad_char(i),'-'))
                       br.indices_trenza(n_aux_cruces) = -str2double(trenza_cad_char(i+2));
                       n_aux_cruces = n_aux_cruces+1;
                    elseif(strcmpi(trenza_cad_char(i),'+'))
                       br.indices_trenza(n_aux_cruces) = str2double(trenza_cad_char(i+2));
                       n_aux_cruces = n_aux_cruces+1;
                    end
                end
            end

            switch nargin
            case 2
                if(n_cad <= max(abs(br.indices_trenza))) 
                   br.n_cadenas = max(abs(br.indices_trenza)) +1;
                else
                    br.n_cadenas = n_cad;
                end
            case 1
                br.n_cadenas = max(abs(br.indices_trenza)) +1;
            end
                
        end
        
        function set_n(br, nuevo_numero_cadenas)
        %SET_N Establece el numero de cadenas de una trenza dada.
        %Entrada: trenza y numero de cadenas que establecemos a dicha
        %trenza. 
            if(max(abs(br.indices_trenza)) < nuevo_numero_cadenas)
                 br.n_cadenas = nuevo_numero_cadenas;
            else
                disp('No es posible que dicha trenza tenga ese numero de cadenas');
                disp('Se establecera al numero minimo de cadenas necesarias');
                br.n_cadenas = max(abs(br.indices_trenza))+1;
            end
        end
        
        function set_indices(br, nuevos_indices, nuevo_numero_cadenas)
        %SET_INDICES Establece nuevos indices y numero de cadenas a la trenza dada. 
        %Entrada: trenza, nuevos cruces de la trenza y numero de cadenas que establecemos a dicha trenza.  
            br.indices_trenza = nuevos_indices;
            switch nargin
                case 3
                    set_n(br, nuevo_numero_cadenas);
                case 2
                    set_n(br, max(abs(br.indices_trenza))+1);
            end
        end
        
        function valor_n = get_n(br)
        %GET_N Obtener el numero de cadenas de una trenza dada.
        %Entrada: trenza.
            valor_n = br.n_cadenas;
        end
        
        function valor_indices = get_indices(br)
        %GET_INDICES Obtener los indices de una trenza dada. 
        %Entrada: trenza.
            valor_indices = br.indices_trenza;
        end
        
        function asignar_trenza(br1, br2)
        %ASIGNAR_TRENZA Asigno los valores de la trenza2 a la trenza1. 
        %Entrada: trenza1 y trenza2. 
            set_indices(br1, br2.indices_trenza, br2.n_cadenas);
        end
       
        function n_cross = length(br)
        % LENGTH Obtener numero de cruces de una trenza dada.
        % Entrada: trenza.
           n_cross = length(br.indices_trenza); 
        end
        
        function tinv = inver(br)
        %INVER Obtener trenza inversa de una trenza dada.
        %Entrada: trenza.
            tinv = trenza('');
            tinv.indices_trenza=-fliplr(br.indices_trenza);
            tinv.n_cadenas = br.n_cadenas;
        end
    
        function tpot = pote(br,exp)
        %POTE Obtener la trenza potencia de una trenza dada. 
        %Entrada: trenza y exponente de la potencia. 
            tpot = trenza('');
            if(exp>0)
                tpot.indices_trenza = repmat(br.indices_trenza,[1 exp]);
            elseif(exp<0)
                aux = inver(br);
                tpot.indices_trenza = repmat(aux.indices_trenza,[1 -exp]);
            end
            tpot.n_cadenas = br.n_cadenas;
        end
        
        function tpro = producto(br1,br2)
        %PRODUCTO Obtener la trenza producto de dos trenzas dadas.  
        %Entrada: trenza1 y trenza2. 
            tpro = trenza('');
            tpro.indices_trenza = [br1.indices_trenza,br2.indices_trenza];
            tpro.n_cadenas = max(br1.n_cadenas, br2.n_cadenas);
            if(br1.n_cadenas ~= br2.n_cadenas)
                disp('Dichas trenzas tienen distintos numero de cadenas.');
                disp('Se define la trenza producto con el mayor numero de cadenas de las dos.');
            end
        end
        
        function valor_exp = exp(br)
        %EXPONENTE Exponente de una trenza dada. 
        %Entrada: trenza.
            valor_exp=0;
            for i=1:1:length(br.indices_trenza)
               valor_exp = valor_exp + sign(br.indices_trenza(i)); 
            end
        end
        
        function vector_p = perm(br)
        %PERMUTACION Permutacion de una trenza dada. 
        %Entrada: trenza.
            maximo = max(abs(br.indices_trenza))+1;
            vector_p = 1:maximo;
            for i=1:1:length(br.indices_trenza)
               for j=1:1:maximo
                  if(abs(br.indices_trenza(i)) == vector_p(j))
                        vector_p(j) = vector_p(j)+1;
                  elseif (abs(br.indices_trenza(i)) == (vector_p(j)-1))
                        vector_p(j) = vector_p(j)-1;
                  end
               end
            end

            for j=maximo+1:1:br.n_cadenas
                vector_p(j) = j;
            end
        end
        
        function bool_pura = pura(br)
        %PURA Comprobar si una trenza dada es pura.
        %Entrada: trenza.
             bool_pura = all(perm(br) == 1:br.n_cadenas);
        end
            
        function representar_trenza(br, N_cortes, Radio)
        %REPRESENTAR_TRENZA Representacion 3D de la trenza.
        %Entrada: trenza, numero de cortes y radio de la trenza.
        %See also PARAM_CADENAS, TUBEP
            if(nargin == 1)
                N_cortes = 20;
                Radio=0.5;
            end
            [matriz_x,matriz_y,matriz_z] = param_cadenas(br.indices_trenza,br.n_cadenas);

            for i=1:1:size(matriz_z,1)
                plot3(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:));
                tubep(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:),N_cortes,Radio);
                hold on;
            end 
        end
         
        function [es_trivial, trenza_final] = dehornoy( br, N_cortes, Radio, representar)
        %DEHORNOY Reduccion Dehornoy de una trenza dada. 
        %Entrada: trenza, numero de cortes, radio de la trenza y bool
        %para representar o no las transformaciones.
        %Salida: bool que indica si la trenza es trivial y reducción dehornoy de la
        %trenza. 
        %See also SIMPLIFICA, ENCUENTRA_HANDLE, REDUCCION_BASE, TRANSICION_BRAIDS
            if(nargin == 1)
                N_cortes = 20;
                Radio=0.5;
                representar=true;
            end
            indices_braid = br.indices_trenza;
            n=br.n_cadenas;
            if(n>max(abs(indices_braid))+1) %La trenza de partida tiene cadenas finales triviales
                [matriz_x1,matriz_y1,matriz_z1] = param_cadenas(indices_braid,n);
                [matriz_x2,matriz_y2,matriz_z2] = param_cadenas(indices_braid,max(abs(indices_braid)));
                for t=0:0.1:1
                    for j=1:1:size(matriz_x1,1)
                        if(j>size(matriz_x2,1))
                            vector_x(1:size(matriz_x1,2))= matriz_x1(j,size(matriz_x1,2)) ;
                            vector_y(1:size(matriz_x1,2))= matriz_y1(j,size(matriz_y1,2)) ;
                            vector_z(1:size(matriz_x1,2))= matriz_z1(j,size(matriz_z1,2)) ;

                            x_tran = (1-t)*matriz_x1(j,:) + (t)*vector_x;
                            y_tran = (1-t)*matriz_y1(j,:) + (t)*vector_y;
                            z_tran = (1-t)*matriz_z1(j,:) + (t)*vector_z;
                        else
                            x_tran = (1-t)*matriz_x1(j,:) + (t)*matriz_x1(j,:);
                            y_tran = (1-t)*matriz_y1(j,:) + (t)*matriz_y1(j,:);
                            z_tran = (1-t)*matriz_z1(j,:) + (t)*matriz_z1(j,:);
                        end
                        if j==1
                            aux1 = plot3(x_tran, y_tran, z_tran);
                            aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
                            hold on;
                        else
                            aux1 = vertcat(aux1, plot3(x_tran, y_tran, z_tran));
                            aux2 = vertcat(aux2, tubep(x_tran,y_tran,z_tran,N_cortes,Radio));
                        end
                    end

                    pause(0.1);
                    if(t~=1)
                        delete(aux1);delete(aux2);
                        clear aux1;clear aux2;
                    end
                end
            end

            matriz_braid{1}=indices_braid;
            n = max(abs(indices_braid));
            encontrado = true;
            while(encontrado)

                    %elimino movimiento de tipo1 como pueda -+sigma +-sigma
                    [braid_aux, indices_braid,simplificado] = Simplifica(indices_braid);
                    if(simplificado)
                         matriz_braid{length(matriz_braid)+1} = braid_aux;
                    end

                    if(~simplificado)
                            %obtengo el indice de la trenza de menor valor 
                            minimo = min(abs(indices_braid));
                            %busco posiciones de handle con dicho indice
                            [pos1,pos2] = encuentra_handle(indices_braid, minimo);
                            if(pos1==0 && pos2==0)
                                encontrado = false;
                            else
                                encontrado = true;
                            end

                            %Busco subhandle en el handle en cuestion para evitar que se produzcan
                            %ciclos infinitos. 
                            haysubhandle = true;
                            if(encontrado)
                                while(haysubhandle)
                                   [pos1_sig, pos2_sig] = encuentra_handle(indices_braid(pos1+1:pos2-1),minimo+1);
                                   if(pos1_sig~=0 && pos2_sig~=0)
                                       pos2 = pos2_sig + pos1; pos1 = pos1_sig + pos1; minimo = minimo+1;
                                       haysubhandle = true;
                                   else
                                       haysubhandle = false;
                                   end
                                end
                                %Ahora ya tengo marcado con pos1 y pos2 el subvector con el que voy a hacer
                                %la reduccion de dehornoy.E sta reduccion es para cuando ya tengo el handle en condiciones para
                                %reducir. 
                                %en braid_aux tengo una trenza auxiliar con ceros
                                %para facilitar la visualizacion
                                [braid_aux2,indices_braid, simplificado2] = reduccion_base(indices_braid, minimo, pos1, pos2); 
                                if(simplificado2)
                                         matriz_braid{length(matriz_braid)+1} = braid_aux2;
                                end
                            end  
                            clearvars pos1_sig pos2_sig haysubhandle pos1 pos2 minimo

                    end

                    %Creo una matriz con la secuencia de trenzas generada.
                    if(~isequal(indices_braid,matriz_braid{length(matriz_braid)}))
                         matriz_braid{length(matriz_braid)+1} = indices_braid;
                    end

            end


            trenza_final = matriz_braid{length(matriz_braid)};
            %voy a representar los movimientos de las trenzas
            es_trivial = isequal([],matriz_braid{length(matriz_braid)});
            n=max(abs(indices_braid));
            if(representar)
                if(es_trivial)
                   for j=1:1:length(matriz_braid)-2
                       hold off;
                       transicion_braids(matriz_braid{j},matriz_braid{j+1},n, N_cortes,Radio);
                   end
                else
                   for j=1:1:length(matriz_braid)-1
                       hold off;
                       transicion_braids(matriz_braid{j},matriz_braid{j+1},n, N_cortes,Radio);
                   end
                end
            end
  

        end

        function equi = equivalentes(br1,br2, explicacion)
        % EQUIVALENTES. Comprobar si dos trenzas dadas son o no
        % equivalentes. 
        % Entrada: trenza1 y trenza2. 
        % See also EXPONENTE, PERMUTACION, DEHORNOY.
            
            %Primero vemos si los exponentes son distintos.
            if(nargin==2)
                explicacion=false;
            end
            vector_e1 = exp(br1);
            vector_e2 = exp(br2);
            fin = false;
            if(vector_e1 ~= vector_e2)
                if(explicacion)
                    if(isempty(get_n(br2)))
                        disp('La trenza dada no es equivalente a la trenza trivial. Su exponente no es nulo.');
                    else
                        disp('Las trenzas dadas no son equivalentes pues sus exponentes son distintos.');
                    end
                end
                fin = true;
                equi=false;
            end
            
            %A continuacion vemos si las permutaciones son distintas
            if(~fin)
                vector_p1 = perm(br1);
                vector_p2 = perm(br2);
                
                if(length(vector_p1)>length(vector_p2))
                    vector_aux = vector_p1(1:length(vector_p2));
                    if(~isequal(vector_aux,vector_p2))
                        if(explicacion)
                            if(isempty(get_n(br2)))
                                disp('La trenza dada no es equivalente a la trenza trivial. Su permutacion no es trivial.');
                            else
                                disp('Las trenzas dadas no son equivalentes pues sus permutaciones son distintas.');
                            end
                        end
                        fin = true;
                        equi=false;
                    end
                elseif(length(vector_p2)>length(vector_p1))
                    vector_aux = vector_p2(1:length(vector_p1));
                    if(~isequal(vector_aux,vector_p1))
                        if(explicacion)
                            if(isempty(get_n(br2)))
                                disp('La trenza dada no es equivalente a la trenza trivial. Su permutacion no es trivial.');
                            else
                                disp('Las trenzas dadas no son equivalentes pues sus permutaciones son distintas.');
                            end
                        end
                        fin = true;
                        equi=false;
                    end
                elseif(~isequal(vector_p1,vector_p2))
                   if(explicacion)
                        if(isempty(get_n(br2)))
                            disp('La trenza dada no es equivalente a la trenza trivial. Su permutacion no es trivial.');
                        else
                            disp('Las trenzas dadas no son equivalentes pues sus permutaciones son distintas.');
                        end
                    end
                    fin = true;
                    equi=false;
                end
            end
            
            %Ya hemos probado invariantes basicos, vamos con el algoritmo de Dehornoy. 
            if(~fin)
                %obtengo la trenza inversa de la segunda trenza.
                trenza_aux = producto(br1,inver(br2));
                disp(trenza_aux);
                [es_trivial, final_braid] =  dehornoy(trenza_aux, 20, 0.5, false);
                
                if(~es_trivial)
                   if(explicacion)
                       if(isempty(get_n(br2)))
                          disp('La trenza dada no es equivalente a la trenza trivial. Hemos aplicado el algoritmo de Dehornoy.');
                       else
                          disp('Las trenzas dadas no son equivalentes. Hemos aplicado el algoritmo de Dehornoy.');
                       end
                   end
                   equi=false;
                else
                   equi=true;
                   if(explicacion)
                       if(isempty(get_n(br2)))
                            disp('La trenza dada si es equivalente a la trenza trivial. Hemos aplicado el algoritmo de Dehornoy.');
                       else
                            disp('Las trenzas dadas si son equivalentes. Hemos aplicado el algoritmo de Dehornoy.');
                            respuesta = input('¿Desea ver la transformacion de las trenzas? (s/n)','s');
                            if(respuesta == 's')
                                disp('Las trenzas dadas br1 y br2 son equivalentes, luego la trenza compuesta br1inv(br2) es equivalente a la trenza trivial.');
                                res_n_cortes = input('Indique el numero que cortes que tendrá la trenza compuesta:','s');
                                N_cortes = str2double(res_n_cortes);
                                res_radio = input('Indique el radio que tendrá la trenza compuesta:','s');
                                Radio = str2double(res_radio);
                                dehornoy(trenza_aux, N_cortes, Radio, true);
                            end
                       end
                   end
                end
            end 
            fin = ~fin;
        end
        
        function equi= es_trivial(br,explicacion)
        %ES_TRIVIAL Comprobar si una trenza dada es o no equivalente a la
        %trenza trivial.
        %Entrada: trenza.     
            if(nargin==1)
                explicacion=false;
            end
            br_2 = trenza();
            equi = equivalentes(br,br_2,explicacion);
        end
        
        function m_burau = matriz_burau(br)
        %BURAU_MATRIX Matriz Burau de una trenza dada. 
        %Entrada: trenza.
            indices_braid = get_indices(br);
            n = get_n(br);
            n_cross = length(indices_braid);

            indice = abs(indices_braid(1));
            m_burau = sym(eye(n));
            t = sym('t');
            if(indices_braid(1) > 0 )
                m_burau(indice,indice) = 1-t;
                m_burau(indice,indice+1) = t;
                m_burau(indice+1,indice) = 1;
                m_burau(indice+1,indice+1) = 0;
            else
                m_burau(indice,indice) = 0;
                m_burau(indice,indice+1) = 1;
                m_burau(indice+1,indice) = t^-1;
                m_burau(indice+1,indice+1) = 1-t^-1;
            end

            for i=2:n_cross
                indice = abs(indices_braid(i));
                aux = sym(eye(n));
                if(indices_braid(i) > 0 )
                    aux(indice,indice) = 1-t;
                    aux(indice,indice+1) = t;
                    aux(indice+1,indice) = 1;
                    aux(indice+1,indice+1) = 0;
                else
                    aux(indice,indice) = 0;
                    aux(indice,indice+1) = 1;
                    aux(indice+1,indice) = t^-1;
                    aux(indice+1,indice+1) = 1-t^-1;
                end
                m_burau = m_burau*aux;
            end
            m_burau = simplify(m_burau);
        end
        
    end % fin metodos
    
    
end

