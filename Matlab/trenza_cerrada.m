%TRENZA_CERRADA clase trenza_cerrada, hereda de clase trenza.
% trenza_cerrada Properties:
%    n_enlaces - numero de enlaces de una trenza cerrada.
% trenza_cerrada Methods:
%   Alexander - Polinomio de Alexander de una trenza dada.
%   asignar_trenza - Asigno los valores de la trenza cerrada 2 a la trenza cerrada 1. 
%   Dowker - Notacion Dowker de una trenza cerrada dada.
%   equivalentes - Comprobar si dos trenzas cerradas dadas son o no equivalentes. 
%   es_trivial - Comprobar si una trenza cerrada dada es o no equivalente a la trenza trivial.
%   inver - Obtener trenza inversa de una trenza cerrda dada.
%   pote - Obtener la trenza cerrada potencia de una trenza cerrada dada.
%   producto - Obtener la trenza cerrada producto de dos trenzas cerradas dadas.  
%   representar_trenza - Representacion 3D de la trenza cerrada.
%   set_indices - Establece nuevos indices y numero de cadenas a la trenza cerrada dada. 
%   trenza_cerrada - Contructor de la clase trenza_cerrada.

classdef trenza_cerrada<trenza
    
    properties (Dependent)
      n_enlaces;              % numero de enlaces de una trenza cerrada. 
    end
    
    properties (Access=private)
      private_n_enlaces = 1;
    end
    
    methods
        function br_c = trenza_cerrada(trenza_cad_char, n_cad)
        %TRENZA_CERRADA Contructor de la clase trenza cerrada. 
        %Entrada: cadena que representa a una trenza cerrada y numero de
        %cadenas de la trenza cerrada (este parametro se puede omitir).
        %Ejemplo: trenza_cerrada('+s1-s2',4) o trenza_cerrada([1 -2],4)
        %trenza_cerrada('cadena_representativa'): crea una trenza cerrada con los cruces
        %de la cadena_representativa y el numero de cadenas minimo
        %necesario.
        %trenza_cerrada('cadena_representativa',n_cadenas): crea una trenza cerrada con
        %los cruces de la cadena_representatita y n_cadenas.
        %trenza_cerrada(trenza): crea una trenza cerrada a partir de la
        %trenza dada. 
            if (nargin == 1)
                if(~ischar(trenza_cad_char) && ~isa(trenza_cad_char,'double'))
                    n_cad = get_n(trenza_cad_char);
                    trenza_cad_char = get_indices(trenza_cad_char);
                else
                     n_cad = 0;
                end
            end
            br_c@trenza(trenza_cad_char, n_cad); 
            
            numero_enlaces = calcular_enlaces(br_c);
            br_c.private_n_enlaces = numero_enlaces; %Aqui tendria que calcular el numero de enlaces que tenga la trenza. 
        end
                
        function valor = get.n_enlaces(br_c)   
            %GET.N_ENLACES Obtener el numero de enlaces de una trenza dada.
            valor = br_c.private_n_enlaces;
        end
        
        function pol_Alexander = Alexander(br_c)
        %ALEXANDER_POL Polinomio de Alexander de una trenza dada. 
        %ENTRADA: trenza cerrada.
        %See also TRENZA.MATRIZ_BURAU
            if(isempty(br_c.get_indices))
                pol_Alexander = sym('1');
            else
                m_burau = matriz_burau(br_c);
                N = m_burau - sym(eye(length(m_burau)));
                N_11 = N(2:length(N),2:length(N));
                pol_Alexander = det(N_11); 
            end
        end
        
        function not_Dowker = Dowker(br_c)
        %DOWKERNOTATION Notacion Dowker de una trenza cerrada dada.
        %Entrada: trenza cerrada.
            if(br_c.n_enlaces ~=1)
                disp('Se trata de un enlace.');
            else
                indices_braid = get_indices(br_c);
                num_terms = length(indices_braid);

                %Este será mi vector auxiliar para establecer pares/impares de cada crossing
                vector_etiquetas = zeros(1,2*num_terms);
                string = 1; siguiente_etiqueta = 1; tipocross = 0; cross = 1; 
                string_encontrado = false; condicion = true; signo = 1; link = false;

                while(condicion)
                    string_encontrado = false;
                    for i=cross:num_terms
                        if( (abs(indices_braid(i)) == string) || (abs(indices_braid(i)) == (string-1)))
                            string_encontrado = true;
                            cross = i;
                            break;
                        end
                    end

                    if (~string_encontrado)
                        for i=1:cross
                           if( (abs(indices_braid(i)) == string) || (abs(indices_braid(i)) == (string-1)))
                            string_encontrado = true;
                            cross = i;
                            break;
                           end    
                        end
                    end
                   
                    vector_etiquetas(2*(cross-1) + mod(siguiente_etiqueta,2)+1) = siguiente_etiqueta;
                    siguiente_etiqueta = siguiente_etiqueta +1;

                    if ((abs(indices_braid(cross)) == string && indices_braid(cross) * signo < 0) || ...
                        (abs(indices_braid(cross)) ~= string && indices_braid(cross) * signo > 0))
                            if (mod(siguiente_etiqueta,2))
                                vector_etiquetas(2*cross-1) = -vector_etiquetas(2*cross-1);
                            end 
                    end

                    if ( abs(indices_braid(cross))== string)
                        string = string +1;
                    else
                        string = string -1;
                    end

                    cross = cross + 1;
                    condicion = (siguiente_etiqueta <= 2*num_terms);  
                end

                %me quedo con los indices pares en el orden correcto. Sera la notación que
                %buscamos
                dowker = zeros(1,num_terms);
                for i=1:num_terms
                    for j=1:num_terms
                        if(vector_etiquetas(2*j) == (2*i-1))
                           dowker(i) = vector_etiquetas(2*j-1);
                           break;
                        end
                    end
                end
                not_Dowker = dowker;
            end

        end

        function equi = equivalentes(br1,br2)     
        % EQUIVALENTES. Comprobar si dos trenzas cerradas dadas son o no
        % equivalentes. 
        % Entrada: trenza cerrada 1 y trenza cerrada 2. 
        % See also TRENZA.EQUIVALENTES.
            if(br1.n_enlaces ~= br2.n_enlaces)
                equi=0;
                if(isempty(get_n(br2)))
                    disp('La trenza cerrada no es equivalente a la trivial porque tiene mas de un enlace.');
                else
                    disp('Las trenzas cerradas no son equivalentes porque tienen distinto numero de enlaces.');
                end
                return;
            end
            if(length(br1.get_indices) == 1)
                equi=0;
                 disp('La trenza cerrada es equivalente a la trivial porque tiene un sólo cruce.');
                 return;
            end
            equi = equivalentes@trenza(br1,br2);
            if(equi==1)
                if(isempty(get_n(br2)))
                    disp('Por tanto, la trenza cerrada es equivalente a la trivial.');
                else
                    disp('Por tanto, las trenzas cerradas tambien son equivalentes');
                end
            else
                if(isempty(get_n(br2)))
                    disp('Pero es posible que la trenza cerrada si sea equivalente a la trivial.');
                else
                    disp('Pero es posible que las trenzas cerradas si sean equivalentes.');
                end
                %Vamos a usar el polinomio de Alexander para ver si las
                %trenzas NO son equivalentes. 
                %Si los polinomios de Alexander son dintintos, las trenzas
                %cerradas seran distintas. 
                pol1 = Alexander(br1);
                pol2 = Alexander(br2);
                nu1=0;nu2=0;
                if(pol1~=0)
                   nu1=numden(pol1);
                end
                if(pol2~=0)
                   nu2=numden(pol2);
                end
                disp('Comparando los polinomios de Alexander obtenemos que...');
                
                 if(nu1==nu2 || nu1==(-1)*nu2)
                     equi=2;
                     if(isempty(get_n(br2)))
                        disp('No sabemos si la trenza cerrada dada es equivalente a la trivial.');
                     else
                        disp('No sabemos si las trenzas cerradas dadas son equivalentes. ');
                     end
                 else
                     equi=0;
                     if(isempty(get_n(br2)))
                        disp('La trenza cerrada no es equivalente a la trivial.');
                     else
                        disp('Las trenzas cerradas no son equivalentes.');
                     end
                 end
            end
        end
        
        function equi = es_trivial(br_c)
        %ES_TRIVIAL Comprobar si una trenza cerrada dada es o no equivalente a la
        %trenza trivial.
        %Entrada: trenza cerrada. 
            br_2 = trenza_cerrada(trenza());
            equi = equivalentes(br_c,br_2);
        end
        
        function representar_trenza(br_c, N_cortes, Radio)
        %REPRESENTAR_TRENZA Representacion 3D de la trenza cerrada.
        %Entrada: trenza cerrada, numero de cortes y radio de la trenza.
        %See also TRENZA.REPRESENTAR_TRENZA     
            if(nargin == 1)
                N_cortes = 20;
                Radio=0.5;
            end
            representar_trenza@trenza(br_c,N_cortes, Radio);

            %Cierres superiores
            alpha=0:0.01:pi;
            l=zeros([1 length(alpha)]);
            x_cierre=cos(alpha)-1;y_cierre=l;z_cierre=sin(alpha);
            contador=1; distancia=0;
            for i=1:1:br_c.get_n
                x_cierre_n = contador*x_cierre + distancia; y_cierre_n = contador*y_cierre; z_cierre_n = i*z_cierre +3*pi;
                plot3(x_cierre_n,y_cierre_n,z_cierre_n);
                tubep(x_cierre_n,y_cierre_n,z_cierre_n,N_cortes,Radio);
                contador=contador+2;
                distancia=distancia+2;
            end
            
            %Cilindros de los cierres
             [x_cil,y_cil,z_cil] = cilindro_base();
             distancia = 2;
             limite = length(br_c)-1;
             for i=1:1:br_c.get_n
                 x_cil_n = x_cil - distancia;
                 for j=0:1:limite
                    plot3(x_cil_n,y_cil,z_cil-j*(3*pi));
                    tubep(x_cil_n,y_cil,z_cil-j*(3*pi),N_cortes,Radio);
                 end
                 distancia = distancia+2;
             end

            %Cierres inferiores
            alpha=0:0.01:pi;
            l=zeros([1 length(alpha)]);
            x_cierre=-cos(alpha)-1;y_cierre=l;z_cierre=-sin(alpha);
            contador=1; distancia=0;
            for i=1:1:br_c.get_n
                x_cierre_n = contador*x_cierre + distancia; y_cierre_n = contador*y_cierre; z_cierre_n = i*z_cierre -limite*(3*pi);
                plot3(x_cierre_n,y_cierre_n,z_cierre_n);
                tubep(x_cierre_n,y_cierre_n,z_cierre_n,N_cortes,Radio);
                contador=contador+2;
                distancia=distancia+2;
            end
  
        end
        
        function asignar_trenza(br1_c, br2_c)  
        %ASIGNAR_TRENZA Asigno los valores de la trenza cerrada 2 a la trenza cerrada 1. 
        %Entrada: trenza cerrada 1 y trenza cerrada 2.
        %See also TRENZA.ASIGNAR_TRENZA.
            asignar_trenza@trenza(br1_c, br2_c);
            br1_c.private_n_enlaces = br2_c.n_enlaces;
            
        end
        
        function tinv = inver(br_c)
        %INVER Obtener trenza inversa de una trenza cerrda dada.
        %Entrada: trenza cerrada.
            aux = inver@trenza(br_c);
            tinv = trenza_cerrada(aux);
            tinv.private_n_enlaces = br_c.n_enlaces;
        end
        
        function set_indices(br_c, nuevos_indices, nuevo_numero_cadenas)
        %SET_INDICES Establece nuevos indices y numero de cadenas a la trenza cerrada dada. 
        %Entrada: trenza cerrada, nuevos cruces de la trenza cerrada y numero de cadenas que le establecemos. 
            if (nargin==2)
                set_indices@trenza(br_c, nuevos_indices);
            elseif (nargin==3)
                set_indices@trenza(br_c, nuevos_indices, nuevo_numero_cadenas);
            end
                br_c.private_n_enlaces = calcular_enlaces(br_c);            
            
        end
                
        function tpot = pote(br_c,exp)
        %POTE Obtener la trenza cerrada potencia de una trenza cerrada dada. 
        %Entrada: trenza cerrada y exponente de la potencia.
            aux = pote@trenza(br_c,exp);
            tpot = trenza_cerrada(aux);
            tpot.private_n_enlaces = calcular_enlaces(tpot);
        end
        
        function tpro = producto(br1_c,br2_c)  
        %PRODUCTO Obtener la trenza cerrada producto de dos trenzas cerradas dadas.  
        %Entrada: trenza cerrada 1 y trenza cerrada 2. 
            aux = producto@trenza(br1_c,br2_c);
            tpro = trenza_cerrada(aux);
            tpro.private_n_enlaces = calcular_enlaces(tpro);
        end
        
        
        %Sobreescribir... ¿DEHORNOY?
        
    end 
    
    methods (Access=private)  %tengo que arreglar este metodo 
         function numero_enlaces = calcular_enlaces(br_c)
        %Obtengo el numero de enlaces de la trenza.
            indice = 1; auxiliar = 1;numero_enlaces = 0;seguir = true;
            v_perm = perm(br_c);
            id=1:1:length(v_perm);
            if(id==v_perm)
                numero_enlaces = br_c.n_cadenas;
                return;
            end
            while(indice < length(v_perm))
                for i=1:1:length(v_perm)
                    if(seguir)
                       en_vector = v_perm(indice);
                       if(sum(find(auxiliar==en_vector))~=0)
                          seguir = false;
                          numero_enlaces = numero_enlaces+1;
                       else
                          auxiliar(length(auxiliar)+1) = en_vector;
                          indice= en_vector;
                       end
                    end
                end
                encontrado=false;
                for j=1:1:length(v_perm)
                   if(~encontrado)
                      if(sum(find(auxiliar==j))==0)
                          indice = j; 
                          encontrado=true;
                          seguir = true;
                      else
                          indice=length(v_perm);
                      end
                   end
                end
            end
            
            if(isempty(br_c.get_indices))
                numero_enlaces = 1;
            end
         end
    end
    
end

