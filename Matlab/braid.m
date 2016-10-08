classdef braid<handle
    
    properties
        indices_braid = int32([]) %indices de los cruces de la trenza
        n                         % numero de cadenas de la trenza 
    end
    
    methods
        
        function br = braid(braid_cad_char, n_cadenas)
            %Contructor de la clase braid. 
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
        
        function set_n(braid_cad_char, nuevo_numero_cadenas)
        %Establecer el numero de cadenas de una trenza dada.
            disp('se hace');
            if(max(abs(braid_cad_char.indices_braid)) < nuevo_numero_cadenas)
                 braid_cad_char.n = nuevo_numero_cadenas;
            else
                disp('No es posible que dicha trenza tenga ese numero de cadenas');
                disp('Se establecera al numero minimo de cadenas necesarias');
                braid_cad_char.n = max(abs(braid_cad_char.indices_braid))+1;
            end
        end
        
        function set_indices(braid_cad_char, nuevos_indices, nuevo_numero_cadenas)
        %Establecer nuevos indices y numero de cadenas a la trenza dada. 
            braid_cad_char.indices_braid = nuevos_indices;
            switch nargin
                case 3
                    set_n(braid_cad_char, nuevo_numero_cadenas);
                case 2
                    set_n(braid_cad_char, max(abs(braid_cad_char.indices_braid))+1);
            end
        end
        
        function valor_n = get_n(braid_cad_char)
        %Obtener el numero de cadenas de una trenza dada.
            valor_n = braid_cad_char.n;
        end
        
        function valor_indices = get_indices(braid_cad_char)
        %Obtener los indices de una trenza dada. 
            valor_indices = braid_cad_char.indices_braid;
        end
        
        function asignar_trenza(braid1, braid2)
        %Asigno los valores de la trenza braid2 a la trenza braid1. 
            set_indices(braid1, braid2.indices_braid, braid2.n);
        end
        
        function binv = inver(braid_cad_char)
        %Trenza inversa de una trenza dada
            binv = braid('');
            binv.indices_braid=-fliplr(braid_cad_char.indices_braid);
            binv.n = braid_cad_char.n;
        end
        
        
    end
    
end

