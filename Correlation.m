function [corr] = Correlation(i,j,p,q,t)
% Returns correlation coefficients matrices between the two sum of states
for i = 1:i
        for j = 1:j
            %Calculating sum of states of i,j
        sum_of_ij(N) = zombieville(i,j) + sum_of_ij(N);
        end
    end
     
    
     for p = 1:i
        for q = 1:j
            %Calculating sum of states of p,q
        sum_of_pq(N) = zombieville(p,q) + sum_of_pq(N);
        end
     end
    %Using function to find the correlation coefficients between the two
    %sums
corr = corrcoef(sum_of_ij, sum_of_pq);