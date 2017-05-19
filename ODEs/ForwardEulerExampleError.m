clear;
Dtvals  = 0.1./10.^[0:5]; % Dt values to try
% or
%Dtvals = [0.1,0.01,0.001,0.0001,0.00001];

a = 0.9;
tfe(1) = 0;
yfe(1) = 1.1;

for k = 1:length(Dtvals)
    Dt  = Dtvals(k);
    tfe = [0:Dt:0.3];
    for i = 1:length(tfe)-1 % -1 here because of i+1 in yfe below.
        yfe(i+1) = yfe(i) + Dt*a*tfe(i);
    end

    yex = a*tfe.^2/2 + 1.1; 

    % Relative difference between final points
    Erel(k) = abs(yfe(end)-yex(end))/yex(end);

    % Display error in console window
    fprintf('Dt = %.1e, Error = %.1e\n',Dt,Erel(k));
end

figure(1);clf;
    loglog(Dtvals,Erel,'k.','MarkerSize',30);
    grid on;
    title('$dy/dt = 0.9t; y(t=0) = 1.1$');    
    xlabel('$\Delta t$');
    legend('Error = $| \frac{y_{euler}(0.3)-y_{exact}(0.3)}{y_{exact}(0.3)} |$',...
        'Location','NorthWest')
    ylabel('Error');
    
saveplots('ForwardEulerExampleError')