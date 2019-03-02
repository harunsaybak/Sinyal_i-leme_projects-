function [fshift,xxshift] = spektrum_filtre2(signal,t,fs,ECG)
%% g�r�lt�l� sinyalin spektrumu
%figure(1)
n = length(signal);
%y=ones(1,n);
%y1=ecg_signals_noise(1,:);
%y = fft(signal); % spektrum 
%plot(t,abs(y)); % t yi baz alarak �iz, abs mutlak de�er
%title('g�r�lt�l� sinyalimin spektrumu')
%f=(0:length(y)-1)*fs/n; % anla��l�r g�r�nt� i�in f olu�turuldu
%figure(2)
%plot(f,abs(y)); % spektrumu �iz / �rnekleme frenkas�n� baz alarak daha d�zg�n bir g�r�nt�
%title('kay�k spektrum');
%% spektrum shift etme i�lemi

%yshift = fftshift(y); % shift i�lemi
fshift = (-n/2:n/2-1)*fs/n; %orta nokty� 0 yapmak i�in f shift edildi
%figure(3) 
%plot(fshift,abs(yshift)); % d�zg�n spektrum
%title('g�r�lt�l� sinyalin spektrumu');
%% filtreleme icin sinyal analizi katsayilarin belirlenmesi




%% ECG nin sepktrumu
xx=fft(ECG);  %spektrumu
xxshift=fftshift(xx); % shift edilmi� spektrum
%figure(5)    
%plot(fshift,abs(xxshift)); 
%title('filtreli spektrum')
%% ecg_noise ve filtresi yani EKG nin kar��la�t�r�lmas�
% figure(6)
%plot(fshift,abs(yshift));
%hold on
%plot(fshift,abs(xxshift));
 %title('gorultulu ve gorultusuz spektrum karsilistirmasi')
% spektrum kar��la�t�r�lmas�ndan g�r�lt� sinyalinin frenkas� 50 hz oldu�u
% anla��l�yor
%% sinyal karsilastirilmasi
%figure(7)
 %plot(t,ECG); 
 %hold on
% plot(t,signal);
 %title('gorultulu ve gorultusuz sinyal karsilistirmasi')
end

