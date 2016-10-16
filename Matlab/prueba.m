a=trenza_cerrada([-2 2 2 1 -2 2]);
equi = es_trivial(a);

%Veo si es trivial o no la trenza tras aplicar dehornoy
if(equi==2)
  [e, final] = dehornoy(a,20,0.5,false);
  a2 = trenza_cerrada(final);
  equi = es_trivial(a2);
end


%Aplico movimiento 2 de Markov tantas veces como sea posible
repite = true;
vale_d=true; vale_i=true;
if(equi==2)
    while(repite)
        if(length(a2.get_indices)==1)
            equi = 1;
            return;
        end
        m=max(abs(a2.get_indices));
        aux = a2.get_indices;
        apariciones = find(abs(aux)==m);
        if(length(apariciones) == 1)
            if(apariciones == 1 || apariciones == length(a2)) %El mayor cruce esta al principio o al final. Borro directo
                aux(apariciones)=[];
            else
                for i=1:1:apariciones
                    if(vale_i)
                        if(aux(i) == m-1)
                            vale_i = false;
                        end
                    end
                end
                if(vale_i)
                    aux(apariciones)=[];
                    vale_d=false;
                else   
                    for i=apariciones:1:length(aux)
                        if(vale_d)
                            if(aux(i) == m-1)
                                vale_d = false;
                            end
                        end
                    end
                    if(vale_d)
                        aux(apariciones)=[];
                    end
                end

            end
        end

        a3 = trenza_cerrada(aux);
        equi = es_trivial(a3);
        if(length(a3.get_indices) ~= length(a2.get_indices))
            repite=true;
            a2=a3;
        else
            repite=false;
        end
    end
end


