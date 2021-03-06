happy=uigetfile('*.jpg');
happy0=imread(happy);
imshow(happy0);
happy1 = imcrop(happy0,[60 90 140 140]);
%Happy and Surprised mouth templates
hmouth1=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hmouth.jpg');
hmouth2=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hmouth1.jpg');
surmouth=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\surmouth.jpg');

%Happy and Surprised lefteye templates
hlefteyeGrey=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hlefteye.jpg');
hlefteyeGrey1=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hlefteye1.jpg');
hlefteyeGrey2=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hlefteye2.jpg');

%Happy and Surprised righteye templates
hrighteyeGrey=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hrighteye.jpg');
hrighteyeGrey1=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hrighteye1.jpg');

%Happy and Surprised eyebrow templates
hlefteyebrowGrey=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hlefteyebrow.jpg');
hrighteyebrowGrey=imread('C:\Users\Anusha\Documents\MATLAB\DIPproject\hrighteyebrow.jpg');

finalf=figure;
hAx  = axes;

imshow(happy1,'Parent', hAx);
hold on;
  
  
%imshow(hmouth1);
% imshow(hlefteyeGrey);
% imshow(hrighteyeGrey);
% imshow(hlefteyebrowGrey);
% imshow(hrighteyebrowGrey);



% happy1=rgb2gray(happy);
% hmouth1=rgb2gray(hmouth);
% hlefteyeGrey=rgb2gray(hlefteye);
% hrighteyeGrey=rgb2gray(hrighteye);
% hlefteyebrowGrey=rgb2gray(hlefteyebrow);
% hrighteyebrowGrey=rgb2gray(hrighteyebrow);

%performing template matching on the image by calculating normalized correlation coefficient
normmouth=normxcorr2(hmouth1(:,:,1),happy1(:,:,1));
normmouth1=normxcorr2(hmouth2(:,:,1),happy1(:,:,1));
norsurmouth=normxcorr2(surmouth(:,:,1),happy1(:,:,1));
%//figure, surf(normx_corrmap), shading flat
maxmouth = max(normmouth(:));
maxmouth1 = max(normmouth1(:));
maxsurmouth = max(norsurmouth(:));

%drawing rectangular boxes around the hightest matching points 
if maxmouth>maxmouth1 && maxmouth>maxsurmouth
    [y1,x1]=find(normmouth==maxmouth);
    y0 = y1-size(hmouth1,1);
    x0 = x1-size(hmouth1,2);
    rectangle('Position', [x0+1, y0+1, size(hmouth1,2), size(hmouth1,1)]);
    fprintf('Happy\n');
end
if maxmouth1>maxmouth && maxmouth1>maxsurmouth
    [y1,x1]=find(normmouth1==maxmouth1); 
    y0 = y1-size(hmouth2,1);
    x0 = x1-size(hmouth2,2);
    rectangle('Position', [x0+1, y0+1, size(hmouth2,2), size(hmouth2,1)]);
    fprintf('Happy\n');
end
if maxsurmouth>maxmouth && maxsurmouth>maxmouth1
    [y1,x1]=find(norsurmouth==maxsurmouth); 
    y0 = y1-size(surmouth,1);
    x0 = x1-size(surmouth,2);
    rectangle('Position', [x0+1, y0+1, size(surmouth,2), size(surmouth,1)]);
    fprintf('Surprised\n');
end
    



normLeye=normxcorr2(hlefteyeGrey(:,:,1),happy1(:,:,1));
normLeye1=normxcorr2(hlefteyeGrey1(:,:,1),happy1(:,:,1));
normLeye2=normxcorr2(hlefteyeGrey2(:,:,1),happy1(:,:,1));
%//figure, surf(normx_corrmap), shading flat
maxleye = max(normLeye(:));
maxleye1 = max(normLeye1(:));
maxleye2 = max(normLeye2(:));
if maxleye>maxleye1 && maxleye>maxleye2
    [ya,xa]=find(normLeye==maxleye);
    y2 = ya-size(hlefteyeGrey,1);
    x2 = xa-size(hlefteyeGrey,2);
    rectangle('Position', [x2+1, y2+1, size(hlefteyeGrey,2), size(hlefteyeGrey,1)]);
end
if maxleye1>maxleye && maxleye1>maxleye2
    [ya,xa]=find(normLeye1==maxleye1);
    y2 = ya-size(hlefteyeGrey1,1);
    x2 = xa-size(hlefteyeGrey1,2);
    rectangle('Position', [x2+1, y2+1, size(hlefteyeGrey1,2), size(hlefteyeGrey1,1)]);
end
if maxleye2>maxleye && maxleye2>maxleye1
    [ya,xa]=find(normLeye2==maxleye2);
    y2 = ya-size(hlefteyeGrey2,1);
    x2 = xa-size(hlefteyeGrey2,2);
    rectangle('Position', [x2+1, y2+1, size(hlefteyeGrey2,2), size(hlefteyeGrey2,1)]);
end


 
normreye=normxcorr2(hrighteyeGrey(:,:,1),happy1(:,:,1));
normreye1=normxcorr2(hrighteyeGrey1(:,:,1),happy1(:,:,1));
%//figure, surf(normx_corrmap), shading flat
maxreye = max(normreye(:));
maxreye1 = max(normreye1(:));
if maxreye>maxreye1
    [yb,xb]=find(normreye==maxreye);
    y3 = yb-size(hrighteyeGrey,1);
    x3 = xb-size(hrighteyeGrey,2);
    rectangle('Position', [x3+1, y3+1, size(hrighteyeGrey,2), size(hrighteyeGrey,1)]);
else
    [yb,xb]=find(normreye1==maxreye1);
    y3 = yb-size(hrighteyeGrey1,1);
    x3 = xb-size(hrighteyeGrey1,2);
    rectangle('Position', [x3+1, y3+1, size(hrighteyeGrey1,2), size(hrighteyeGrey1,1)]);
end
 
normreyebrow=normxcorr2(hrighteyebrowGrey(:,:,1),happy1(:,:,1));
 %//figure, surf(normx_corrmap), shading flat
 maxreyebrow = max(normreyebrow(:));
 [yc,xc]=find(normreyebrow==maxreyebrow);
 y4 = yc-size(hrighteyebrowGrey,1);
 x4 = xc-size(hrighteyebrowGrey,2); 
 rectangle('Position', [x4+1, y4+1, size(hrighteyebrowGrey,2), size(hrighteyebrowGrey,1)]);
 
normleyebrow=normxcorr2(hlefteyebrowGrey(:,:,1),happy1(:,:,1));
 %//figure, surf(normx_corrmap), shading flat
 maxleyebrow = max(normleyebrow(:));
 [yd,xd]=find(normleyebrow==maxleyebrow);
 y5 = yd-size(hlefteyebrowGrey,1);
 x5 = xd-size(hlefteyebrowGrey,2);
 rectangle('Position', [x5+1, y5+1, size(hlefteyebrowGrey,2), size(hlefteyebrowGrey,1)]);






