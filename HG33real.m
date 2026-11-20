clear
format long

airy1 = readtable('data/Power690_airy.txt','PreserveVariableNames',true);
power1_690_all = table2array(airy1(1:end,1));
power1_532_all = table2array(airy1(1:end,2));
time1_all = table2array(airy1(1:end,3));

 gaus2 = readtable('data/HG33_08_08_24.txt','PreserveVariableNames',true);
 power2_690_all = table2array(gaus2(1:end,1));
 power2_532_all = table2array(gaus2(1:end,2));
 time2_all = table2array(gaus2(1:end,3));

%% Plot Normalized Power vs. time for all sample

data1_first = 10;
power1_532 = power1_532_all(data1_first:end,1);
power1_690 = power1_690_all(data1_first:end,1);
time1 = time1_all(data1_first:end,1);

norpower1_532 = power1_532 / max(power1_532);
norpower1_690 = power1_690 / max(power1_690);

plot(time1,norpower1_532,'.')
hold on
plot(time1,norpower1_690,'.')
title("Normalized Power vs. time for Airy 690")
hold on

%%
data2_first = 10;
power2_532 = power2_532_all(data2_first:end,1);
power2_690 = power2_690_all(data2_first:end,1);
time2 = time2_all(data2_first:end,1);

 norpower2_532 = power2_532 ./ max(power2_532);
 norpower2_690 = power2_690 ./ max(power2_690);
 plot(time2,norpower2_532,'.')
 hold on
 plot(time2,norpower2_690,'.')

legend('532','690-HG32');
xlabel('Time');
ylabel('Power(uW)');

%% Plot Attenuation vs. Visibility for the selected time interval

data1_first = 21001;
data1_last = 28000;

power1_532 = power1_532_all(data1_first:data1_last,1);
power1_690 = power1_690_all(data1_first:data1_last,1);
time1 = time1_all(data1_first:data1_last,1);

T1_690 = abs(power1_690) ./ max(power1_690);
T1_532 = abs(power1_532) ./ max(power1_532);
A1_532 = -10*log10(T1_532) ./ (4.343*0.003);
V1_532 = -10*log10(0.02) ./ A1_532 ;
alpha1_690 = -log(T1_690) ./ 0.003;

loglog(V1_532,alpha1_690,'.')
hold on
xlabel('Visibility (km)')
ylabel('Attenuation (dB/km)')
title('Attenuation vs. Visibility for Selected Time Interval-Airy')
legend("Airy");
%%
data2_first = 40907;
data2_last = 49040;
%
power2_532 = power2_532_all(data2_first:data2_last,1);
power2_690 = power2_690_all(data2_first:data2_last,1);
time2 = time2_all(data2_first:data2_last,1);

T2_690 = abs(power2_690) ./ max(power2_690);
T2_532 = abs(power2_532) ./ max(power2_532);
A2_532 = -10*log10(T2_532) ./ (4.343*0.003);
V2_532 = -10*log10(0.02) ./ A2_532 ;
alpha2_690 = -log(T2_690) ./ 0.003;

loglog(V2_532,alpha2_690,'.')
title('Attenuation vs. Visibility for Selected Time Interval-Gaussian')
xlabel('Visibility');
ylabel('Attenuation');
legend("HG33");
%% Plot Normalized Mean Power vs. Mean time for the selected time interval

delta = 10;
length1_mean_delta = double(length(power1_532)/delta);

power1_mean_532 = zeros(length1_mean_delta,1);
for i = 1:length1_mean_delta
    first_i = 1 + delta*(i-1);
    last_i =  i*delta;
    mean_i = mean(power1_532(first_i:last_i,1),"all");
    power1_mean_532(i,1) = mean_i;
end

power1_mean_690 = zeros(length1_mean_delta,1);
for i = 1:length1_mean_delta
    first_i = 1 + delta*(i-1);
    last_i =  i*delta;
    mean_i = mean(power1_690(first_i:last_i,1),"all");
    power1_mean_690(i,1) = mean_i;
end

time1_mean = zeros(length1_mean_delta,1);
for i = 1:length1_mean_delta
    first_i = 1 + delta*(i-1);
    last_i =  i*delta;
    mean_i = mean(time1(first_i:last_i,1),"all");
    time1_mean(i,1) = mean_i;
end

