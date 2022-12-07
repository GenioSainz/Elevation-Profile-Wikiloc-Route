clear all;close all;clc

% data
load('h.mat');
load('x.mat');

% min, max, step values for the x,y axis
x_min  = 15;
x_max  = 15.8; 
x_step = 0.1;

y_min  = 1210;
y_max  = 1245; 
y_step = 5;

% window length percents
percents = [0.05,0.1,0.15,0.2];

for k=1:length(percents)
    
    figure(k)

    set(gcf,'position',[0,0,1920,1080])
    set(gcf,'color','w');
    hold on;box on;grid on
    
    % filter signal por each window_percent => h_m 
    window_percent = percents(k);
    window_length  = round(length(x)*window_percent/100);
    h_m            = movmean(h,window_length);
    
    % yyaxis left
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % plot filter signal
    ar  = area(x/1000,h_m);
          ar.FaceColor = [0.4660 0.6740 0.1880] ;
          ar.FaceAlpha = 0.5;
          ar.EdgeColor = [1 0 0];
          ar.LineWidth = 1.25;

    % plot GPS signal
    plot(x/1000,h,'b-',LineWidth = 1.25)
    
    % adjust boundig box corners
    box_x = [x_min x_max]+[-1 1    ]*x_step;
    box_y = [y_min y_max]+[-3/4 1/2]*y_step;
    text(box_x,box_y,'.',FontSize=1)
    
    % adjust axis labels-ticks and aspect ratio
    xticks(x_min:x_step:x_max)
    yticks(y_min:y_step:y_max)
    axis([x_min x_max y_min y_max]);
    pbaspect([4 3 1])

    xlabel('Distance (Km)','FontSize',12,'FontWeight','bold','Color','k')
    ylabel('Height (m)','FontSize',12,'FontWeight','bold','Color','k')
    
    % yyaxis right
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    yyaxis right
    
    % |Gps - Filter|
    diff_signals      = abs(h-h_m);

    % mean |Gps - Filter|
    diff_signals_mean = mean(diff_signals)*ones(1,length(h));

    % plot |Gps - Filter| and mean |Gps - Filter|
    plot(x/1000, diff_signals ,    LineWidth = 1 ,LineStyle = '-',Color=[1 0 1] );
    plot(x/1000, diff_signals_mean,LineWidth = 1 ,LineStyle = '--',Color=[1 0 1] );
    
    % text label mean |Gps - Filter|
    mean_label = mean(diff_signals);
    txt_label  = ['  ',num2str(mean_label,'%.3f'),' m'];

    scatter(x_max,mean_label,MarkerFaceColor='k',MarkerEdgeColor='k');
    text(x_max,mean_label,txt_label,FontSize=14)
    
    % adjust axis labels-ticks and aspect ratio
    yticks(0:1:4)
    axis([x_min x_max 0 4]);
    pbaspect([4 3 1])

    ylabel('|Gps - Filter| (m)','FontSize',13,'FontWeight','bold','Color','k')
    
    % axis properties
    ax               = gca;
    ax.XColor        = 'k';
    ax.YColor        = 'k';
    ax.GridLineStyle = ':';
    ax.GridAlpha     = 0.25;
    ax.Layer         = 'top';
    ax.FontSize      = 13;
    ax.FontWeight    = 'bold';
    ax.LineWidth     = 1;

    fontsize = 16;
    legen = legend(' Filter Signal',' GPS Signal','$|GPS-Filter|$','$\overline{|GPS-Filter|}$','interpreter','latex');
    legen.Location  = 'northwest';
    legen.FontSize  = fontsize;
    
    title_txt = ['Window Length: ',num2str(percents(k),'%.2f'),'%'];
    title( title_txt,'FontWeight','bold','FontSize',fontsize)
    
    % exportgraphics
    filename = ['filter_',num2str(percents(k),'%.2f'),'.png'];
    exportgraphics(figure(k),filename,'Resolution',200)
  
end



