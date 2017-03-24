fileID1 = fopen('/Users/ccwonline/git/matlab/resultNum.txt');
fileID2 = fopen('/Users/ccwonline/git/matlab/newlabel3129.txt');

person = textscan(fileID2, '%s %s %s %s %s %s ');
result = textscan(fileID1, '%s %s %s %s %s %s %s ');
fclose(fileID1);
fclose(fileID2);

[hr, lr] = size(result{1});
[hp, lp] = size(person{1});

% 坐标误差
error = 10;
% 记录机器识别正确数
resultRightNum = 0;
% 记录抠图中被识别出的数
personDiscernNum = 0;
% 记录识别错类别的数
discernWrongNum = 0;
% 在抠图中标记处识别出来的图
arr = zeros(hp,1);
% 在识别图中记录每个类别的正确错误数 33个类
arrType = zeros(33,3);

arrType(:,1,1) = 100;

for i = 1 : hr
    % result中的第i行  取出 name type 坐标
    namer = strcat(result{1}{i}, '.jpg');
    typer = result{6}{i};
    xr = str2double(result{2}{i});
    yr = str2double(result{3}{i});
    widthr = str2double(result{4}{i});
    heightr = str2double(result{5}{i});
    % 先把类别名存入 arrType
    for k = 1 : length(arrType)
        if (arrType(k,1) == str2double(typer))
            break;
        end
        if (arrType(k,1) == 100)
            arrType(k,1) = str2double(typer);
            break;
        end
    end
    
    % 跟person中的每条进行对比
    for j = 1 : hp
        namep = person{1}{j};
        typep = person{2}{j};
        xp = str2double(person{3}{j});
        yp = str2double(person{4}{j});
        widthp = str2double(person{5}{j});
        heightp = str2double(person{6}{j});
        
        str = strcat('当前图： ',namer,' 结果： ');
        % 先比名字
        if (namer == namep) 
            % 名字一样 比坐标
            if (((xp - error < xr) && (xr < xp + error)) || ...
                ((yp - error < yr) && (yr < yp + error)) || ...
                ((widthp - error * 2 < widthr) && (widthr < widthp + error * 2)) || ...
                ((heightp - error * 2 < heightr) && (heightr < heightp + error * 2)))
                % 坐标一样 比类别 person里面标记为1
                arr(j) = 1;
                if (typer == typep)
                    % 类别一样 识别正确 计数+1
                    resultRightNum = resultRightNum + 1;
                    arrType(k,2) = arrType(k,2) + 1;
                    disp(strcat(str, '识别正确'));
                else
                    % 类别不一样 识别错误 计数 +1 person里面标记为2
                    arr(j) = 2;
                    discernWrongNum = discernWrongNum + 1;
                    disp(strcat(str, '识别错误 类别不一样'));
                end
                break;
            else
                % 坐标不一样
                % disp('坐标不一样');
            end
        end
        if (j == hp)
            % 最后一个了 还不对
            arrType(k,3) = arrType(k,3) + 1;
            disp(strcat(str, '识别错误 无此图或坐标不对'));
        end
    end
end

for j = 1 : hp
    if (arr(j) ~= 0)
        personDiscernNum = personDiscernNum + 1;
    end
end

disp('*******************************************');
disp(strcat('识别对的数是：', num2str(resultRightNum)));
disp(strcat('识别出来的图数是：', num2str(personDiscernNum)));
disp(strcat('类别错误的数是：', num2str(discernWrongNum)));

disp('*******************************************');
for f = 1 : length(arrType)
    if (arrType(f,1) ~= 100)
        disp(strcat('类别: ', num2str(arrType(f,1)), ' 正确: ', ...
            num2str(arrType(f,2)), ' 错误: ', num2str(arrType(f,3))));
    end
end

disp('**************      end     **************');
