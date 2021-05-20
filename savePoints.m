% SAVEPOINTS.m A Matlab script for saving with a specific delimiter type

A = pts; % Data that you want to change the delimiter type 
file = 'waypoints.txt'; % file name to save your data with new delimiter type
precision = '%.2f';
delimiter = ', '; % Here is the delimiter type, I used 'comma' and 'space'
line_terminator = '\n';
write_general_matrix(file, A, precision, delimiter, line_terminator);
function write_general_matrix(file, matrix, precision, delimiter, line_terminator)
format = [create_fmt(precision, delimiter, size(matrix, 2)) line_terminator];
fid = fopen(file, 'w');
fprintf(fid, format, matrix');
fclose(fid);
end
function s = create_fmt(prec, dlm, n_fmt)
s = prec;
for i = 1:2*(n_fmt-1)
    if mod(i, 2) == 1
        s = [s dlm];
    else
        s = [s prec];
    end
end
end