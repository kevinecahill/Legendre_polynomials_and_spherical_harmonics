clear all
close all
clc
x = -0.1:0.001:0.1; sf = 16;
y = 0.0;
for n = 0: 10000
    y = y + (n + 1/2)*legendreP(n,x)*legendreP(n,0);
end

plot(x,y,'k-','LineWidth',0.5)

textx='$x$';
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='$P_n$ series for $\delta (x)$';
ylabel(texty,'Interpreter','latex','fontsize',sf)
textt='10000-term Legendre series for Dirac''s delta function';
%title(textt,'Interpreter','latex','fontsize',sf)
print -deps /Users/kevin/papers/math/LegendreDirac1045