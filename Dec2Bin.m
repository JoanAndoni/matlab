clc; clear all; close all;

x = double(input('Give me the number to convert: '));
binary = '';
counter = 0;
reminder = 0;
T = true;

while T == true
    reminder = rem(x,2);
    if(reminder > 0)
        binary = strcat(binary,'1');
    else
        binary = strcat(binary,'0');
    end
    x = floor(x/2);
    if(x == 1)
        T = false;
    end
    counter = counter + 1;
end

binary = strcat(binary,num2str(reminder));
fliplr(binary)