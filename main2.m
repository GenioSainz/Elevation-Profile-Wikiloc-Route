clear all;clc;close all

getLABELS();

load('dataLabels.mat')
load('dataGPX.mat')

for i=1:5 %length(dataOBJ)
    
    clearvars -except i
    load('dataLabels.mat')
    load('dataGPX.mat')
    data  = dataLabels{i};
    GPX   = dataGPX{i};

    % read gpx file and filter NaN values
    Lat       = GPX.Latitude;
    Lon       = GPX.Longitude;
    Ele       = GPX.Elevation;
    index_nan = isnan(Lat) | isnan(Lon) | isnan(Ele);
    
    Lat(index_nan) = [];
    Lon(index_nan) = [];
    Ele(index_nan) = [];
    
    % lat,lon => coords
    [coordsx,coordsy,~] = deg2utm(Lat,Lon);
    x     = zeros(1,length(Ele));
    x(1)  = 0;
    x_sum = 0;
    h     = Ele;
    
    % compute the distance vector x
    for j=1:length(coordsx)-1
        
        xi     = coordsx(j+1) - coordsx(j);
        yi     = coordsy(j+1) - coordsy(j);
        x_sum  = x_sum + sqrt(xi^2 + yi^2);
        x(j+1) = x_sum;
    
    end
    
    % compute max, min values for the x,y axis
    min_x = 0;
    max_x = round(x_sum+0.5e3,-3)/1000;
    min_y = round(min(h)-0.5e2,-2);
    max_y = round(max(h)+0.5e2,-2);
    
    % filter the vector altitude h with a movmean low pass filter.
    window_percent = 0.25;
    window_length  = round(length(x)*window_percent/100);
    h_m            = movmean(h,window_length);
    
    % plot the profile with function area() and display the 
    % names with text()
    
    set(gcf,'position',[0,0,1800,1000])
    set(gcf,'color','w');
    tiledlayout(1,1,TileSpacing = 'compact',Padding = 'compact');
    nexttile
    hold on;box on;grid on;
    annotation('rectangle',[0 0 1 1 ],'Color','k',LineWidth=0.1);
    % plot filter signal
    area = area(x/1000,h_m);
           area.FaceColor = [0.4660 0.6740 0.1880] ;
           area.FaceAlpha = 0.95;
           area.EdgeColor = [1 0 0];
           area.LineWidth = 1.5;
    
    % adjust axis labels-ticks and aspect ratio   
    xticks(min_x:max_x)
    yticks(min_y:100:max_y)
    axis([0 max_x min_y max_y]);
    pbaspect([2 1 1])
    
    
    title({data.title;sprintf('Distance: %0.2f km  Elevation Gain: %d m',str2num(data.DI),str2num(data.EG))})
    xlabel('Distance [km]')
    ylabel('Height [m]')
    
    % axis properties
    ax               = gca;
    ax.XColor        = 'k';
    ax.YColor        = 'k';
    ax.TickLength    = [0.005 0.01];
    ax.GridLineStyle = '-.';
    ax.GridAlpha     = 0.125;
    ax.Layer         = 'top';
    ax.FontSize      = 14;
    ax.LineWidth     = 1;
    
    % local names labels
    fontsize = 12;
    
    txt = data.txt;
    T ={};
    for k=1:length(txt)
          
         T{k} =text(txt{k,1},txt{k,2},txt{k,3},'FontWeight','bold','FontSize',fontsize);
    end
    
    exportgraphics(gcf,['imgs/elevation_profile_',num2str(i),'.png'],'Resolution',200);

end