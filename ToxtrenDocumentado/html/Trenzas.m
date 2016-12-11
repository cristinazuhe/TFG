%% Analisis de trenzas. 
% Este módulo nos permite trabajar con el grupo de trenzas (trenza). 
% Disponemos de los siguientes métodos:

%%   asignar_trenza - Asigno los valores de la trenza2 a la trenza1.  
        %Asigno los valores de la trenza2 a la trenza1. 
        %Entrada: trenza1 y trenza2.
%%   dehornoy - Reducción Dehornoy de una trenza dada. 
        %Reducción Dehornoy de una trenza dada. 
        %Entrada: trenza, número de cortes, radio de la trenza y bool para representar o no las transformaciones.
        %Salida: bool que indica si la trenza es trivial y reducción dehornoy de la trenza.
%%   equivalentes - Comprobar si dos trenzas dadas son o no.
        %Comprobar si dos trenzas dadas son o no equivalentes. 
        %Entrada: trenza1 y trenza2. 
%%   es_trivial - Comprobar si una trenza dada es o no equivalente a la trenza trivial.
        %Comprobar si una trenza dada es o no equivalente a la trenza trivial.
        %Entrada: trenza.
%%   exp - Exponente de una trenza dada.
        %Exponente de una trenza dada. 
        %Entrada: trenza.
%%   get_indices - Obtener los índices de una trenza dada.  
        %Obtener los índices de una trenza dada. 
        %Entrada: trenza.
%%   get_n - Obtener el número de cadenas de una trenza dada.
        %Obtener el número de cadenas de una trenza dada.
        %Entrada: trenza.
%%   inver - Obtener trenza inversa de una trenza dada.
        %Obtener trenza inversa de una trenza dada.
        %Entrada: trenza.
%%   length - Obtener número de cruces de una trenza dada.
        %Obtener número de cruces de una trenza dada.
        %Entrada: trenza.
%%   matriz_burau - Matriz Burau de una trenza dada. 
        %Matriz Burau de una trenza dada. 
        %Entrada: trenza.
%%   perm - Permutación de una trenza dada.
        %Permutación de una trenza dada. 
        %Entrada: trenza.
%%   pote - Obtener la trenza potencia de una trenza dada.
        %Obtener la trenza potencia de una trenza dada. 
        %Entrada: trenza y exponente de la potencia. 
%%   producto - Obtener la trenza producto de dos trenzas dadas. 
        %Obtener la trenza producto de dos trenzas dadas.  
        %Entrada: trenza1 y trenza2. 
%%   pura - Comprobar si una trenza dada es pura.
        %Comprobar si una trenza dada es pura.
        %Entrada: trenza.
%%   representar_trenza - Representación 3D de la trenza.
        %Representación 3D de la trenza.
        %Entrada: trenza, número de cortes y radio de la trenza.
%%   set_indices - Establece nuevos índices y número de cadenas a la trenza dada.
        %Establece nuevos índices y número de cadenas a la trenza dada. 
        %Entrada: trenza, nuevos cruces de la trenza y número de cadenas que establecemos a dicha trenza.  
%%   set_n - Establece el número de cadenas de una trenza dada.
        %Establece el número de cadenas de una trenza dada.
        %Entrada: trenza y número de cadenas que establecemos a dicha trenza. 
%%   trenza - Constructor de la clase trenza.  
        %Constructor de la clase trenza. 
        %Entrada: cadena que representa a una trenza y número de cadenas de la trenza (este parametro se puede omitir).
