classdef braid<handle
    
    properties
        indices_braid = int32([]) %indices de los cruces de la trenza
        n                         % numero de cadenas de la trenza 
    end
    
    methods
        
        function br = braid(braid_cad_char, n_cadenas)
            %Contructor de la clase braid. 
            %Entrada: cadena que representa a una trenza y numero de
            %cadenas de la trenza.
            %Ejemplo: braid([+s1-s2],4)
            if nargin == 0, return; end;
            if(isempty(braid_cad_char))  %Introducimos la trenza trivial como ''
                br.indices_braid=[];
                br.n = 0;
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
                    if(n_cadenas <= max(abs(br.indices_braid))) 
                       br.n = max(abs(br.indices_braid)) +1;
                    else
                        br.n = n_cadenas;
                    end
                case 1
                    br.n = max(abs(br.indices_braid)) +1;
                end
                        
            end
        end
        
        function set_n(br, nuevo_numero_cadenas)
        %Establecer el numero de cadenas de una trenza dada.
        %Entrada: braid y numero de cadenas que establecemos a dicha
        %trenza. 
            if(max(abs(br.indices_braid)) < nuevo_numero_cadenas)
                 br.n = nuevo_numero_cadenas;
            else
                disp('No es posible que dicha trenza tenga ese numero de cadenas');
                disp('Se establecera al numero minimo de cadenas necesarias');
                br.n = max(abs(br.indices_braid))+1;
            end
        end
        
        function set_indices(br, nuevos_indices, nuevo_numero_cadenas)
        %Establecer nuevos indices y numero de cadenas a la trenza dada. 
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
        %Obtener el numero de cadenas de una trenza dada.
        %Entrada: braid.
            valor_n = br.n;
        end
        
        function valor_indices = get_indices(br)
        %Obtener los indices de una trenza dada. 
        %Entrada: braid.
            valor_indices = br.indices_braid;
        end
        
        function asignar_trenza(br1, br2)
        %Asigno los valores de la trenza braid2 a la trenza braid1. 
        %Entrada: braid1 y braid2. 
            set_indices(br1, br2.indices_braid, br2.n);
        end
        
        function binv = inver(br)
        %Trenza inversa de una trenza dada.
        %Entrada: braid.
            binv = braid('');
            binv.indices_braid=-fliplr(br.indices_braid);
            binv.n = br.n;
        end
        
        
    end
    
end

