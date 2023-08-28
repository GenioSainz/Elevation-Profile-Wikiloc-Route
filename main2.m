clear all;clc;close all;

%%% MAIN2 --> PLOT ELEVATION GAIN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
readGPXfiles = false;

getGPXdata(readGPXfiles)

load('dataLabels.mat')
load('dataGPX.mat')

for i=1% I = ROUTE PROFILE_I
    
    clearvars -except i dataLabels dataGPX
    
    data  = dataLabels{i};
    GPX   = dataGPX{i};

    %%% READ GPX FILE AND FILTER NAN VALUES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Lat       = GPX.Latitude;
    Lon       = GPX.Longitude;
    Ele       = GPX.Elevation;
    index_nan = isnan(Lat) | isnan(Lon) | isnan(Ele);
    Lat(index_nan) = [];
    Lon(index_nan) = [];
    Ele(index_nan) = [];

    %%% FILTER THE VECTOR ALTITUDE H WITH A MOVMEAN LOW PASS FILTER
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    window_percent = 0.25;
    window_length  = 50;%round(length(Ele)*window_percent/100);
    Ele            = movmean(Ele,window_length);
    
    %%% LAT,LON => COORDS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [coordsx,coordsy,~] = deg2utm(Lat,Lon);

    %%% COMPUTE THE CUMULATIVE DISTANCE VECTOR X
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = zeros(1,length(Ele));
    for j = 1:length(coordsx)-1
        dx     = coordsx(j+1) - coordsx(j);
        dy     = coordsy(j+1) - coordsy(j);
        x(j+1) = x(j)+sqrt(dx^2 + dy^2);
    end
    
    %%% COMPUTE THE ELEVATION GAIN POS AND NEG
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    n        = ceil(x(end)/1000);
    km0      = 0:n-1;
    km1      = 1:n;
    sumh_pos = zeros(1,length(km0));
    sumh_neg = zeros(1,length(km0));
    for j=1:length(x)-1
         
        xi   = x(j)/1000;
        indx = find(xi>km0 & xi<km1);
        
        if Ele(j+1)>Ele(j)
            sumh_pos(indx) = sumh_pos(indx) + Ele(j+1)-Ele(j);
        elseif Ele(j+1)<Ele(j)
            sumh_neg(indx) = sumh_neg(indx) + Ele(j+1)-Ele(j);
        end
    end 

    Egain = round(cumsum(sumh_pos));
 
    %%% COMPUTE MAX, MIN VALUES FOR THE X,Y AXIS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    min_x = 0;
    max_x = ceil(x(end)/1000);
    min_y = round(min(Ele)-0.5e2,-2);
    max_y = round(max(Ele)+0.5e2,-2);

    %%% INIT FIGURE
    %%%%%%%%%%%%%%%%%%
    set(gcf,'position',[0 0 1800 1000],'color','w')
    tiledlayout(1,1,TileSpacing = 'compact',Padding = 'compact');
    nexttile
    hold on;box on;grid on;
    annotation('rectangle',[0 0 1 1 ],'Color','k',LineWidth=0.1);
 
    %%% PLOT FILTER SIGNAL
    %%%%%%%%%%%%%%%%%%%%%%%%%
    area = area(x/1000,Ele);
           area.FaceColor = [0.4660 0.6740 0.1880] ;
           area.FaceAlpha = 0.75;
           area.EdgeColor = [1 0 0];
           area.LineWidth = 1.5;

    %%% PLOT LOCAL NAMES
    %%%%%%%%%%%%%%%%%%%%%%%
    fontsize = 12;
    txt = data.txt;
    TXT = {};
    for k=1:length(txt)
         TXT{k} =text(txt{k,1},txt{k,2},txt{k,3},'FontWeight','bold','FontSize',fontsize);
    end
    
    %%% PLOT ELEVATINS GAIN/LOSS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for j=1:length(sumh_neg)
        
        xpos = km0(j)+0.5;
        tpos = ['+',num2str(round(sumh_pos(j))) ];
        tneg = ['-',num2str(-round(sumh_neg(j)))];
        ypos = min_y-100*(1/3);
        yneg = min_y-100*(2/3);
        text(xpos,ypos,tpos,'FontSize',fontsize-2,'FontWeight','bold',HorizontalAlignment='center');
        text(xpos,yneg,tneg,'FontSize',fontsize-2,'FontWeight','bold',HorizontalAlignment='center');
    end
    
    %%%% ADJUST AXIS LABELS-TICKS AND ASPECT RATIO
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    title({data.title;sprintf('Distance: %0.2f km  EG Wikiloc: %d m EG Computed: %d m',str2num(data.DI),str2num(data.EG),Egain(end))})
    xlabel('Distance [km]')
    ylabel('Height [m]')  
    xticks(min_x:max_x)
    yticks(min_y:100:max_y)
    axis([0 max_x min_y-100 max_y]);
    pbaspect([2 1 1])
    
    %%% AXIS PROPERTIES
    %%%%%%%%%%%%%%%%%%%%%%
    ax               = gca;
    ax.XColor        = 'k';
    ax.YColor        = 'k';
    ax.TickLength    = [0.005 0.01];
    ax.GridLineStyle = '-.';
    ax.GridAlpha     = 0.125;
    ax.Layer         = 'top';
    ax.FontSize      = 14;
    ax.LineWidth     = 1;

    %%exportgraphics(gcf,'imgs/prueba1f.png','Resolution',300);

end
