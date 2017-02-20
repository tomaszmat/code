function [a,b]=narrow_bf(f,BW)
R=1-3*BW;
K=(1-2*R*cos(2*pi*f)+R^2)/(2-2*cos(2*pi*f));
b0=1-K;
b1=2*(K-R)*cos(2*pi*f);
b2=R^2-K;
a0=1;
a1=-2*R*cos(2*pi*f);
a2=R^2;
a=[a1,a2];
b=[b0,b1,b2];
endfunction