plot(time1_mean,power1_mean_532/max(power1_mean_532),'y.')
hold on
plot(time1_mean,power1_mean_690/max(power1_mean_690),'g')
hold on
%%

length2_mean_delta = floor(length(power2_532)/delta);

power2_mean_532 = zeros(length2_mean_delta,1);
for i = 1:length2_mean_delta
    first_i = 1 + delta*(i-1);
    last_i =  i*delta;
    mean_i = mean(power2_532(first_i:last_i,1),"all");
    power2_mean_532(i,1) = mean_i;
end

power2_mean_690 = zeros(length2_mean_delta,1);
for i = 1:length2_mean_delta
    first_i = 1 + delta*(i-1);
    last_i =  i*delta;
    mean_i = mean(power2_690(first_i:last_i,1),"all");
    power2_mean_690(i,1) = mean_i;
end

time2_mean = zeros(length2_mean_delta,1);
for i = 1:length2_mean_delta
    first_i = 1 + delta*(i-1);
    last_i =  i*delta;
    mean_i = mean(time2(first_i:last_i,1),"all");
    time2_mean(i,1) = mean_i;
end

plot(time2_mean,power2_mean_532/max(power2_mean_532),'r.')
hold on
plot(time2_mean,power2_mean_690/max(power2_mean_690),'g.')

legend('532-HG32','690');
xlabel('time');
ylabel('Power(uW)');

%% Plot Mean Attenuation vs. Mean Visibility for the selected time interval

% calculate the visibility of 532 nm beam as a refence
T1_532_mean = abs(power1_mean_532)  ./ max(power1_mean_532);
A1_532_mean = -10*log10(T1_532_mean) ./ (4.343*0.003);
V1_532_mean = -10*log10(0.02) ./ A1_532_mean ;

% Calculate the atteanuation of 690 nm beam
T1_690_mean = abs(power1_mean_690) ./ max(power1_mean_690);
alpha1_690_mean = -log(T1_690_mean) ./ 0.003;

loglog(V1_532_mean, alpha1_690_mean,'.')
hold on
%
 T2_532_mean = abs(power2_mean_532)  ./ max(power2_mean_532);
 A2_532_mean = -10*log10(T2_532_mean) ./ (4.343*0.003);
 V2_532_mean = -10*log10(0.02) ./ A2_532_mean ;

 T2_690_mean = abs(power2_mean_690) ./ max(power2_mean_690);
 alpha2_690_mean = -log(T2_690_mean) ./ 0.003;

 loglog(V2_532_mean, alpha2_690_mean,'.')

xlim([0.05 1])
legend('1st Trail- Airy', '2nd Trail-HG32');
xlabel('Visibility (km)');
ylabel('Attenuation (dB/km)');
title('Plot Mean Attenuation vs. Mean Visibility');

%%
%V1_less_1 = [];
%alpha1_Vl1 = [];

%for i=1:length(V1_532_mean)
  %  V1 = V1_532_mean(i);
  %  alpha1 = alpha1_690_mean(i);
  %  if (V1>0.05) && (V1<1)
  %  V1_less_1 = [V1_less_1; V1];
   % alpha1_Vl1 = [alpha1_Vl1; alpha1];
   % else
    %end
% end

%loglog(V1_less_1, alpha1_Vl1,'.')
%hold on
%

V2_less_1= [];
alpha2_Vl1 = [];
%
for i=1:length(V2_532_mean)
     V2 = V2_532_mean(i);
     alpha2 = alpha2_690_mean(i);
     if (V2>0.05) && (V2<1)
     V2_less_1 = [V2_less_1; V2];
     alpha2_Vl1 = [alpha2_Vl1; alpha2];
     else
     end
  end

 loglog(V2_less_1, alpha2_Vl1,'*')

xlim([0.05 1])
xlabel('Visibility (km)');
ylabel('Attenuation (dB/km)');
title('mean att vs mean vis ')
legend('HG33');
%% Fit the data
% Pozitif değerleri seçin
positive_indices_1 = (V1_532 > 0) & (alpha1_690 > 0);
V1_532_pos = V1_532(positive_indices_1);
alpha1_690_pos = alpha1_690(positive_indices_1);

positive_indices_2 = (V2_532 > 0) & (alpha2_690 > 0);
V2_532_pos = V2_532(positive_indices_2);
alpha2_690_pos = alpha2_690(positive_indices_2);

