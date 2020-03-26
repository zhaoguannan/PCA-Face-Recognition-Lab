%using another method to compute the eigenvector and eigenvalues of CovFace1

%compute the eigenvector and eigenvalues of R = A' * A
R = DemeanFace' * DemeanFace;
[EVR, EDR] = eig(R);

%compute the eigenvectors of A * A'
EV = DemeanFace * EVR;

%display the eigenvectors according to the eigenvalues in descending order
Temp = EV;
for i = 1:NumOfSamples
   EV(:,i) = Temp(:, NumOfSamples + 1 - i); 
   EV(:,i) = EV(:,i)/norm(EV(:,i));
end

%display the Eigenfaces
for i = 1 : 19
    Display = EV(:,i);
    Display = reshape(Display, [ImageHeight ImageWidth]);
    figure(i), imagesc(Display), colorbar, colormap(gray), title('Eigenface');
end

