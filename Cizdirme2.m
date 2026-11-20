%%
HG11_520_a = 19.331623679594003;
HG11_520_b = -0.842517083493231;

HG22_520_a = 24.142530594501817;
HG22_520_b = -0.755330656391052;

HG32_520_a = 26.625130293242890;
HG32_520_b = -0.727053632013469;

HG33_520_a = 21.418704927989928;
HG33_520_b = -0.803483996193606;

Airy_520_a = 22.619978583587919;
Airy_520_b = -0.831982768717487;

LG11_520_a = 22.095441841523776;
LG11_520_b = -0.789591516528579;

LG70_520_a = 20.649664822335453;
LG70_520_b = -0.904482575956953;

LG201_520_a = 17.206804080735282;
LG201_520_b = -0.881531729325723;

Bessel50_520_a = 16.743474307141170;
Bessel50_520_b = -0.878957482692143;

%%
loglog(V,HG11_520_a*V.^HG11_520_b,"o",'LineWidth',2)
hold on
loglog(V,HG22_520_a*V.^HG22_520_b,'LineWidth',2)
hold on
loglog(V,HG32_520_a*V.^HG32_520_b,'LineWidth',2)
hold on
loglog(V,HG33_520_a*V.^HG33_520_b,'LineWidth',2)
hold on
loglog(V,Airy_520_a*V.^Airy_520_b,'LineWidth',2)
hold on
loglog(V,LG11_520_a*V.^LG11_520_b,'LineWidth',2)
hold on
loglog(V,LG70_520_a*V.^LG70_520_b,'LineWidth',2)
hold on
loglog(V,LG201_520_a*V.^LG201_520_b,'LineWidth',2)
hold on
loglog(V,Bessel50_520_a*V.^Bessel50_520_b,"x",'LineWidth',2)
hold on
%%
xlim([0.05 1])
title('Comparision of fitted curves for different beam shapes at 520nm')
legend('HG11 520','HG22 520','HG32 520','HG33 520','Airy 520','LG11 520','LG70 520','LG201 520','Bessel50 520')
xlabel('Visibility (km)')
ylabel('Attenuation (dB/km)')
grid on ;
