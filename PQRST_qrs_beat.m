function  [ort_R_araligi_,rzamanfark_,Q_,Qzaman_,P_,Pzaman_,S_,Szaman_,T_,Tzaman_,qrs_dur_,beat_] = PQRST_qrs_beat(ECG,t)
[genlik_,rzaman_]=findpeaks(ECG,t,'MinPeakHeight',max(ECG)*3/4,'MinPeakDistance',0.01); % MinPeakHeight= en buyuk R tepe degerinin 4'te 3'u kadar  


%plot(t,ECG);
 %hold on
 %plot(rzaman_,genlik_,'--or','MarkerFaceColor',[1 1 0])
%hold off
%% rzamanfark ve ort R araligi
 rzamanfark_ = diff(rzaman_);
 ort_R_araligi_ =mean(rzamanfark_); 

% tepe nokatlarý bulucu
 %function [Q,Qzaman,P,Pzaman,S,Szaman,T,Tzaman]=PQRST(genlik,rzaman,dizi,P_min,T_min,t)
 [Q_,Qzaman_,P_,Pzaman_,S_,Szaman_,T_,Tzaman_]=PQRST(genlik_,rzaman_,ECG,t);
 
 %% PQRST plot
 figure
 plot(t,ECG);
 hold on
 plot(rzaman_,genlik_,'--or','MarkerFaceColor',[1 1 0])
 plot(Qzaman_,Q_,'--gs','MarkerFaceColor',[1 0 0])
 plot(Szaman_,S_,'--gs','MarkerFaceColor',[0 1 1])
 plot(Pzaman_,P_,'--gs','MarkerFaceColor',[1 1 0])
 plot(Tzaman_,T_,'--or','MarkerFaceColor',[0 1 0])
 hold off
 %% qrs comlex zamaný
 qrs_dur_=zeros(1,15);
 for i=1:1:length(rzaman_)
 qrs_dur_(i)=Szaman_(i)-Qzaman_(i);
 end
 %% beat
 bir_kalp_atisi=rzaman_(3)-rzaman_(2); % 2 tepe arasý sure
 
 beat_=60/bir_kalp_atisi; 
 

end

