clc; clear all; close all;

x = input('Give a binary number: ', 's' );
y = 0;
i = 1;

while i < length(x) + 1
    y = y + str2double(x(i)) * 2^(length(x) - i);
    i = i + 1;
end

while r <length(x) + 1    
    if (str2double(x(r))== 1 || str2double(x(r))==0)
        x = input('the number is no a binary number try again =): ', 's' );
        r = 1; 
    end
end

disp('This is your Decimal number: ')
disp(y)