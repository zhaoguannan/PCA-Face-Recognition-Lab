

%select a demeaned image Demeanface(:,1)
 
 for i = 1:20;
  for j = 1:19
    coef(i,j) = DemeanFace(:,i)'* EV(:,j);
  end
 end
 
 
ReconstImage = zeros(4608,20);

%reconstruct the training image using M = 4, 8...
M = 4;
for i = 1:20;
    for j = 1: M
    ReconstImage(:,i) = ReconstImage(:,i) + coef(i,j) * EV(:,j);
    end

    ReconstImage(:,i) = MeanFace +  ReconstImage(:,i);
end


Difference = zeros(4608,1);
for i = 1:20
    Difference(:,i) = ReconstImage(:,i) - TrainingImage(:,i);
    MSE(i) = (1/4608) * sum(Difference(:,i).*Difference(:,i));
end