%This software describes a zombie apocalypse dynamics and depicts the laws
%of motion we have defined for this project

% 1) Set up the matrix where the zombies and humans will be situated, the
% number of rows = number of columns = 7 according to the template given to
% us
humans = 0;
zombies = 0;
%Simulating 1000 times
for N = 1:1000
    zombieville = zeros(7,7);

    %defining values for each state
    % human = 1;
    % zombie = -1;
    % empty = 0;

    state = [1 -1 0];

    % Initial distribution of zombies, humans, and empty cells at time t = 0 in
    % zombieville
    zombieville = [0 1 0 1 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 0 0 0; 1 0 -1 0 0 1 0; 0 0 0 0 0 0 0; 0 0 0 0 -1 0 0; 0 -1 0 0 0 1 0];
    
    % You can also define the initial configuration as:
    % for i = 1:7 
    %     for j= 1:7
    %         if (i==1 && j==2) 
    %             zombieville(i,j) = state(1);
    %         end
    %         if (i==1 && j==4) 
    %             zombieville(i,j) = state(1);
    %         end
    %         if (i==2 && j==6) 
    %             zombieville(i,j) = state(1);
    %         end
    %         if (i==4 && j == 1)
    %             zombieville(i,j) = state(1); 
    %         end
    %         if (i==4 && j==3) 
    %             zombieville(i,j) = state(2);
    %         end
    %         if (i==4 && j==6) 
    %             zombieville(i,j) = state(1);
    %         end
    %         if (i==6 && j==5) 
    %             zombieville(i,j) = state(2);
    %         end
    %         if (i==7 && j==2) 
    %             zombieville(i,j) = state(2);
    %         end
    %         if (i==7 && j==6) 
    %             zombieville(i,j) = state(1);
    %         end
    %         if (i~=1 && j~=2) && (i~=1 && j~=4) && (i~=2 && j~=6) && (i~=4 && j ~= 1) && (i~=4 && j~=3) && (i~=4 && j~=6) && (i~=6 && j~=5) && (i~=7 && j~=2) && (i~=7 && j~=6)
    %             zombieville(i,j) = state(3);
    %         end
    %     end
    % end
    
    for t = 1:20
        for i = 1:7
            for j = 1:7
                %finding the indices of the neighbors of each cell
                %zombieville = [0 1 0 1 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 0 0 0; 1 0 -1 0 0 1 0; 0 0 0 0 0 0 0; 0 0 0 0 -1 0 0; 0 -1 0 0 0 1 0];

                index = find_neighbours(i,j,size(zombieville)); 
                for x = 1:length(index)
                   %T = index;
                   k = index(x,1);
                   l = index(x,2);

                   %Assigning scores to different moves
                    if k ~= index(x,1) & l ~= index(x,2) %if coordinates (k,l) are not in the neighborhood 
                        score(i,j) = 0;
                    else 
                        if zombieville(i,j) == 0
                            score(i,j) = 0;

                        elseif (zombieville(i,j) == -1) & (zombieville(k,l) == 0)
                            score(i,j) = 1;

                        elseif (zombieville(i,j) == -1) & (zombieville(k,l) == -1)
                            score(i,j) = 0;

                        elseif (zombieville(i,j) == -1) & (zombieville(k,l) == 1)
                            score(i,j) = 2;

                        elseif (zombieville(i,j) == 1) & (zombieville(k,l) == 0)
                            score(i,j) = 2;

                        elseif (zombieville(i,j) == 1) & (zombieville(k,l) == -1)
                            score(i,j) = 0;

                        elseif (zombieville(i,j) == 1) & (zombieville(k,l) == 1)
                            score(i,j) = 1;
                        end
                         score;
                         % Creating new matrix which has the scores of all the
                         % neighbourhood cells of (i,j)
                         score_new(x) = score(index(x,1),index(x,2));
                    end
                end
                     %Calculating probability from formula (3) for each cell in
                     %the neighbourhood of (i,j)

                      for a = 1:length(index)
                            p(a) = exp(score_new(a))/exp(sum(score_new, 'all'));
                      end

    %                  % limit the size of probability matrix to only nbhd -
    %                  using (i,j) and index we created. 
                        % build new prob matrix, keep only the indices that are
                        % in the index
                        % if the size of the nbhd changes, no of interval
                        % changes
                        %Define new probability matrix -- 9 cells
                       %Finding intervals I — 9 intervals

                       len = length(index);
                       I1 = linspace(0,p(1)); % see how many cells we have in the interval 
                       I2 = linspace(p(1),p(1)+p(2)); 
                       I3 = linspace(p(1)+p(2),p(1)+p(2)+p(3));

                       if len < 5
                           I5 = 0;
                           I6 = 0;
                           I7 = 0;
                           I8 = 0;
                           I9 = 0;
                       elseif len < 6 
                           I6 = 0;
                           I7 = 0;
                           I8 = 0;
                           I9 = 0;
                       elseif len < 7
                           I7 = 0;
                           I8 = 0;
                           I9 = 0;
                       elseif len < 8 
                           I8 = 0;
                           I9 = 0;
                       elseif len <9
                           I9 = 0;
                       else
                           I4 = linspace(p(1)+p(2)+p(3),p(1)+p(2)+p(3)+p(4));
                           I5 = linspace(p(1)+p(2)+p(3)+p(4),p(1)+p(2)+p(3)+p(4)+p(5));
                           I6 = linspace(p(1)+p(2)+p(3)+p(4)+p(5),p(1)+p(2)+p(3)+p(4)+p(5)+p(6));
                           I7 = linspace(p(1)+p(2)+p(3)+p(4)+p(5)+p(6),p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7));
                           I8 = linspace(p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7),p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)+p(8));
                           I9 = linspace(p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)+p(8),1);
                       end


                     %Generating a Uniform pseudo-random variate
                     U = rand();

                     % Finding the interval at which U lies in, and finding the
                     % possible targets for (i,j) : T
                     len = length(index);
                     T = index;
                     if U > 0 & U <= p(1) % not being able to compare
                         T(1,1) = index(1,1);
                         T(1,2) = index(1,2);
                     end
                     if U > p(1) & U <= (p(1)+p(2))
                         T(2,1) = index(2,1);
                         T(2,2) = index(2,2);
                     end
                     if U > (p(1)+p(2)) & U <= (p(1)+p(2)+p(3))
                         T(3,1) = index(3,1);
                         T(3,2) = index(3,2);
                     end
                     if U > (p(1)+p(2)+p(3)) & U <= (p(1)+p(2)+p(3)+p(4)) & (len > 3)
                         T(4,1) = index(4,1);
                         T(4,2) = index(4,2);  
                     end
                     if U > (p(1)+p(2)+p(3)+p(4)) & U <= (p(1)+p(2)+p(3)+p(4)+p(5)) & (len > 4)
                          T(5,1) = index(5,1);
                          T(5,2) = index(5,2);
                     end
                     if (len > 5) & U > (p(1)+p(2)+p(3)+p(4)+p(5)) & U <= (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)) 
                          T(6,1) = index(6,1);
                          T(6,2) = index(6,2);
                     end
                     if (len > 6) & U > (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)) & U <= (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)) 
                          T(7,1) = index(7,1);
                          T(7,2) = index(7,2);
                     end
                     if (len > 7) & U > (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)) & U <= (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)+p(8))
                          T(8,1) = index(8,1);
                          T(8,2) = index(8,2);
                     end
                     if (len > 8) & U > (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)+p(8)) & U <= (p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)+p(8)+p(9)) 
                          T(9,1) = index(9,1);
                          T(9,2) = index(9,2);
                     end
                     T;
                     T_new = find_neighbours(k,l,size(zombieville)); %targets of k,l
                     
                     % State update I -- Depending on the target cell, the state of the system changes
                     if length(T) > length(T_new)
                         sz = length(T_new);
                     elseif length(T_new) > length(T)
                         sz = length(T);
                     elseif length(T) == length(T_new)
                         sz = length(T);
                     end

                     for x = 1:sz
                          if T(x,:) == T_new(x,:) 
                          
                        
                          if zombieville(i,j) == zombieville(k,l)
                              B_same = generatebernouli(0.5);
                              if B_same == 0
                                  zombieville(i,j) = zombieville(i,j);
                                  zombieville(k,l) = 0;
                                  zombieville(T(x),T(x,2)) = zombieville(k,l);
                                  % Update the state of the target cell
                              elseif B_same == 1
                                  zombieville(i,j) = 0;
                                  zombieville(k,l) = zombieville(k,l);
                                  zombieville(T(x),T(x,2))=zombieville(i,j);
                              end
                          elseif zombieville(i,j) ~= zombieville(k,l)
                                  B_fight = generatebernouli(0.5);
                                  zombieville(i,j)=0; 
                                  zombieville(k,l)=0;
                                  if B_fight == 0
                                      zombieville(T(x),T(x,2))=zombieville(k,l);
                                  elseif B_fight == 1
                                      zombieville(T(x),T(x,2))=zombieville(i,j);
                                  end
                              end
                      elseif T(x,:) ~= T_new(x,:) 
                          zombieville(T(x,1),T(x,2))=zombieville(i,j); %array indices invalid
                          zombieville(i,j)=0;
                          end 

                     end 
                     if zombieville(i,j) == 1
                        humans = humans + 1;
                    end
                    if zombieville(i,j) == -1
                        zombies = zombies + 1;
                    end
                   
                    
            end
        end
       
    end
    %As i,j and p,q can be anything, we generate them at random.
    i = randi();
    j = randi();
    p = randi();
    q = randi();
    %Generating the matrice of coefficient correlation between sum of
    %states of i,j and p,q
    correlations = Correlation(i,j,p,q,t)
    
    %producing color coded plots at different points in time
     imagesc(zombieville);
     title('Zombieville at t=20')
     colorbar
     hold on 
end
% %%%Alternative method
% % Finding the average of humans and zombies
% average_humans = humans/(humans+zombies);
% average_zombies = zombies/(humans+zombies);
% 
% %Calculating the sample mean
% mean = sum_of_states/N;
% 
% %Calculating the standard deviation
% intermediate = ((sum_of_states - mean).^2)/(N-1);
% std_dev = sqrt(intermediate);
%After this, we can plug this into the general formula corr (mentioned in
%lab report) to find the correlation coefficients. 