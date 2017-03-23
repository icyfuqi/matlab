Pathin1 = '/Users/ccwonline/Documents/matlab/result.txt';

txtpath=fopen('/Users/ccwonline/Documents/matlab/resultNum.txt','w');%新label存放路径

fileID1 = fopen(Pathin1);
D = textscan(fileID1, '%s', 'Delimiter', '\n');
fclose(fileID1);

[a, b] = size(D);
for s = D{1}
    for i = 1 : length(s)
        str = s{i};
        str = strrep(str, '[', '');
        str = strrep(str, ']', '');
        str = strrep(str, 'u', '');
        str = strrep(str, ',', '');
        str = strrep(str, '''', '');
        disp(str);
        fprintf(txtpath,'%s\r\n',str); %输出新label
    end
end
