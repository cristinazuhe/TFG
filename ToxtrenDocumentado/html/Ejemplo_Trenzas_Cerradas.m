%% Ejemplo de uso de la clase trenza cerrada. 

%% Constructor y representar_trenza cerrada.
warning('off','all')
trenzacerrada_a=trenza_cerrada([3 -1 1])
trenzacerrada_a.representar_trenza

%% inver
%Obtenemos la trenza cerrada inversa de la trenza cerrada.
trenzacerrada_a.inver

%% set_indices
% Modificamos los índices de la trenza cerrada.
set_indices(trenzacerrada_a,[7 -2])
trenzacerrada_a

%% asignar_trenza
% Creamos otra trenza cerrada y asignamos la nueva a la trenza cerrada anterior.
trenzacerrada_b = trenza_cerrada('-s1+s2+s3')
asignar_trenza(trenzacerrada_a,trenzacerrada_b)
trenzacerrada_a

%% equivalentes
% Comprobamos si las trenzas cerradas son equivalentes.
equivalentes(trenzacerrada_a,trenzacerrada_b)

%% es_trivial
% Comprobamos si la trenza cerrada es trivial. 
trenzacerrada_a.es_trivial

%% pote
% Obtenemos la trenza cerrada potencia de la trenza cerrada.
pote(trenzacerrada_a,3)

%% producto 
% Obtenemos la trenza cerrada producto de dos trenzas cerradas.
producto(trenzacerrada_a,trenzacerrada_b)

%% Dowker
% Obtenemos la notación Dowker de la trenza cerrada. 
trenzacerrada_a.Dowker

%% Alexander
% Obtenemos el polinomio de Alexander de la trenza cerrada. 
trenzacerrada_a.Alexander