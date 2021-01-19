clear, clc, close all
%% Before Scaling
figure(1)
subplot(1,2,1)
x = -20:1:50; 
y = -8:0.25:8; 
[X,Y] = meshgrid(x,y);
Z = X.^2 - 5*X.*Y + Y.^4 - 25*X - 8*Y; 
surf(X,Y,Z);
colormap jet
axis tight
ch = colorbar;
xlabel('\fontsize{15} x axis')
ylabel('\fontsize{15} y axis')
zlabel('\fontsize{15} Object function')
title('\fontsize{15} Detail')
subplot(1,2,2)
x = -100:5:100; 
y = -100:2.5:100; 
[X,Y] = meshgrid(x,y);
Z = X.^2 - 5*X.*Y + Y.^4 - 25*X - 8*Y; 
surf(X,Y,Z);
colormap jet
axis tight
ch = colorbar;
xlabel('\fontsize{15} x axis')
ylabel('\fontsize{15} y axis')
zlabel('\fontsize{15} Object function')
title('\fontsize{15} Overview')
%% After Scaling
% subplot(1,2,2)
% x = -20:1:50; 
% y = -56:1.75:56; 
% [X,Y] = meshgrid(x,y);
% Z = X.^2 - (5*X.*Y)/7 - 25.*X + Y.^4/2401 - (8.*Y)/7; 
% surf(X,Y,Z);
% colormap jet
% axis tight
% ch = colorbar
% xlabel('\fontsize{15} x axis')
% ylabel('\fontsize{15} z axis')
% zlabel('\fontsize{15} Object function')
% title('\fontsize{15} AFTER SCALING')


