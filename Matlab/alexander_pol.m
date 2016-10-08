function pol_Alexander = alexander_pol( indices_braid,n )
%ALEXANDER_POL
%ENTRADA: cadena de enteros que representa los cruces de una trenza y numero de cadenas de la trenza.
%Salida: polinomio de Alexander de la trenza. 
%See also BURAU_MATRIX
    m_burau = burau_matrix(indices_braid, n);
    N = m_burau - sym(eye(length(m_burau)));
    N_11 = N(2:length(N),2:length(N));
    pol_Alexander = det(N_11);
end

