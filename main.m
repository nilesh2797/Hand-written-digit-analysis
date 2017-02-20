clc;
clear;
clear title xlabel ylabel;
images = loadMNISTImages('train-images-idx3-ubyte');
labels = loadMNISTLabels('train-labels-idx1-ubyte');
images = double(images);
disp('Taking no. of principal modes of variation as number of eigenvalues > 0.5');
for i=0:9
   X = images(:,labels==i);
   X = X';
   meanx = mean(X);
   meanx = meanx';
   covX = cov(X);
   [V,D] = eig(covX);
   V = fliplr(V);
   D = rot90(D,2);
   figure;
   title('Digit 0');
   subplot(2,3,[1,2,3]);
   plot(D);
   title1 = sprintf('Principle modes of variation - Eigenvalues for digit %d',i);
   title(title1);
   img1 = meanx - sqrt(D(1,1))*V(:,1);
   img2 = meanx;
   img3 = meanx + sqrt(D(1,1))*V(:,1);
   subplot(2,3,4);
   
   imshow(reshape(img1,28,28));
   title('$$\mu - \sqrt{\lambda}v_{1}$$','Interpreter','latex');
   subplot(2,3,5);
  
   imshow(reshape(img2,28,28));
   title('$$\mu$$','Interpreter','latex');
   subplot(2,3,6);
   
   imshow(reshape(img3,28,28));
   title('$$\mu + \sqrt{\lambda}v_{1}$$','Interpreter','latex');
   terminalout = sprintf('Digit %d: %d',i,sum(sum(D)>0.5));
   disp(terminalout)
   
end
    
    
