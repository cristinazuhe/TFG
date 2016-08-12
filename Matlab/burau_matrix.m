function m_burau = burau_matrix( indices_braid )
    n_cross = length(indices_braid);
    n_trenzas =  max(abs(indices_braid)) +1;

    indice = abs(indices_braid(1));
    m_burau = sym(eye(n_trenzas));
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
        aux = sym(eye(n_trenzas));
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

