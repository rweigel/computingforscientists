clear;
Dt = 0.01; % (units of year)
k  = 24*60*60*365.2425/1e7; % units of K/year
Ta = 2;

MAXI = 1e5;
T1(1) = 300;
t1(1) = 0;
done = 0;
i = 1;

while done == 0
    t1(i+1) = t1(i) + Dt;
	T1(i+1) = T1(i) + Dt*k*(Ta-T1(i));
	if (T1(i+1) <= 200 && T1(i) > 200)
		% Display temperature if 200 K crossed
		fprintf('t1 = %.2f; T1 = %.2f\n',t1(i),T1(i));
        fprintf('t1 = %.2f; T1 = %.2f\n\n',t1(i+1),T1(i+1));
        t1_200 = (t1(i+1)+t1(i))/2;
	end
	if (T1(i+1) <= 3 && T1(i) > 3)
		fprintf('t1 = %.2f; T1 = %.2f\n',t1(i),T1(i));
        fprintf('t1 = %.2f; T1 = %.2f\n\n',t1(i+1),T1(i+1));
        t1_3 = (t1(i+1)+t1(i))/2;
	end
	if (T1(i+1) <= 2 && T1(i) > 2)
		fprintf('t1 = %.2f; T1 = %.2f\n',t1(i),T1(i));
        fprintf('t1 = %.2f; T1 = %.2f\n',t1(i+1),T1(i+1));
		done = 1;
    end
    if (i > MAXI-10)
		fprintf('t1 = %.2f; T1 = %.16f\n',t1(i+1),T1(i+1));
    end
    if (i > MAXI)
		fprintf('t1 = %.2f; T1 = %.16f\n',t1(i+1),T1(i+1));
        break
    end
    i = i+1;
end

fprintf('------\n')
done = 0;
i = 1;
T2(1) = 300;
t2(1) = 0;
while done == 0
    Ta = 2 + t2(i);
    t2(i+1) = t2(i) + Dt;
	T2(i+1) = T2(i) + Dt*k*(Ta-T2(i));
    if (T2(i+1) <= 200 && T2(i) > 200)
		fprintf('t2 = %.2f; Ta = %.2f; T2 = %.2f\n',t2(i+1),Ta,T2(i+1));
        fprintf('t2 = %.2f; Ta = %.2f; T2 = %.2f\n',t2(i+1),Ta,T2(i+1));
        t2_200 = (t2(i+1)+t2(i))/2;
    end
	if (T2(i+1) <= 3 && T2(i) > 3)
		fprintf('t2 = %.2f; Ta = %2.f; T2 = %.2f\n',t2(i+1),Ta,T2(i+1));
        fprintf('t2 = %.2f; Ta = %.2f; T2 = %.2f\n',t2(i+1),Ta,T2(i+1));
	end
	if (T2(i+1) <= 2 && T2(i) > 2)
		fprintf('t2 = %.2f; T2 = %.2f\n',t2(i+1),T2(i+1));
    end
    if (i > MAXI)
		fprintf('t2 = %.2f; Ta = %.2f; T2 = %.2f\n',t2(i+1),Ta,T2(i+1));
        break
    end    
    i = i+1;
end

fprintf('Constant ambient temperature using Forward Euler\n');
fprintf('--\n');
fprintf('Time to cool to 200 K: %.1f years\n',t1_200);
fprintf('Time to cool to 3 K:   %.1f years\n',t1_3);
fprintf('Time to cool to 2 K: > %.1f years\n',t1(end));

fprintf('Constant ambient temperature using Forward Euler\n');
fprintf('--\n');
fprintf('Time to cool to 200 K: %.1f years\n',t2_200);
fprintf('Time to cool to 3 K:   Never (see plot)\n');
fprintf('Time to cool to 2 K:   Never (see plot)\n');

maxx = 5;
figure(1);clf;
	semilogy(t1,T1,'k','LineWidth',2);
    hold on;grid on;
	semilogy(t2,T2,'b','LineWidth',2)
    plot([0,maxx],[200,200],'Color',[0.5,0.5,0.5]);
    plot([0,maxx],[3,3],'Color',[0.5,0.5,0.5]);
    plot([0,maxx],[2,2],'Color',[0.5,0.5,0.5]);
    text(maxx,300,' 300 K')
    text(maxx,200,' 200 K')
    text(maxx,3,' 3 K')
    text(maxx,2,' 2 K')
    set(gca,'XLim',[0, maxx]);
    set(gca,'YLim',[1.5, 400]);
    xlabel('Time [years]')
	ylabel('Temperature [K]')
	legend('Constant $T_a$','Increasing $T_a$','Location','Best')
    saveplots('NewtonsLawOfCooling');