% Logaritmik dönüşüm
log_V1_532 = log(V1_532_pos);
log_alpha1_690 = log(alpha1_690_pos);

log_V2_532 = log(V2_532_pos);
log_alpha2_690 = log(alpha2_690_pos);

% Airy ışın verileri için fit işlemi
coeffs1 = polyfit(log_V1_532, log_alpha1_690, 1);
b1 = coeffs1(1);  % Eğim (slope)
log_a1 = coeffs1(2);  % Y-ekseni kesişim noktası (intercept)
a1 = exp(log_a1);  % a değerini hesapla

% HG33 ışın verileri için fit işlemi
coeffs2 = polyfit(log_V2_532, log_alpha2_690, 1);
b2 = coeffs2(1);  % Eğim (slope)
log_a2 = coeffs2(2);  % Y-ekseni kesişim noktası (intercept)
a2 = exp(log_a2);  % a değerini hesapla

x = logspace(log10(0.01), log10(1), 100);  % Görünürlük aralığını tanımlayın

figure;
loglog(V1_532_mean, alpha1_690_mean, '*')
hold on
loglog(x, a1*x.^b1, 'LineWidth', 2)
loglog(V2_532_mean, alpha2_690_mean, '.')
loglog(x, a2*x.^b2, 'LineWidth', 2)

xlim([0.05 1])
ylim([10 1000])

font_size = 20;
fontsize(gca, font_size, 'points')
legend('Experimental Data Airy', 'Fitted Curve Airy', 'Experimental Data HG33', 'Fitted Curve HG32', 'FontSize', font_size);
xlabel('Visibility (km)', 'FontSize', font_size);
ylabel('Attenuation (dB/km)', 'FontSize', font_size);
title("Attenuation coefficient with respect to visibility")
grid on

%% Fit the

x = logspace(log10(0.01), log10(1), 100);  % Görünürlük aralığını tanımlayın

figure;
loglog(V1_532_mean, alpha1_690_mean, '.', 'MarkerSize', 14)
hold on
loglog(x, a1*x.^b1, 'LineWidth', 2)

ymax = 1000;
ymin = 10;

% Add shaded area between 0.5 and 1 km
x_shade_med = [0.5, 1, 1, 0.5];
y_shade_med = [ymin, ymin, ymax, ymax];
fill(x_shade_med, y_shade_med, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none')

% Add shaded area between 0.01 and 0.5 km
x_shade_den = [0.01, 0.5, 0.5, 0.01];
y_shade_den = [ymin, ymin, ymax, ymax];
fill(x_shade_den, y_shade_den, 'k', 'FaceAlpha', 0.3, 'EdgeColor', 'none')

xlim([0.05 1])
ylim([ymin ymax])

font_size = 20;
fontsize(gca, font_size, 'points')
legend('Experimental Data', 'Fitted Curve', 'FontSize', font_size);
xlabel('Visibility (km)', 'FontSize', font_size);
ylabel('Attenuation (dB/km)', 'FontSize', font_size);
title("Attenuation coefficient with respect to visibility for airy beam at 690 nm")
grid on
%% Grafiğin Çizilmesi hg 33

x = logspace(log10(0.01), log10(1), 100);  % Görünürlük aralığını tanımlayın

figure;
loglog(V2_532_mean, alpha2_690_mean, '.')
hold on
loglog(x, a2*x.^b2, 'LineWidth', 2)

xlim([0.05 1])
ylim([10 1000])
x_shade_med = [0.5, 1, 1, 0.5];
y_shade_med = [ymin, ymin, ymax, ymax];
fill(x_shade_med, y_shade_med, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none')

% Add shaded area between 0.01 and 0.5 km
x_shade_den = [0.01, 0.5, 0.5, 0.01];
y_shade_den = [ymin, ymin, ymax, ymax];
fill(x_shade_den, y_shade_den, 'k', 'FaceAlpha', 0.3, 'EdgeColor', 'none')

font_size = 20;
fontsize(gca, font_size, 'points')
legend('Experimental Data HG33', 'Fitted Curve HG33', 'FontSize', font_size);
xlabel('Visibility (km)', 'FontSize', font_size);
ylabel('Attenuation (dB/km)', 'FontSize', font_size);
title("Attenuation coefficient with respect to visibility for HG33 beam at 690 nm")
grid on
