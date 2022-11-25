clear all;clc;close all

GPX       = gpxread("pandillo-castrovalnera-lunada-picondelfraile-covalrruyo-finc.gpx");
Lat       = GPX.Latitude;
Lon       = GPX.Longitude;
Ele       = GPX.Elevation;

[coordsx,coordsy,~] = deg2utm(Lat,Lon);
x     = zeros(1,length(Ele));
x(1)  = 0;
x_sum = 0;
h     = Ele;

for i=1:length(coordsx)-1
    
    xi     = coordsx(i+1) - coordsx(i);
    yi     = coordsy(i+1) - coordsy(i);
    x_sum  = x_sum + sqrt(xi^2 + yi^2);
    x(i+1) = x_sum;

end

min_x = 0;
max_x = round(x_sum+0.5e3,-3)/1000;
min_y = round(min(h)-0.5e2,-2);
max_y = round(max(h)+0.5e2,-2);

window_percent = 0.25;
window_length  = round(length(x)*window_percent/100);
h_m            = movmean(h,window_length);

hold on;box on;grid on

    set(gcf,'position',[0,0,1920,1080])
    set(gcf,'color','w');
    
    area = area(x/1000,h_m);
           area.FaceColor = [0.4660 0.6740 0.1880] ;
           area.FaceAlpha = 0.95;
           area.EdgeColor = [1 0 0];
           area.LineWidth = 1.5;

    xticks(min_x:max_x)
    yticks(min_y:100:max_y)
    axis([0 max_x min_y max_y]);
    pbaspect([2 1 1])
    
    title({'PANDILLO - CASTRO VALNERA - LUNADA - PICON DEL FRAILE - COVALRUYO - FINCA DEL REY - PORTILLO EL CIJO - LA VARA - CASCADA AGUASAL - PANDILLO';'DISTANCIA: 26.13Km    DESNIVEL+: 2228m'})
    xlabel('Distance (Km)','FontSize',12,'FontWeight','bold','Color','k')
    ylabel('Height (m)','FontSize',12,'FontWeight','bold','Color','k')
    
    ax               = gca;
    ax.XColor        = 'k';
    ax.YColor        = 'k';
    ax.GridLineStyle = ':';
    ax.GridAlpha     = 0.5;
    ax.Layer         = 'top';
    ax.FontSize      = 11;
    ax.LineWidth     = 1;
    




