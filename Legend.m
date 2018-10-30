clear all
close all
clc

x=-1:0.001:1;

%plot(x,mfun('P',0,x),'k','linewidth',2)
plot(x,legendreP(0,x),'k','linewidth',2)
hold on
for n = 1:19
    %plot(x,mfun('P',n,x),'k','linewidth',2-0.1*n)
    plot(x,legendreP(n,x),'k','linewidth',2-0.1*n)
end
sf = 16; fs = 14; ts = 12;
set(gca,'linewidth',1,'fontsize',fs)
axis([-1,1,-1,1])
%text('Interpreter','latex','String','$$P_n(x)$$','Position',[-1.3,0.0],'FontSize',fs)
%text('Interpreter','latex','String','$$x$$','Position',[-0.01,-1.3],'FontSize',fs)
%h=title('Twenty Legendre Polynomials','FontSize',fs)
%set(h,'FontName','Courier')
%text('Interpreter','latex','String','Twenty Legendre Polynomials','Position',[-.55,1.2],'FontSize',fs)
%set(gca,'xtick',[-1:.5:1])
%set(gca,'ytick',[-1:.5:1])
%h=legend('Mermin_1','Mermin_2','Ramanujan')
%ounits=get(gcf,'Units');
%set(gcf,'Units','normalized','OuterPosition',[0 0 1 1],'Units',ounits)
textx='$x$'
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty=('$P_n(x)$')
ylabel(texty,'Interpreter','latex','fontsize',sf)
orient landscape
print -dpdf Legendre
print -deps Legendre
print -deps /Users/kevin/papers/math/Legendre