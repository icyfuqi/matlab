Pathin1='I:\jtbz\0.8����\����ѵ��txt\trainval2385.txt';
Pathin2='I:\jtbz\�и�\test.txt';

txtpath=fopen('I:\jtbz\�и�\result2.txt','w');%��label���·��

%���test609.txt�ĺ���λ��test.txt��ǰ��λ��ͬ������Щ��ȡ������������ǰ��λ�����������txt�ļ�
[NAME1]=textread(Pathin1,'%d');
[NAME2]=textread(Pathin2,'%5s');
[NAME3]=textread(Pathin2,'%s');
for i=1:size(NAME1,1)
    numofimg1=NAME1(i,1);
    s1 = num2str(numofimg1,'%05d');
    for j=1:size(NAME2,1)
        numofimg2=NAME2(j,1);
        if(mod(j,2) == 1)
            disp('----------');
            if (strcmp(s1,char(numofimg2)))
                disp(s1);
                disp(char(numofimg2));
                numofimg3=NAME3(fix(j/2)+1,1);
                disp(char(numofimg3));
                fprintf(txtpath,'%s\r\n',char(numofimg3)); %�����label
            end
        end
    end
end
