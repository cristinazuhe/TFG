
%TRENZA clase trenza.
% trenza Properties:
%    indices_trenza - indices de los cruces de la trenza
%    n_cadenas - numero de cadenas de la trenza
%
% trenza Methods:
%   trenza - Contructor de la clase trenza.
%   set_n - Establece el numero de cadenas de una trenza dada.
%   set_indices - Establece nuevos indices y numero de cadenas a la trenza dada.
%   get_n - Obtener el numero de cadenas de una trenza dada.
%   get_indices - Obtener los indices de una trenza dada. 
%   asignar_trenza - Asigno los valores de la trenza2 a la trenza1. 
%   length - Obtener numero de cruces de una trenza dada. 
%   inver - Obtener trenza inversa de una trenza dada.
%   pote - Obtener la trenza potencia de una trenza dada.
%   exp - Exponente de una trenza dada.
%   perm - Permutacion de una trenza dada.
%   pura - Comprobar si una trenza dada es pura.

classdef trenza<handle

    properties
        indices_trenza = int32([]) %indices de los cruces de la trenza
        n_cadenas                         % numero de cadenas de la trenza 
    end
    
    methods    
        function br = trenza(trenza_cad_char, n_cad)
        %trenza Contructor de la clase trenza. 
        %Entrada: cadena que representa a una trenza y numero de
        %cadenas de la trenza.
        %Ejemplo: trenza([+s1-s2],4)
        %trenza('cadena_representativa'): crea una trenza con los cruces
        %de la cadena_representativa y el numero de cadenas minimo
        %necesario.
        %trenza('cadena_representativa',n_cadenas): crea una trenza con
        %los cruces de la cadena_representatita y n_cadenas. 
            if nargin == 0, return; end;
            if(isempty(trenza_cad_char))  %Introducimos la trenza trivial como ''
                br.indices_trenza=[];
                br.n_cadenas = 0;
            else                         %para trenzas no triviales 
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
    end
    
end

