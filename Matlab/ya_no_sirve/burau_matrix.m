function m_burau = burau_matrix( indices_braid, n )
%BURAU_MATRIX
%Entrada: cadena de enteros que representa los cruces de una trenza y numero de cadenas de la trenza.
%Salida: matriz Burau de la trenza. 
    n_cross = length(indices_braid);

    indice = abs(indices_braid(1));
    m_burau = sym(eye(n));
    t = sym('t');
    if(indices_braid(1) > 0 )
        m_burau(indice,indice) = 1-t;
        m_burau(indice,indice+1) = t;
        m_burau(indice+1,indice) = 1;
        m_burau(indice+1,indice+1) = 0;
    else
        m_burau(indice,indice) = 0;
        m_burau(indice,indice+1) = 1;
        m_burau(indice+1,indice) = t^-1;
        m_burau(indice+1,indice+1) = 1-t^-1;
    end

    for i=2:n_cross
        indice = abs(indices_braid(i));
        aux = sym(eye(n));
        if(indices_braid(i) > 0 )
            aux(indice,indice) = 1-t;
            aux(indice,indice+1) = t;
            aux(indice+1,indice) = 1;
            aux(indice+1,indice+1) = 0;
        else
            aux(indice,indice) = 0;
            aux(indice,indice+1) = 1;
            aux(indice+1,indice) = t^-1;
            aux(indice+1,indice+1) = 1-t^-1;
        end
        m_burau = m_burau*aux;
    end
    m_burau = simplify(m_burau);

end

