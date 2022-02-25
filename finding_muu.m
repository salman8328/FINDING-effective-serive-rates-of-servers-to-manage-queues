
clear all
probability=0.01; % prob of state,threshold level
muus_for_=[];  % stores lambda values for different muu values
lambda=1;
queue_length = 10;    
%     
     for muu=1:100
 
           [q,disc,T,N]=finding_muu_thru_simu(lambda,muu,queue_length);  
            
              for i=0:queue_length  %this loop finds the freq of states 
                  freq(i+1)=sum(q==i);
              end
        
            prob(muu,:)=freq./sum(freq); % calculates prob for each state and stores in prob()
     end

     for i=2:queue_length+1 % this loop finds the nearest index values in prob for which 'tthreshold prob is met'
         index(1,i-1)=knnsearch(prob(:,i),probability);   % knnsearch() is matlab builtin func to find nearest value
     end
     
     muus_for_(1,:)=index; % finds the muu value for the index
     ss=0; % it is made zero, so that next prob values for next muu are stored

 muus_for_