V = [0:0.01:100]';

HG22_690_a = 16.007126236004297;
HG22_690_b = -0.848478916000244;

HG32_690_a = 13.358711714115239;
HG32_690_b = -0.913509809734665;

Airy_690_a = 17.896479083664428;
Airy_690_b = -0.740437783281156;

Bessel50_690_a = 17.214618812723543;
Bessel50_690_b = -0.883141797363626;

Bessel50_520_a = 16.743474307141170;
Bessel50_520_b = -0.878957482692143;

LG201_520_a = 17.206804080735282;
LG201_520_b = -0.881531729325723;

HG11_520_a = 19.331623679594003;
HG11_520_b = -0.842517083493231;

%%
loglog(V,HG22_690_a*V.^HG22_690_b,'LineWidth',2)
hold on
loglog(V,HG32_690_a*V.^HG32_690_b,'LineWidth',2)
hold on
loglog(V,Airy_690_a*V.^Airy_690_b,'LineWidth',2)
hold on
loglog(V,Bessel50_690_a*V.^Bessel50_690_b,'LineWidth',2)
hold on
loglog(V,HG11_520_a*V.^HG11_520_b,"o",'LineWidth',2)
hold on
loglog(V,LG201_520_a*V.^LG201_520_b,'LineWidth',2)
hold on
loglog(V,Bessel50_520_a*V.^Bessel50_520_b,"x",'LineWidth',2)
hold on
%%
xlim([0.05 1])
title('Comparision of fitted curves for different beam shapes at 690nm and 520nm')
legend('HG22 690','HG32 690','Airy 690','Bessel50 690','HG11 520','LG201 520','Bessel50 520')
xlabel('Visibility (km)')
ylabel('Attenuation (dB/km)')
grid on ;
