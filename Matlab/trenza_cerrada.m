%TRENZA_CERRADA clase trenza_cerrada, hereda de clase trenza.
% trenza_cerrada Properties:
%    n_enlaces - % numero de enlaces de una trenza cerrada.
% trenza_cerrada Methods:
%   trenza_cerrada - Contructor de la clase trenza_cerrada.
%   get.n_enlaces - Obtener el numero de enlaces de una trenza dada.
%   Alexander - Polinomio de Alexander de una trenza dada.
%   Dowker - Notacion Dowker de una trenza cerrada dada.

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
            
            %Obtengo el numero de enlaces de la trenza.
            indice = 1; auxiliar = 1;numero_enlaces = 0;seguir = true;
            v_perm = perm(br_c);
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
                pol_Alexander = 0;
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

        function equivalentes(br1,br2)
            fin = equivalentes@trenza(br1,br2);
            if(fin==1)
                disp('Por tanto, las trenzas cerradas tambien son equivalentes');
            else
                disp('Pero es posible que las trenzas cerradas si sean equivalentes.');
                %Vamos a usar el polinomio de Alexander para ver si las
                %trenzas NO son equivalentes. 
                %Si los polinomios de Alexander son dintintos, las trenzas
                %cerradas seran distintas. 
                %HACERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
                pol1 = Alexander(br1);
                pol2 = Alexander(br2);
                disp(pol1);disp(pol2);
            end
        end
        
        %si dos trenzas no son equivalentes, puede que sus cierres sí lo
        %sean. Necesito hacer algun metodo para esto. Sobreescribir metodo
        %equivalente.
        
        %Ademas la representacion va a ser distinta. Sobreescribir metodo
        %representar. 
        
        
    end %fin metodos
    
end

