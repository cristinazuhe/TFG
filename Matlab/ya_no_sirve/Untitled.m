br1=trenza_cerrada([ 3 2 1]);
br2=trenza_cerrada([ 1 2 3 2]);

pol1 = Alexander(br1);
pol2 = Alexander(br2);

nu1=numden(pol1);
nu2=numden(pol2);
 if(nu1==nu2 || nu1==(-1)*nu2)
     disp('igual pol');
 end