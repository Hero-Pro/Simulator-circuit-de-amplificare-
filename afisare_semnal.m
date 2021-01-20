function afisare_semnal(A,f, Ep, Em,tip,R1,R2)
Tc = 1 / f;  % sec
Tm = 1 / 60;

t = 0:Tc/25:2*Tm;

Vin = zeros(1, length(t));
if tip==1
    Vin=A*sin(2 * pi * f  *t);
end
if tip==2
    Vin=A*square(2*pi*f*t);

end
Vout= zeros(1, length(t));

    for i=1:length(t)
                Vout(i)=-(R2/R1)*Vin(i);
    end
    verificare=(R2/R1)*A;

 for i=1:length(t)
     if Vout(i)>Ep
         Vout(i)=Ep;
     else
         if Vout(i)<Em
             Vout(i)=Em;
         else
             Vout(i)=Vout(i);
         end
         
     end
 end
 
        


     
subplot('Position',[0.7 0.6 0.27 0.3])
    plot(t,Vout,'Color','b','LineWidth',0.5)
    title('Semnal de iesire')
    xlabel('timp [s]');   
    ylabel('Amplitudine [V]'); 
    grid on
    hold off
subplot('Position',[0.05 0.6 0.27 0.3])
    plot(t,Vin,'Color','b','LineWidth',0.7) 
    title('Semnal de intrare')
    xlabel('timp [s]');   
    ylabel('Amplitudine [V]'); 
    grid on
    hold off


    if  verificare>abs(Ep)
    atentie1=uicontrol('Style','text',... 
    'Units','normalized',... 
    'Position',[0.467 0.18 0.2 0.05],...
    'FontSize',12,... 
    'backgroundcolor','#CDCDCD',... 
    'foregroundcolor','black',... 
    'String','Se limiteaza semnalul de iesire pe alternata pozitiva');
else
    atentie1=uicontrol('Style','text',... 
    'Units','normalized',... 
    'Position',[0.467 0.18 0.2 0.05],...
    'FontSize',12,... 
    'backgroundcolor','#CDCDCD',... 
    'foregroundcolor','black',... 
    'String','');
    end
%Aver2    
if  verificare>abs(Em)
    atentie2=uicontrol('Style','text',... 
    'Units','normalized',... 
    'Position',[0.45 0.1 0.2 0.05],...
    'FontSize',12,... 
    'backgroundcolor','#CDCDCD',... 
    'foregroundcolor','black',... 
    'String','Se limiteaza semnalul de iesire pe alternanta negativa');
else
    atentie2=uicontrol('Style','text',... 
    'Units','normalized',... 
    'Position',[0.45 0.1 0.2 0.05],...
    'FontSize',12,... 
    'backgroundcolor','#CDCDCD',... 
    'foregroundcolor','black',... 
    'String','       ');
end
end

