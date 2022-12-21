    % parameter - curve length
t = [0 cumsum(sqrt(diff(x).^2+diff(y).^2))];
    % refine parameter
t1 = linspace(0,t(end));
xt = spline(t,x,t1);
yt = spline(t,y,t1);
plot(x,y,'o-r')                % original data
hold on
plot(xt,yt)                    % interpolated data
hold off
