clc;

% Initializing Variables
zerosum = 0;
onesum = 0;
arr = [];

% Iterating through 5 Million different possibilities
for v=4999999:-1:0
    % Choosing random variable (0,1]
    x=rand;
    if x<0.512
        % Select = 0, sum of all zeros += 1
        select=0;
        zerosum = zerosum + 1;
    else
        % Select = 2, sum of all ones += 1
        select=1;
        onesum = onesum + 1;
    end
    % Adding the select variable to end of array
    arr(end+1) = select;
end

% Initalizing errorsum and new array
errorsum = 0;
arr_new = [];

% Iterating through each element in original array
for elm = arr
    % Choosing random variable (0,1]
    y = rand;
    % If element in origanl array is 0
    if elm == 0
        % If random variable selected is <= 0.025
        if y<=0.025
            select1 = 1;
        else
            select1 = 0;
        end
    % If element in orignal array is 1
    else
        % If random variable selected is <= 0.025
        if y<=0.025
            select1 = 0;
        else
            select1 = 1;
        end
    end
% Assigning the ending variable of arr_new variable the value of select1
arr_new(end+1) = select1;
end

% Intializing the probability of recieving 00, 11 and error variables
pr00 = 0;
pr11 = 0;
prerror = 0;

% Starting at 1, iterating through the total lengh of the original array
for num = 1:1:length(arr)
    % Increasing variable pr11 by 1 if values at same location in both
    % arrays are 1
    if arr(num) == 1 && arr_new(num) == 1 
        pr11 = pr11 + 1;
    % Increasing variable pr00 by 1 if values at same location in both
    % arrays are 0
    elseif arr(num) == 0 && arr_new(num) == 0
        pr00 = pr00 + 1;
    % Otherwise, we increase pr error by 1 ( incase of 0/1 sending and
    % recieving 1/0 respectively)
    else
        prerror = prerror + 1;
    end
end

% Calculating frquency of 00 and 11
frq00 = pr00/zerosum;
frq11 = pr11/onesum;

% Printing the frequency of 00 and 11
disp(frq00);
disp(frq11);
