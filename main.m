clear all;clc;close all

% read gpx file and filter NaN values
GPX       = gpxread("pandillo-castrovalnera-lunada-picondelfraile-covalrruyo-finc.gpx");
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
for i=1:length(coordsx)-1
    
    xi     = coordsx(i+1) - coordsx(i);
    yi     = coordsy(i+1) - coordsy(i);
    x_sum  = x_sum + sqrt(xi^2 + yi^2);
    x(i+1) = x_sum;

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
hold on;box on;grid on

    set(gcf,'position',[0,0,1920,1080])
    set(gcf,'color','w');
    
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
    
    title({'PANDILLO - CASTRO VALNERA - LUNADA - PICON DEL FRAILE - COVALRUYO - FINCA DEL REY - PORTILLO EL CIJO - LA VARA - CASCADA AGUASAL - PANDILLO';'DISTANCE: 26.13Km    ELEVATION GAIN: 2228m'})
    xlabel('Distance (Km)','FontSize',12,'FontWeight','bold','Color','k')
    ylabel('Height (m)','FontSize',12,'FontWeight','bold','Color','k')
    
    % axis properties
    ax               = gca;
    ax.XColor        = 'k';
    ax.YColor        = 'k';
    ax.GridLineStyle = ':';
    ax.GridAlpha     = 0.5;
    ax.Layer         = 'top';
    ax.FontSize      = 11;
    ax.LineWidth     = 1;
    
    % local names labels
    fontsize = 10.5;
    text(0.25,550, 'Pandillo','FontWeight','bold','FontSize',fontsize)
    text(0.75,1180,'Fincas de Colina','FontWeight','bold','FontSize',fontsize)
    text(4,1730,   'Castro Valnera 1718m','FontWeight','bold','FontSize',fontsize)
    text(6,1375,   'Torcaverosa','FontWeight','bold','FontSize',fontsize)
    text(7,1580,   'Pico la Miel 1563m','FontWeight','bold','FontSize',fontsize)
    text(9,1275,   'Portillo de Lunada 1320m','FontWeight','bold','FontSize',fontsize)
    text(11,1650,  'Picon del Fraile 1625m','FontWeight','bold','FontSize',fontsize)
    text(13,1530,  'Pico Veinte 1510m','FontWeight','bold','FontSize',fontsize)
    text(14.5,1220,'Mirador de Covalrruyo 1190m','FontWeight','bold','FontSize',fontsize)
    text(16,850,   'La Casa del Rey 890m ','FontWeight','bold','FontSize',fontsize)
    text(18.5,990, 'Fincas de Astragos','FontWeight','bold','FontSize',fontsize)
    text(17.3,1050,'Portillo el Cijo','FontWeight','bold','FontSize',fontsize)
    text(22.2,1050,'Fincas de la Vara','FontWeight','bold','FontSize',fontsize)
    text(23.5,800, 'Cascada de Aguasal','FontWeight','bold','FontSize',fontsize)
    text(25.9,550, 'Pandillo','FontWeight','bold','FontSize',fontsize)
    




