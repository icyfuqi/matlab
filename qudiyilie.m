
Pathin2='I:\jtbz\切割\newlabel.txt';

txtpath=fopen('I:\jtbz\切割\test.txt','w');%新label存放路径

[NAME]=textread(Pathin2,'%6s');
for i=1:size(NAME,1)
    numofimg=NAME(i,1);
    if(mod(i,7) == 1)
        disp(numofimg);
        fprintf(txtpath,'%s\r\n',char(numofimg)); %输出新label
    end
end
 