%% Ejemplo de uso de la clase trenza. 

%% Constructor y representar_trenza.
%Creamos una trenza y la representamos.
trenza_a = trenza([2 -1])
trenza_a.representar_trenza
    
%% get_n
% Obtenemos el número de cadenas de la trenza.
trenza_a.get_n
    
%% get_indices
% Obtenemos los índices de la trenza.
trenza_a.get_indices
    
%% length
% Obtenemos el número de cruces de la trenza.
trenza_a.length
    
%% inver
%Obtenemos la trenza inversa de la trenza.
trenza_a.inver
    
%% set_n
% Modificamos el número de cadenas de la trenza.
set_n(trenza_a,5)
trenza_a

%% set_indices
% Modificamos los índices de la trenza.
set_indices(trenza_a,[-1 2])
trenza_a

%% perm
% Obtenemos la permutación de la trenza.
trenza_a.perm

%% pura 
% Comprobamos si la trenza es pura.
trenza_a.pura

%% exp 
% Obtenemos el exponente de la trenza.
trenza_a.exp

%% matriz_burau
% Obtenemos la matriz de Burau de la trenza.
trenza_a.matriz_burau

%% asignar_trenza
% Creamos otra trenza y asignamos la nueva a la trenza anterior.
trenza_b = trenza('+s3-s1+s2+s1');
asignar_trenza(trenza_a,trenza_b);
trenza_a
trenza_b

%% equivalentes
% Comprobamos si las trenzas son equivalentes.
equivalentes(trenza_a,trenza_b)

%% dehornoy 
% Obtenemos la reducción Dehornoy de la trenza.
warning ('off','all');
[es_trivial, reduccionDeh]=dehornoy(trenza_a,20,0.5,true);
reduccionDeh

%% es_trivial
% Comprobamos si la trenza es trivial. 
trenza_a.es_trivial

%% pote
% Obtenemos la trenza potencia de la trenza.
pote(trenza_a,3)

%% producto 
% Obtenemos la trenza producto de dos trenzas.
producto(trenza_a,trenza_b)

%%


