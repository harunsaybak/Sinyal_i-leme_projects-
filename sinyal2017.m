%{

ort_R_araligi=zeros(5,15);
  rzamanfark=zeros(5,15);
  Q=zeros(5,15);
  Qzaman=zeros(5,15);
  P=zeros(5,15);
  Pzaman=zeros(5,15);
  S=zeros(5,15);
  Szaman=zeros(5,15);
  T=zeros(5,15);
  Tzaman=zeros(5,15);
  qrs_dur=zeros(5,15);
  beat=zeros(5,15);
%}
%% otomatik filtre ve dc_ofset

  ECG=zeros(size(ecg_signals_noise,1),size(ecg_signals_noise,2)); % 5 sütunluk matris
for ii=1:1:size(ecg_signals_noise,1)
    
signal=ecg_signals_noise(ii,:);
 gorultu=0;
   y = fft(signal);
   for i=40*t(end):1:300*t(end) % 40 hz ve 300 hz araliginda arama yapacak
   lastgorultu=abs(y(i));
   if lastgorultu>500 && lastgorultu>gorultu 
      gorultu=lastgorultu;
      gorF=round(i)/10;
     
   end   
   end 
   
          d1=designfilt('bandpassfir', 'FilterOrder', 200, ...
             'CutoffFrequency1', 0.001, 'CutoffFrequency2',gorF-10,...
             'SampleRate', 1000);    
         ECG(ii,:)=filtfilt(d1,signal);
         ECG(ii,:)=detrend(ECG(ii,:)); % sinyal dc_ofset
 %  figure(ii)
 %  plot(t,ECG(ii,:)); 
  % title('filtre')
   
  [ort_R_araligi_,rzamanfark_,Q_,Qzaman_,P_,Pzaman_,S_,Szaman_,T_,Tzaman_,qrs_dur_,beat_] = PQRST_qrs_beat( ECG(ii,:),t);
  
  P(ii,1)=P_(5);
  Pzaman(ii,1)=Pzaman_(5);
  T(ii,1)=T_(5);
  Tzaman(ii,1)=Tzaman_(5);
  qrs_dur(ii,1)=qrs_dur_(5);
  beat(ii,1)=round(beat_);
  % 5 keyfi rakamdir, 5. indisteki veriyi ceker  
  
  [hastalik_]=hastaliklar(qrs_dur(ii,1),T(ii,1),P(ii,1),beat(ii,1));
  hastalik(ii,1)=hastalik_;
  
  [fshift,xxshift]=spektrum_filtre2(ecg_signals_noise(ii,:),t,fs,ECG(ii,:));
  figure
  subplot(2,2,1);
  plot(t,ecg_signals_noise(ii,:));
  title('gorultulu sinyal')
  subplot(2,2,2);
  plot(t,ECG(ii,:));
  title('Filtreli sinyal')
  subplot(2,2,[3,4]);
  plot(fshift,abs(xxshift));
 ttl= title(['qrs_dur =  ', num2str(qrs_dur(ii,1)),'  beat=  ',num2str(beat(ii,1)),'  T=  ',num2str(T(ii,1)),'  P=  ',num2str(P(ii,1))]);
  ttl.Color='red';
  
end


%% not: indislerde sýkýnti var.....
 %{
  for i2=1:1:length(rzamanfark_) +1 
  ort_R_araligi(ii,i2)=ort_R_araligi_(i2);
  rzamanfark(ii,i2)=rzamanfark_(i2);
  Q(ii,i2)=Q_(i2);
  Qzaman(ii,i2)=Qzaman_(i2);
  P(ii,i2)=P_(i2);
  Pzaman(ii,i2)=Pzaman_(i2);
  S(ii,i2)=S_(i2);
  Szaman(ii,i2)=Szaman_(i2);
  T(ii,i2)=T_(i2);
  Tzaman(ii,i2)=Tzaman_(i2);
  qrs_dur(ii,i2)=qrs_dur_(i2);
  beat(ii,i2)=beat_(i2);
  end
 %}





