clear;

%read the training face images
NumOfSamples = 20;
str_Path = '/PCA_Images/Training/';
ImageHeight = 72;
ImageWidth = 64;
for i = 1:NumOfSamples
    str_Load = strcat(str_Path, num2str(i),'.bmp');
    Image = imread(str_Load);
    TrainingImage(:,i) = double(reshape(Image,[],1));
end

