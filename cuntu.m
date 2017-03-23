Pathin1='C:\Users\Administrator\Desktop\jtbz\结果分析\切割\0.txt';
Pathin2='C:\Users\Administrator\Desktop\jtbz\切割\fuqi0213\';
Pathin3='C:\Users\Administrator\Desktop\jtbz\结果分析\切割\6\';


%筛选图片：找出与txt文件中对应的图片并存图%
[NAME1]=textread(Pathin1,'%s');
for i=1:size(NAME1,1)
    numofimg1=NAME1(i,1);
    imgName = char(strcat(numofimg1, '.png'));
    img = char(strcat(Pathin2 ,  imgName));
    path = char(strcat(Pathin3 ,  imgName));
    disp(path);
    
    A = imread(img);
    imwrite(A,path);
end
