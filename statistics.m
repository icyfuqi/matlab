fileID1 = fopen('/Users/ccwonline/git/matlab/resultNum.txt');
fileID2 = fopen('/Users/ccwonline/git/matlab/newlabel3129.txt');

person = textscan(fileID2, '%s %s %s %s %s %s ');
result = textscan(fileID1, '%s %s %s %s %s %s %s ');
fclose(fileID1);
fclose(fileID2);

[hr, lr] = size(result{1});
[hp, lp] = size(person{1});

% ��¼����ʶ����ȷ��
resultRightNum = 0;
% ��¼��ͼ�б�ʶ�������
personDiscernNum = 0;
% ��¼ʶ���������
discernWrongNum = 0;
% �ڿ�ͼ�б�Ǵ�ʶ�������ͼ
X = zeros(hp,1,'int64');
person = [person, X];
% �������
error = 10;

for i = 1 : hr
    % result�еĵ�i��  ȡ�� name type ����
    namer = strcat(result{1}{i}, '.jpg');
    typer = result{6}{i};
    xr = str2double(result{2}{i});
    yr = str2double(result{3}{i});
    widthr = str2double(result{4}{i});
    heightr = str2double(result{5}{i});
    % ��person�е�ÿ�����жԱ�
    for j = 1 : hp
        namep = person{1}{j};
        typep = person{2}{j};
        xp = str2double(person{3}{j});
        yp = str2double(person{4}{j});
        widthp = str2double(person{5}{j});
        heightp = str2double(person{6}{j});
        % �ȱ�����
        if (namer == namep) 
            % ����һ�� ������
            if (((xp - error < xr) && (xr < xp + error)) || ...
                ((yp - error < yr) && (yr < yp + error)) || ...
                ((widthp - error * 2 < widthr) && (widthr < widthp + error * 2)) || ...
                ((heightp - error * 2 < heightr) && (heightr < heightp + error * 2)))
                % ����һ�� ����� person������Ϊ1
                disp(j);
                if (typer == typep)
                    % ���һ�� ʶ����ȷ ����+1
                    resultRightNum = resultRightNum + 1;
                    disp(i);
                    disp(j);
                    disp('���һ�� ʶ����ȷ');
                    break;
                else
                    % ���һ�� ʶ����� ���� +1 person������Ϊ2
%                     person{7}{j} = 2;
                    discernWrongNum = discernWrongNum + 1;
                    disp('���һ�� ʶ�����');
                end
            else
                % ���겻һ��
                disp('���겻һ��');
            end
        end
        if (j == hp)
            % ���һ���� ������
            disp(i);
            disp(j);
            disp('���һ���� ������');
        end
    end
end

for j = 1 : hp
%     if (str2double(person{7}{j}) ~= 0)
%         personDiscernNum = personDiscernNum + 1;
%     end
end

disp(strcat('ʶ��Ե����ǣ�', resultRightNum));
disp(strcat('ʶ�������ͼ���ǣ�', personDiscernNum));
disp(strcat('����������ǣ�', discernWrongNum));
