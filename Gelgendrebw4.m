% Matlab script to plot the first 10 Legendre polynomials
% Range: -1 to 1

x = linspace(-1, 1, 500);
figure('Color', 'k'); % Set figure background to black
hold on;

% Define colors and styling
%plotColor = [0, 0.5, 1]; % A bright blue that stands out on black
set(gca, 'Color', 'k', 'XColor', 'k', 'YColor', 'k'); % Set axes to black with white lines

Nmax = 40
for n = 2:Nmax
    y = legendreP(n, x);
    plotColor = 'w'; 
    plot(x, y, 'Color', plotColor, 'LineWidth', 4 - 3.9*n/Nmax);
    y = legendreP(2*n+1, x);
    plotColor = 'b'; 
    plot(x, y, 'Color', plotColor, 'LineWidth', 4 - 3.9*n/Nmax);
end

% Formatting the plot
%title('First 10 Legendre Polynomials', 'Color', 'k');
%xlabel('x', 'Color', 'k');
%ylabel('P_n(x)', 'Color', 'k');
%grid on;
%set(gca, 'GridColor', [0.3, 0.3, 0.3]); % Subtle grey grid
hold off;
print -dpdf Legendre6
print -deps Legendre6
print -deps /Users/kevin/papers/math/Legendre6