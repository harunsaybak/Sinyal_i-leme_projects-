function [Q_,Qzaman_,P_,Pzaman_,S_,Szaman_,T_,Tzaman_]=PQRST(genlik_,rzaman_,dizi,t)
 Q_=zeros(1,length(rzaman_));
 Qzaman_=zeros(1,length(rzaman_));
 P_=zeros(1,length(rzaman_));
 Pzaman_=zeros(1,length(rzaman_));
 S_=zeros(1,length(rzaman_));
 Szaman_=zeros(1,length(rzaman_));
 T_=zeros(1,length(rzaman_));
 Tzaman_=zeros(1,length(rzaman_));
 
 P_min=0;
 T_min=0; % bu degiskenler t ve p tepelerini bulmak icin olusuturldu, 0'in altinda bazý tepecikler kaldýgý ve 0 ustunde sadece t ve p tepeleri kaldigindan 0'a esitlendi 
%% Q ve P bulma 
for dd=1:1:length(genlik_) %% genlik degerlerini gez
R=genlik_(dd); % R tepesinin degeri
cnt=round(rzaman_(dd)*(length(dizi)-1)/t(end) +1); % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1; % sinyal degerleri icerisinde arama yapmak icin olusturuldu
bulundu=0; % cukur bulundu durumu
while cnt>1
    min=dizi(cnt); 
    
    if min > lastmin && bulundu==0
     
        Q_(dd)=lastmin; % bulunan q diziye ekle
         Qzaman_(dd)=cnt*t(end)/length(dizi);
        bulundu=1;
        
    elseif  min < lastmin && min>P_min && bulundu==1
       
        P_(dd)=lastmin; % p yi diziye at
        Pzaman_(dd)=cnt*t(end)/length(dizi);
        cnt=0;
    end
    
    lastmin=min;
    cnt=cnt-1;
end 
end
%% s bulma t bulma
for dd=1:1:length(genlik_) %% genlik degerlerini gez
R=genlik_(dd); % R tepesinin degeri
cnt=round(rzaman_(dd)*(length(dizi)-1)/t(length(t)) +1); % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1; % sinyal degerleri icerisinde arama yapmak icin olusturuldu
bulundu=0; % cukur bulundu durumu
while cnt<length(dizi)
   min=dizi(cnt);
   if min>lastmin && bulundu==0
      S_(dd)=lastmin;
      Szaman_(dd)=cnt*t(end)/length(dizi) -2/1000 ;
      bulundu=1;
   elseif  min < lastmin && min>T_min && bulundu==1
        
        T_(dd)=lastmin;
        Tzaman_(dd)=cnt*t(end)/length(dizi) -2/1000;
      
      cnt=length(dizi);
   end
   lastmin=min;
   cnt=cnt+1;
end
end

end


