clear all;clc;close all

% data
load('h.mat');
load('x.mat');

% max, min, step values for the x,y axis
x_min  = 15;
x_max  = 15.75; 
x_step = 0.1;

y_min  = 1210;
y_max  = 1245; 
y_step = 5;

% window length percents
percents = [0.05,0.1,0.15,0.2];

set(gcf,'position',[0,0,1920,1080])
set(gcf,'color','w');

for k=1:length(percents)
    
    % filter signal por each window_percent => h_m 
    window_percent = percents(k);
    window_length  = round(length(x)*window_percent/100);
    h_m            = movmean(h,window_length);
    
    subplot(2,2,k)
    
        hold on;box on;grid on;
        camzoom(1.25)
        
        % plot filter signal
        ar  = area(x/1000,h_m);
              ar.FaceColor = [0.4660 0.6740 0.1880] ;
              ar.FaceAlpha = 0.5;
              ar.EdgeColor = [1 0 0];
              ar.LineWidth = 1.25;

        % plot GPS signal
        plot(x/1000,h,'b-',LineWidth = 1.25);

        text(15.25,1236, 'Sopeña',FontWeight='bold',FontSize=13)
        
        % adjust axis labels-ticks and aspect ratio
        xticks(x_min:x_step:x_max)
        yticks(y_min:y_step:y_max)
        axis([x_min x_max y_min y_max]);
        pbaspect([4 3 1])
    
        if k>2
           xlabel('Distance (Km)','FontSize',12,'FontWeight','bold','Color','k')
        else
           xticklabels({})
        end

        ylabel('Height (m)','FontSize',12,'FontWeight','bold','Color','k')
       
        legen = legend(' Filter Signal',' GPS Signal');
        legen.Location   = 'northwest';
        legen.FontSize   = 12;
        legen.FontWeight = 'bold';
        title(legen,['Window Length: ',num2str(percents(k)),'%'],FontSize=14)
        
        % axis properties
        ax               = gca;
        ax.XColor        = 'k';
        ax.YColor        = 'k';
        ax.GridLineStyle = ':';
        ax.GridAlpha     = 0.5;
        ax.Layer         = 'top';
        ax.FontSize      = 12;
        ax.FontWeight    = 'bold';
        ax.LineWidth     = 1;
 
end

% exportgraphics
filename = ['SubPlotWindowLength','.png'];
saveas(gcf,filename)


