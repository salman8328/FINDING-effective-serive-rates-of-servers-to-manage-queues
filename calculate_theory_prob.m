
clear all
close all
value_ro=[];
theory_muu_for_max_ro=[];
lambda=1;
 for k=1:10
   p=[1 -1 zeros(1,(k-1)) 0.01]; 
   roots_p=roots(p);
   for i=1:length(roots_p)

        if isreal(roots_p(i)) && sum((roots_p(i)>0))
            value_ro=[value_ro roots_p(i)];
        end
   end
   theory_muu_for_max_ro=[theory_muu_for_max_ro lambda/max(value_ro)];
   theory_muu_for_min_ro=[theory_muu_for_min_ro lambda/min(value_ro)];
    a(:,k)=value_ro;
    value_ro=[];
 end
  theory_muu_for_max_ro
   theory_muu_for_min_ro

%   