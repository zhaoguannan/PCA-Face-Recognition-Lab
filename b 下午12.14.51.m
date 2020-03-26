%calculate the mean of the training face images
MeanFace = 0;
for i = 1: NumOfSamples
    MeanFace = MeanFace + TrainingImage(:,i);
end
MeanFace = MeanFace/NumOfSamples;

%compute the demeaned faces of the training samples
for i = 1: NumOfSamples
    DemeanFace(:,i) = TrainingImage(:,i) - MeanFace;
end

%display the demeaned face images
for i = 1 : NumOfSamples
    Display = DemeanFace(:,i);
    Display = reshape(Display, [ImageHeight ImageWidth]);
    figure(i), imagesc(Display), colorbar, colormap(gray), title('Demeaned Face');
end

%display the mean face image
Display2 = reshape(MeanFace, [ImageHeight ImageWidth]);
figure, imagesc(Display2), colorbar, colormap(gray), title('Mean Face');
