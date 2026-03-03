{\rtf1\ansi\ansicpg1252\cocoartf2865
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 TimesNewRomanPSMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\slmult1\partightenfactor0

\f0\fs24 \cf2 clear all\
 com_name =input ('Please enter the Com port name - (eg. COM1) - ');\
s=serial (com_name,'BaudRate',115200);\
fopen(s);\
data = [];\
das=0;\
dataf = [];\
v= videoinput('winvideo',2,'YUY2_160x120');\
%v= videoinput('winvideo',1,'RGB24_160x120');\
preview(v);\
pause(3);\
image= getsnapshot(v);\
imageRes=v.VideoResolution;\
imageW=imageRes(1);\
imageH=imageRes(2);\
 image= ycbcr2rgb(image);\
 hold on;\
figure(1);\
imshow(image);\
 nCol=1;\
 set(1, 'name' , ' select sample for RED');\
sample_regions=roipoly(image);\
 ct=0;\
 %imshow(sample_regions(:,:,1));\
 %%  convert to LAB\
 C_LAB=makecform('srgb2lab');\
lab_image=applycform(image,C_LAB);\
a=lab_image(:,:,2);\
b=lab_image(:,:,3);\
color_markers=repmat(0, [nCol, 2]);\
 for count= 1:nCol\
 color_markers(count,1)=ceil(mean2(a(sample_regions(:,:,count))));\
 color_markers(count,2)=ceil(mean2(b(sample_regions(:,:,count))));\
end\
hold on;\
figure(3);\
axes('position',[0  0  160  120]);\
RED=ones(imageH,imageW);\
dist=zeros(size(a));\
se=strel('disk',5);\
 while 1\
 image= getsnapshot(v);\
image= ycbcr2rgb(image);\
lab_image=applycform(image,C_LAB);\
 dist=  abs(double(lab_image(:,:,2))-color_markers(count,1)) + abs(double(lab_image(:,:,3))-color_markers(count,2));\
 \
for i=1:imageH\
    for j=1:imageW\
        if dist(i,j)< 14\
            RED(i,j)=1;\
        else\
            RED(i,j)=0;\
        end\
    end   \
  end\
RED=imopen(RED,se);\
RED=imclose(RED,se);\
 [B,L] = bwboundaries(RED,'noholes');\
stats = regionprops(L,'centroid');\
if length(B)==1\
clf(3);\
imshow(RED);\
disp(ct);\
ct=ct+1;\
das=0;\
disp(stats.Centroid);\
centroids = cat(1, stats.Centroid);\
plot(centroids(:,1), centroids(:,2), 'b*');\
drawnow\
 if(centroids(:,1)<(imageW/2 -15))\
     disp('L');\
    fprintf(s,'L');\
    data = [data; 'R'];\
    dataf = [dataf; 'L'];\
    \
elseif(centroids(:,1)>(imageW/2 +15))\
   \
    disp('R');\
    fprintf(s,'R');\
    data = [data; 'L'];\
    dataf = [dataf; 'R'];\
    \
elseif(centroids(:,2)<(imageH/2 -15))\
   \
    disp('F');\
    fprintf(s,'F');\
    data = [data; 'B'];\
    dataf = [dataf; 'F'];\
    \
elseif(centroids(:,2)>(imageH/2 +15))\
   \
    disp('B');\
    fprintf(s,'B');\
    data = [data; 'F'];\
    dataf = [dataf; 'B'];\
    \
else\
   \
    disp('S');\
    fprintf(s,'S');\
   % data = [data; 'S'];\
   %dataf = [dataf; 'S'];\
    \
end\
elseif length(B)==0\
\
  das=das+1;\
  %q=q+1;\
disp('no centroid');\
 \
if (das==40)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==41)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==42)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==43)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==44)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==45)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==46)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==47)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==48)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==49)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==50)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==51)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==52)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==53)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==54)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==55)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==56)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==57)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==58)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==59)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==60)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==61)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==62)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==63)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==64)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==65)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==66)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==67)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==68)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==69)\
        disp('R');\
        fprintf(s,'R');\
        pause(.5);\
end\
if (das==70)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==71)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==72)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==73)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==74)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==75)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==76)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==77)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==78)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
if (das==79)\
        disp('L');\
        fprintf(s,'L');\
        pause(.5);\
end\
    \
    if (das>100)\
    j= numel(data);\
    for i=j:-1:1;\
   % d=data(i);\
        disp(data(i));\
        fprintf(s,data(i));\
        pause(.3);\
    end\
    break;\
end\
else\
    disp('two cen')\
 end\
 end\
disp('finish 1st part');\
 \
y=input('how many times have to go ? - (eg. 7) - ');\
disp('upload the object');\
 \
pause(5);\
 if(y>0)\
   for x=1:y;\
       for i=1:j;\
         %z=dataf(x);\
         disp(dataf(i));\
         fprintf(s,dataf(i));\
         pause(.3);\
       end\
       pause(3);\
       disp('relese the object');\
       \
       disp('T');\
       fprintf(s,'T');\
       \
       pause(3);\
    \
      for i=j:-1:1;\
        % d=data(i);\
        disp(data(i));\
        fprintf(s,data(i));\
        pause(.3);\
      end\
       pause(3);\
       if(x<y)\
       disp('upload the object');\
       \
       pause(5);\
       end\
   end\
 end\
 disp('finish all');\
 stop(v);\
 flushdata(v);\
}