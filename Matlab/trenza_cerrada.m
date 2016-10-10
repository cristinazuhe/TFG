classdef trenza_cerrada<trenza
    
    properties (Dependent)
      n_enlaces;              % numero de enlaces de una trenza cerrada. 
    end
    
    properties (Access=private)
      private_n_enlaces = 0;
    end
    
    methods
        function br_c = trenza_cerrada(trenza_cad_char, n_cad)
            if (nargin == 1)
                if(~ischar(trenza_cad_char) && ~isa(trenza_cad_char,'double'))
                    n_cad = get_n(trenza_cad_char);
                    trenza_cad_char = get_indices(trenza_cad_char);
                else
                     n_cad = 0;
                end
            end
            br_c@trenza(trenza_cad_char, n_cad); 
            br_c.private_n_enlaces = 10; %Aqui tendria que calcular el numero de enlaces que tenga la trenza. 
        end
        
        function set.n_enlaces(br_c, nuevo_n_enlaces) %trenza.n_enlaces=nuevo Establezco el numero de enlaces de trenza a nuevo
           br_c.private_n_enlaces = nuevo_n_enlaces;
        end
         
        function valor = get.n_enlaces(br_c)   %trenza.n_enlaces Obtengo el numero de enlaces de trenza
            valor = br_c.private_n_enlaces;
        end
        
        function pol_Alexander = Alexander(br_c)
        %ALEXANDER_POL Polinomio de Alexander de una trenza dada. 
        %ENTRADA: trenza.
        %See also TRENZA.MATRIZ_BURAU
            m_burau = matriz_burau(br_c);
            N = m_burau - sym(eye(length(m_burau)));
            N_11 = N(2:length(N),2:length(N));
            pol_Alexander = det(N_11); 
        end
        
        %si dos trenzas no son equivalentes, puede que sus cierres sí lo
        %sean. Necesito hacer algun metodo para esto. Sobreescribir metodo
        %equivalente.
        
        %Ademas la representacion va a ser distinta. Sobreescribir metodo
        %representar. 
        
        %Calcular el numero de enlaces de una trenza cerrada.
        
        %Poner la notacion de Dowker.
        
    end %fin metodos
    
end

