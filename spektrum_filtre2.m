function [fshift,xxshift] = spektrum_filtre2(signal,t,fs,ECG)
%% görültülü sinyalin spektrumu
%figure(1)
n = length(signal);
%y=ones(1,n);
%y1=ecg_signals_noise(1,:);
%y = fft(signal); % spektrum 
%plot(t,abs(y)); % t yi baz alarak çiz, abs mutlak deðer
%title('görültülü sinyalimin spektrumu')
%f=(0:length(y)-1)*fs/n; % anlaþýlýr görüntü için f oluþturuldu
%figure(2)
%plot(f,abs(y)); % spektrumu çiz / örnekleme frenkasýný baz alarak daha düzgün bir görüntü
%title('kayýk spektrum');
%% spektrum shift etme iþlemi

%yshift = fftshift(y); % shift iþlemi
fshift = (-n/2:n/2-1)*fs/n; %orta noktyý 0 yapmak için f shift edildi
%figure(3) 
%plot(fshift,abs(yshift)); % düzgün spektrum
%title('görültülü sinyalin spektrumu');
%% filtreleme icin sinyal analizi katsayilarin belirlenmesi




%% ECG nin sepktrumu
xx=fft(ECG);  %spektrumu
xxshift=fftshift(xx); % shift edilmiþ spektrum
%figure(5)    
%plot(fshift,abs(xxshift)); 
%title('filtreli spektrum')
%% ecg_noise ve filtresi yani EKG nin karþýlaþtýrýlmasý
% figure(6)
%plot(fshift,abs(yshift));
%hold on
%plot(fshift,abs(xxshift));
 %title('gorultulu ve gorultusuz spektrum karsilistirmasi')
% spektrum karþýlaþtýrýlmasýndan görültü sinyalinin frenkasý 50 hz olduðu
% anlaþýlýyor
%% sinyal karsilastirilmasi
%figure(7)
 %plot(t,ECG); 
 %hold on
% plot(t,signal);
 %title('gorultulu ve gorultusuz sinyal karsilistirmasi')
end

