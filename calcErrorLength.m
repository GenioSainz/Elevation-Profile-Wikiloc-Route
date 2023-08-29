clear all;clc;close all;

%%% MAIN2 --> PLOT ELEVATION GAIN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
readGPXfiles = false;
getGPXdata(readGPXfiles)

load('dataGPX.mat')
load('dataLabels.mat')

tic
WP  = 2:2:44;
n   = length(WP);
mat = zeros(n,8);

for wp = 1:n
    for i=1:length(dataLabels) % i= ROUTE_PROFILE_i
        
        clearvars -except i wp WP n mat dataLabels dataGPX 
        
        GPX   = dataGPX{i};
        data  = dataLabels{i};
    
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
        window_percent = WP(wp);
        window_length  = round(length(Ele)*window_percent/100);
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
        Eloss = round(cumsum(sumh_neg));
     
        EG_wiki = str2double(data.EG);
        EG_comp = Egain(end);
        EL_comp = abs(Eloss(end));
    
        mat(wp,i)=100*abs(EG_wiki-EG_comp)/EG_wiki;
        
    %     fprintf('###################### \n')
    %     fprintf('PROFILE %d \n',i)
    %     fprintf('Wikiloc  E-GAIN:%d \n',EG_wiki)
    %     fprintf('Computed E-GAIN:%d  error:%0.3f%%\n' ,EG_comp,100*abs(EG_wiki-EG_comp)/EG_wiki)
    %     fprintf('Computed E-LOSS:%d  error:%0.3f%%\n' ,EL_comp,100*abs(EG_wiki-EL_comp)/EG_wiki)
        
    end
end


%%% INIT BAR FIGURE
%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'position',[0 0 1800 1000],'color','w')
tiledlayout(1,1,TileSpacing = 'compact',Padding = 'compact');
nexttile
    hold on;box on;grid on;
    annotation('rectangle',[0 0 1 1 ],'Color','k',LineWidth=0.1);
    
xticks(WP)
yticks(0:50:700)
hbar=bar(WP,mat,'stacked');
xlabel('Moving Average Window Length');
ylabel('Cumulative Percent Error [%]'); 

%%% LEGEND
%%%%%%%%%%%%%
for j=1:length(hbar)
    bar_leg(j) = plot(nan,nan);
    bar_leg(j).DisplayName = ['Profile',num2str(j)];
    bar_leg(j).Color = hbar(j).FaceColor;
    bar_leg(j).LineWidth = 8;

end
legend(bar_leg, 'location', 'north','NumColumns',length(hbar))

%%% AXIS PROPERTIES
%%%%%%%%%%%%%%%%%%%%%%
ax               = gca;
ax.XColor        = 'k';
ax.YColor        = 'k';
ax.TickLength    = [0.005 0.01];
ax.GridLineStyle = '-.';
ax.GridAlpha     = 0.125;
ax.Layer         = 'top';
ax.FontSize      = 16;
ax.LineWidth     = 1;
    
exportgraphics(gcf,'filterImgs/bar_widow_length.png','Resolution',300);

toc