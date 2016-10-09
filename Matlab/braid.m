
%BRAID clase braid.
% braid Properties:
%    indices_braid - indices de los cruces de la trenza
%    n_cadenas - numero de cadenas de la trenza
%
% braid Methods:
%   braid - Contructor de la clase braid.
%   set_n - Establece el numero de cadenas de una trenza dada.
%   set_indices - Establece nuevos indices y numero de cadenas a la trenza dada.
%   get_n - Obtener el numero de cadenas de una trenza dada.
%   get_indices - Obtener los indices de una trenza dada. 
%   asignar_trenza - Asigno los valores de la trenza braid2 a la trenza braid1. 
%   length - Obtener numero de cruces de una trenza dada. 
%   inver - Obtener trenza inversa de una trenza dada.

classdef braid<handle

    properties
        indices_braid = int32([]) %indices de los cruces de la trenza
        n_cadenas                         % numero de cadenas de la trenza 
    end
    
    methods    
        function br = braid(braid_cad_char, n_cad)
            %BRAID Contructor de la clase braid. 
            %Entrada: cadena que representa a una trenza y numero de
            %cadenas de la trenza.
            %Ejemplo: braid([+s1-s2],4)
            %braid('cadena_representativa'): crea una trenza con los cruces
            %de la cadena_representativa y el numero de cadenas minimo
            %necesario.
            %braid('cadena_representativa',n_cadenas): crea una trenza con
            %los cruces de la cadena_representatita y n_cadenas. 
            if nargin == 0, return; end;
            if(isempty(braid_cad_char))  %Introducimos la trenza trivial como ''
                br.indices_braid=[];
                br.n_cadenas = 0;
            else                         %para trenzas no triviales 
                n_aux_cruces=1;
                br.indices_braid = zeros(1,length(braid_cad_char)/3);
                for i=1:length(braid_cad_char)
                    if(strcmpi(braid_cad_char(i),'-'))
                       br.indices_braid(n_aux_cruces) = -str2double(braid_cad_char(i+2));
                       n_aux_cruces = n_aux_cruces+1;
                    elseif(strcmpi(braid_cad_char(i),'+'))
                       br.indices_braid(n_aux_cruces) = str2double(braid_cad_char(i+2));
                       n_aux_cruces = n_aux_cruces+1;
                    end
                end
                
                switch nargin
                case 2
                    if(n_cad <= max(abs(br.indices_braid))) 
                       br.n_cadenas = max(abs(br.indices_braid)) +1;
                    else
                        br.n_cadenas = n_cad;
                    end
                case 1
                    br.n_cadenas = max(abs(br.indices_braid)) +1;
                end
                        
            end
        end
        
        function set_n(br, nuevo_numero_cadenas)
        %SET_N Establece el numero de cadenas de una trenza dada.
        %Entrada: braid y numero de cadenas que establecemos a dicha
        %trenza. 
            if(max(abs(br.indices_braid)) < nuevo_numero_cadenas)
                 br.n_cadenas = nuevo_numero_cadenas;
            else
                disp('No es posible que dicha trenza tenga ese numero de cadenas');
                disp('Se establecera al numero minimo de cadenas necesarias');
                br.n_cadenas = max(abs(br.indices_braid))+1;
            end
        end
        
        function set_indices(br, nuevos_indices, nuevo_numero_cadenas)
        %SET_INDICES Establece nuevos indices y numero de cadenas a la trenza dada. 
        %Entrada: braid, nuevos cruces de la trenza y numero de cadenas que establecemos a dicha trenza.  
            br.indices_braid = nuevos_indices;
            switch nargin
                case 3
                    set_n(br, nuevo_numero_cadenas);
                case 2
                    set_n(br, max(abs(br.indices_braid))+1);
            end
        end
        
        function valor_n = get_n(br)
        %GET_N Obtener el numero de cadenas de una trenza dada.
        %Entrada: braid.
            valor_n = br.n_cadenas;
        end
        
        function valor_indices = get_indices(br)
        %GET_INDICES Obtener los indices de una trenza dada. 
        %Entrada: braid.
            valor_indices = br.indices_braid;
        end
        
        function asignar_trenza(br1, br2)
        %ASIGNAR_TRENZA Asigno los valores de la trenza braid2 a la trenza braid1. 
        %Entrada: braid1 y braid2. 
            set_indices(br1, br2.indices_braid, br2.n_cadenas);
        end
       
        function n_cross = length(br)
           % LENGTH Obtener numero de cruces de una trenza dada.
           % Entrada: braid.
           n_cross = length(br.indices_braid); 
        end
        
        function binv = inver(br)
        %INVER Obtener trenza inversa de una trenza dada.
        %Entrada: braid.
            binv = braid('');
            binv.indices_braid=-fliplr(br.indices_braid);
            binv.n_cadenas = br.n_cadenas;
        end    
    end
    
end

