
Pathin2='I:\jtbz\�и�\newlabel.txt';

txtpath=fopen('I:\jtbz\�и�\test.txt','w');%��label���·��

[NAME]=textread(Pathin2,'%6s');
for i=1:size(NAME,1)
    numofimg=NAME(i,1);
    if(mod(i,7) == 1)
        disp(numofimg);
        fprintf(txtpath,'%s\r\n',char(numofimg)); %�����label
    end
end
 