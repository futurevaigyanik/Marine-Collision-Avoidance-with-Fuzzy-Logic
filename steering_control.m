x1=[300 0.5 0 0 0 0 0 0 0 45];
a = readfis('steering_control');
y1=evalfis(x1, a);
disp(y1);
xpos=[0 100 200 300];
ypos=[0 200 600 500];
plot(xpos,ypos);
