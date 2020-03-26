%read the testing face images
NumOfTestSamples = 4;
str_test_Path = '/PCA_Images/Testing/';

for i = 1:4
    str_Load = strcat(str_test_Path, num2str(i),'.bmp');
    Image = imread(str_Load);
    TestingImage(:,i) = double(reshape(Image,[],1));
end

%compute the demeaned  faces of the testing samples
for i = 1: 4
    DemeanTestFace(:,i) = TestingImage(:,i) - MeanFace;
end

%select a testing image (:,i)
for i = 1:4
  for j = 1:19
    coef_test(i,j) = DemeanTestFace(:,i)'* EV(:,j);
  end
end

ReconstImage_test = zeros(4608,4);

%reconstruct the testing image using M = 4, 8...
M = 19;
for i = 1:4
    for j = 1: M
    ReconstImage_test(:,i) = ReconstImage_test(:,i) + coef_test(i,j) * EV(:,j);
    end
ReconstImage_test(:,i) = MeanFace +  ReconstImage_test(:,i);
end

Difference_test = zeros(4608,1);
MSE_test = zeros(1,4);
for i = 1:4
    Difference_test(:,i) = ReconstImage_test(:,i) - TestingImage(:,i);
    MSE_test(i) = (1/4608) * sum(Difference_test(:,i).*Difference_test(:,i));
end

