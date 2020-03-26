%TCoeff of tesing face images
for i = 1:2
  for j = 1:19
    TCoeff(i,j) = DemeanTestFace(:,i)'* EV(:,j);
  end
end

%TCoeff of traning images

for i = 1:20
    for j = 1:19
        TCoeff_training(i,j) = DemeanFace(:,i)'* EV(:,j);
    end
end

%Compute Euclidean distances
Temp = zeros(2,20);
EuclideanDistance = zeros(2,20); %first row for 1.bmp
                                 %second row for 2.bmp
for i = 1:2
    for j = 1:20
    Temp = TCoeff(i,:) - TCoeff_training(j,:);
    Temp = sum(Temp.*Temp);
    EuclideanDistance(i,j) = sqrt(Temp);
    end
end

for i = 1 : 2
    Display = ReconstImage_test(:,i);
    Display = reshape(Display, [ImageHeight ImageWidth]);
    figure(i), imagesc(Display), colorbar, colormap(gray), title('Reconstructed Face');
end
for i = 1 : 2
    Display = TestingImage(:,i);
    Display = reshape(Display, [ImageHeight ImageWidth]);
    figure(i+2), imagesc(Display), colorbar, colormap(gray), title('Testing Face');
end
