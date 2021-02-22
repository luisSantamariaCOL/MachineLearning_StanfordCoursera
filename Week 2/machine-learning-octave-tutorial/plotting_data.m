% plotting data

t = [0:0.01:0.98];

y1 = sin(2*pi*4*t);
plot(t, y1);

y2 = cos(2*pi*4*t);
% plot (x, y)
plot(t, y2);

plot(t, y1);
% hold on plots new figures on top of the old one 
hold on;
plot(t, y2, 'r'); %plot in color red 

xlabel('time')
ylabel('value')
legend('sin', 'cos')
title('my plot')

% save in png
print -dpng 'myPlot.png'
% close command to close the plot
close
% 2 figures with 2 differents plots 
figure(1); plot(t, y1);
figure(2); plot(t, y2);
close
% sub-divides the plot into a 1x2 grid 
% starts to access the first element
subplot(1,2,1);
plot(t, y1);
subplot(1,2,2);
plot(t, y2);

% change axis scale
axis([0.5 1 -1 1])