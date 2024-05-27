f = figure('name','LOVE','NumberTitle','off');

t = -180:1/40:180;
r = sind(t) .* (abs(cosd(t)) .^ 0.7) ./ (sind(t) + 7/5) - 2* sind(t) + 2;

x = r .* cosd(t);
y = r .* sind(t);

fill(x, y, 'r');

axis([-2.5, 2.5, -4.2, 1]);