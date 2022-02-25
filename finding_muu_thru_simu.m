function  [q,disc,T,N] =finding_muu_thru_simu(lambda,muu1,queue_length)


% clear all; %empty memory
rng(1);% rand(’seed’,0)%set random seed
% lambda=7; %arrival rate
% mu=10; %service rate
endtime=1000; %simulation length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0; %current time
q=[];
disc=0;
tstep=1;
%muu1=1;%average time between consecutive measurement events
currcustomers=0; %current number of customers in system
event=zeros(1,3); %constructs vector to keep time for next arrival
%(pos 1),next service completion (pos 2) and next
% measurement event (pos 3)
event(1)=exprnd(1/lambda); %time for next arrival1
event(2)=inf; %no next service completion (empty system)
event(3)=exprnd(tstep); %time for next measurement event
nbrmeasurements=0; %number of measurement events so far
nbrdeparted=0; %number of departed customers
nbrarrived=0;
i=0;%number of customers that have arrived throughout the simulations
while t<endtime
    [t,nextevent]=min(event);
    if nextevent==1
        if currcustomers<=queue_length
        event(1)=exprnd(1/lambda)+t;
        q=[q currcustomers];
        currcustomers=currcustomers+1;
        nbrarrived=nbrarrived+1; %one more customer has arrived to the system through the simulations
        arrivedtime(nbrarrived)=t; %the new customer arrived at time t
           if currcustomers==1
            event(2)=exprnd(1/muu1)+t;
           end
        else
            disc=disc+1;
            event(1)=exprnd(1/lambda)+t;
          
        end
        
    elseif nextevent==2
        
       currcustomers=currcustomers-1;
       i=i+1;
        timeinsystem=t-arrivedtime(i);
        nbrdeparted=nbrdeparted+1; %one more customer has departed%from the system through the%simulations
        T(nbrdeparted)=timeinsystem;
        if currcustomers > 0
            event(2)=exprnd(1/muu1)+t;
        else
            event(2)=inf;
        end
        
     else
        nbrmeasurements=nbrmeasurements+1; %one more measurement event
        N(nbrmeasurements)=currcustomers;
        event(3)=event(3)+exprnd(tstep);
    end
end

%     function muu=select_prob(lambda)
%         muu=[];
%         repeat=1;
%         ss=0;
%         prob=0.00001+0.01*rand(10,1);
%        identical=find(diff(prob)==0);
%        
%         while repeat==1
%             
%         while ss < length(identical)
%         prob(ss)=0.00001+0.01*rand(10,1);
%         ss=ss+1;
%         end
%         identical=find(diff(prob)==0);
%        if length(identical)>0
%            repeat=1;
%        else
%            repeat=0;
%        end
%         end
%         p0=1-sum(prob);
%         prob=sort(prob,'descend');
%         prob=[p0;prob];
%         prob=[0.9 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01];
%         for i=1:(length(prob)-1)
%         muu = [muu lambda*prob(i)/prob(i+1)];
%         
%         end
        
        
