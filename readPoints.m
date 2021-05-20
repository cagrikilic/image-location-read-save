% READPOINTS.m A Matlab script for saving clicked point locations

%     1) use the image filename for your figure
%     2) Run the script
%     3) Click the points (left click) that you want to save
%     4) End saving with right click
%     5) Points will be saved as (2-by-ClickNumber) with the order of clicks (pts) 

clear;
clc;
filename= 'imageRight2.fig';
openfig(filename)
xPos_ = 0;
yPos_ = 0;
i = 0;
hold on;           % and keep it there while we plot
while 1
    [xi, yi, but] = ginput(1);      % get a point
    if ~isequal(but, 1)             % stop if not button 1
        break
    end
    i = i + 1;
    pts(1,i) = xi;
    pts(2,i) = yi;
    if xPos_
        plot([xPos_ xi], [yPos_ yi], 'go-');  % draw as we go
    else
        plot(xi, yi, 'go');         % first point on its own
    end
    xPos_ = xi;
    yPos_ = yi;
end
hold off;
if i < size(pts,2)
    pts = pts(:, 1:i);
end