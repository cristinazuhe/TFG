br1=trenza_cerrada([ -3 2 1]);
br2=trenza_cerrada([-2 -1]);

            t = sym('t');

pol1 = Alexander(br1);
pol2 = Alexander(br2);
disp(pol1);disp(pol2);

 temp1 = pol1 - pol2;
 if(temp1==0)
     disp('se');
 end