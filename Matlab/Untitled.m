clear all;
%[a2,equi]=MV1(a);

a=trenza_cerrada([-1 2 1 1]);
explicacion=false;
equi = es_trivial(a,explicacion);
contador=0;

    while(contador<1 && equi==2)
        if(contador~=0)
            asignar_trenza(a,a3);
        end
      % Aplico movimiento 1 de Markov. 
        if(equi==2)
            if(explicacion)
                disp('Hago MV1');
            end
            [a1,equi]=MV1(a);
            equi = es_trivial(a1,explicacion);
        end
      %  Veo si es trivial o no la trenza tras aplicar dehornoy
        if(equi==2)
          [e, final] = dehornoy(a1,20,0.5,false);
          a2 = trenza_cerrada(final);
          equi = es_trivial(a2,explicacion);
        end

      %  Aplico movimiento 2 de Markov tantas veces como sea posible
        if(equi==2)
            if(explicacion)
                disp('Hago MV2');
            end
            [a3,equi] = MV2(a2);
            equi = es_trivial(a3,explicacion);
        end
      % Aplico movimiento 1 de Markov. 
        if(equi==2)
            if(explicacion)
                disp('Hago MV1');
            end
            [a4,equi]=MV1(a3, true);
            equi = es_trivial(a4,explicacion);
        end
        contador=contador+1;
    end


















