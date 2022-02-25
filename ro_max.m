 clear all
close all
 queue_length=10;
           [q,disc,T,N]=ro_max_sim(1,queue_length);  
            
              for i=0:queue_length  
                  freq(i+1)=sum(q==i);
              end
              prob=freq./sum(freq);
            figure,bar([0:queue_length],prob)
            title('probabilities')
            ylabel('prob')
            xlabel('states')
            figure,plot(T)
            title('waiting time')
            ylabel('time in system')
            xlabel('customer number during simulation')
