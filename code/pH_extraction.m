dir_content = dir('C:\Users\hansb\Desktop\1. Ocean acidification paper\UW data\pH from TA\UW TA pH4\*SIL*');

% contains all the raw TA files (1 excel file per measurement)
A = {dir_content.name};
output = zeros(length(A), 2);

% This script extracts the pH by looping through each file (1000s), 
% adding the pH and temperature into the output array
for i = 1: length(A)
    filename = char(A(i));
    number=i;
    fid = fopen(filename);
    data = textscan(fid, '%s %s %s %s %s', -1, 'delimiter', ',');
    sample_temp_header = find(strcmp(data{1}(:), 'Initial pH reading.1') == 1);
    sample_temp = str2double(data{4}(sample_temp_header+3));
    sample_pH = str2double(data{2}(sample_temp_header+3));
    output(i,1) = sample_pH;
    output(i,2) = sample_temp;
end




