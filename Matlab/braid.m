classdef braid<handle
    
    properties
        indices_braid = int32([]) %indices de los cruces de la trenza
        n % numero de cadenas de la trenza 
    end
    
    methods
        %Contructor
        function br = braid(braid_cad_char)
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
                br.n = max(abs(br.indices_braid)) +1;
            end
        end
        
        function obj = set.n(braid_cad_char, nuevos_indices)
        end
        
%         Trenza inversa de una trenza dada
%         function binv = inv(brai)
%             binv = braid('');
%             binv.indices_braid=-fliplr(brai.indices_braid);
%             binv.n = brai.n;
%         end
        
        
    end
    
end

