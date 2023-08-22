function getGPX()
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX1 = gpxread("gpxFiles/selaya-picones-de-sopena-castro-valnera-bajada-a-vega-de-pas.gpx");




















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX2 = gpxread("gpxFiles/pandillo-castrovalnera-lunada-picondelfraile-covalrruyo-finc.gpx");


















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX3 = gpxread("gpxFiles/sanroque-porracolina-picondelfraile-piconesdecallejaalbira-s.gpx");















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX4 = gpxread("gpxFiles/valdeason-mosquiteru-porracolina-ason-mortillano-penarocias-.gpx");















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX5 = gpxread("gpxFiles/el-canto-la-lluela-valdicio-porracolina-pizarras-pico-veinte.gpx");





















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dataGPX = {GPX1;
           GPX2;
           GPX3;
           GPX4;
           GPX5};

save("dataGPX.mat","dataGPX")
toc

end