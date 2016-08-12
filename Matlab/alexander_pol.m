function pol_Alexander = alexander_pol( indices_braid )
    m_burau = burau_matrix(indices_braid);
    N = m_burau - sym(eye(length(m_burau)));
    N_11 = N(2:length(N),2:length(N));
    pol_Alexander = det(N_11);
end

