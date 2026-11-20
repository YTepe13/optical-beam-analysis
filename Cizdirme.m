V = [0:0.01:100]';
HG11_690_a = 19.759125020129659;
HG11_690_b = -0.876196145095225;

HG22_690_a = 16.007126236004297;
HG22_690_b = -0.848478916000244;

HG32_690_a = 13.358711714115239;
HG32_690_b = -0.913509809734665;

HG33_690_a = 20.743256790893668;
HG33_690_b = -0.800434709908959;

Airy_690_a = 17.896479083664428;
Airy_690_b = -0.740437783281156;

LG11_690_a = 28.325806323335676;
LG11_690_b = -0.740437783281156;

LG70_690_a = 23.338989329649120;
LG70_690_b = -0.749464547799194;

LG201_690_a = 23.291499021709051;
LG201_690_b = -0.792572798405487;

Bessel50_690_a = 17.214618812723543;
Bessel50_690_b = -0.883141797363626;

%%
loglog(V,HG11_690_a*V.^HG11_690_b,"o",'LineWidth',2)
hold on
loglog(V,HG22_690_a*V.^HG22_690_b,'LineWidth',2)
hold on
loglog(V,HG32_690_a*V.^HG32_690_b,'LineWidth',2)
hold on
loglog(V,HG33_690_a*V.^HG33_690_b,'LineWidth',2)
hold on
loglog(V,Airy_690_a*V.^Airy_690_b,'LineWidth',2)
hold on
loglog(V,LG11_690_a*V.^LG11_690_b,'LineWidth',2)
hold on
loglog(V,LG70_690_a*V.^LG70_690_b,'LineWidth',2)
hold on
loglog(V,LG201_690_a*V.^LG201_690_b,'LineWidth',2)
hold on
loglog(V,Bessel50_690_a*V.^Bessel50_690_b,'x','LineWidth',2)
hold on
%%
xlim([0.05 1])
title('Comparision of fitted curves for different beam shapes at 690nm')
legend('HG11 690','HG22 690','HG32 690','HG33 690','Airy 690','LG11 690','LG70 690','LG201 690','Bessel50 690')
xlabel('Visibility (km)')
ylabel('Attenuation (dB/km)')
grid on ;
