function [ hastalik_ ] = hastaliklar(qrs,T,P,beat)

 if P>0.3
     hastalik_=1;
 elseif beat>80
     hastalik_=2;
 elseif T<0.25
     hastalik_=3;
 elseif qrs<0.08
     hastalik_=4;
 elseif beat<60
     hastalik_=5;
 elseif P<0.1
     hastalik_=6;
 elseif qrs>0.15
     hastalik_=7;
 elseif T>0.4
     hastalik_=8;
 else
     hastalik_=9;
 end

end

