function getGPXdata(readGPXfiles)

tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX1.title = "Selaya-Picones de Sopeña-Castro Valnera-Bajada a Vega de Pas desde el alto de Estacas de Trueba-Selaya";
GPX1.EG    = "3047";
GPX1.DI    = "48.24";
GPX1.txt   = {3,550,     'San Bartolo 550m';
              4.5,700,   'Los Pobles 720m';
              5.5,1000,  'Las Mazas 968m';
              9,775,     'El Caracol 808m';
              9.5,1090,  'El Tejo 1050m';
              12,1275,   'Sopeña 1277m';
              17.3,1075, 'Portillo El Cijo 1105m';
              13,1450,   'Picon de los Lastreros 1407m';
              17,1575,   'Torcaverosa 1540m';
              20,1760,   'Castro Valnera 1718m';
              24,1550,   'La Capia 1501m';
              26.50,1340,'Peña del Cuervo 1501m';
              27.00,1250,'El Rostro 1234m';
              29.0,1025, 'Bajada por la cresta Alto de Estacas de Trueba - Vega de Pas';
              34,320,    'Vega de Pas 350m';
              38,750,    'La Braguia 707m';
              44,550,    'El Collao 490m'};
if readGPXfiles
   GPX1_file = gpxread("gpxFiles/selaya-picones-de-sopena-castro-valnera-bajada-a-vega-de-pas.gpx");
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX2.title = "Pandillo-CastroValnera-Lunada-PiconDelFraile-Covalrruyo-FincaDelRey-PortilloElCijo-LaVara-CascadaDeAguasal-Pandillo";
GPX2.EG    = "2228";
GPX2.DI    = "26.13";
GPX2.txt   = {0.25,550, 'Pandillo';
              0.6,1180, 'Fincas de Colina';
              4,1730,   'Castro Valnera 1718m';
              6,1375,   'Torcaverosa';
              7,1580,   'Pico la Miel 1563m';
              9,1275,   'Portillo de Lunada 1320m';
              11,1650,  'Picon del Fraile 1625m';
              13,1530,  'Pico Veinte 1510m';
              14.5,1220,'Mirador de Covalrruyo 1190m';
              16,850,   'La Casa del Rey 890m ';
              18.5,990, 'Fincas de Astragos';
              17.0,1050,'Portillo el Cijo';
              22.2,1050,'Fincas de la Vara';
              23.5,800, 'Cascada de Aguasal';
              24.5,535, 'Pandillo'};
if readGPXfiles
   GPX2_file = gpxread("gpxFiles/pandillo-castrovalnera-lunada-picondelfraile-covalrruyo-finc.gpx");
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX3.title = "SanRoque-Mortero-Porracolina-PiconDelFraile-PiconesDeCallejaAlbira-ElRancho-SanRoque";
GPX3.EG    = "2163";
GPX3.DI    = "33.71";
GPX3.txt   = {1.0,350,    'Los Barrios  360m';
              3,700,      'Calseca';
              1.5,950,    'Fincas de Mortero 950m';
              6,1450,     'Porracolina  1414m';
              13.0,1500,  'Pizarras';
              14.5,1550,  'Pico Veinte';
              16,1650,    'Picon del Fraile 1625';
              22.3,1320,  'Portillo de Lunada 1320m';
              23,1150,    'Resbaladero Lobero';
              24.50,900,  'La Casa del Rey 890m ';
              27.00,1075, 'Picones de Calleja Albira 1030m';
              28.3,600,   'La Concha 580m '};
if readGPXfiles
   GPX3_file = gpxread("gpxFiles/sanroque-porracolina-picondelfraile-piconesdecallejaalbira-s.gpx");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX4.title = "ValDeAsón-Mosquiteru-Porracolina-Sotombo-Asón-Mortillano-PeñaRocias-ValDeAsón";
GPX4.EG    = "2655";
GPX4.DI    = "27.1";
GPX4.txt   =  {0.3,225,   'Val de Asón';
               1.5,500,   'KMV de Val de Asón';
               1.25,1200, 'Mosquiteru';
               3,1350,    'Alto de Pipiones';
               6.5,1375,  'Porracolina';
               7.25,1225, 'Cabañas de Sotombo';
               9.25,800,  'Canal de Rolacía';
               12.5,200,  'Asón';
               13.5,1000, 'Subida Lobera';
               18,1370,   'Mortillano';
               20,1350,   'Peña Rocias ';
               23,900,    'Canal de Cantiscuela';
               25.5 ,225,   'Val de Asón'};
if readGPXfiles
   GPX4_file = gpxread("gpxFiles/valdeason-mosquiteru-porracolina-ason-mortillano-penarocias-.gpx");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX5.title = "El Canto-La LLuela-Valdició-Porracolina-Pizarras-Pico Veinte-Lunada-Pico La Miel-Canal de Valbuena-La Concha-El Canto";
GPX5.EG    = "2186";
GPX5.DI    = "32.95";
GPX5.txt   = {
                00.39,  535, "El Canto"; 
                00.57,  983, "La LLuela"; 
                03.56,  611, "Valdició"; 
                05.33, 1008, "La Pinia"; 
                08.19, 1254, "Alto de la Mina"; 
                07.71, 1409, "Porracolina"; 
                09.32, 1357, "Pico Carrio"; 
                13.77, 1466, "Pizarras"; 
                15.84, 1511, "Pico Veinte"; 
                18.21, 1285, "Lunada"; 
                20.99, 1559, "Pico la Miel"; 
                22.06, 1424, "Alto la Piluca"; 
                23.08, 1134, "Canal de Valbuena"; 
                24.89,  931, "Primer Mirador"; 
                29.59,  641, "La Concha"; 
                27.29,  777, "Bernallan"; 
                29.81,  537, "El Canto"};
if readGPXfiles
    GPX5_file = gpxread("gpxFiles/el-canto-la-lluela-valdicio-porracolina-pizarras-pico-veinte.gpx");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX6.title = "Bernallán-Portillo el Cijo-Castro Valnera-El Bernacho-Pico la Miel-Lunada-Picón del Fraile-Pico Veinte-La Pila-Bernallán";
GPX6.EG    = "2083";
GPX6.DI    = "25.74";
GPX6.txt   = {00.33,  917, "Bernallan"; 
              00.25, 1030, "Astragos"; 
              02.03, 1039, "Portillo El Cijo"; 
              01.50, 1280, "El Coteron"; 
              01.57, 1418, "Picon de los Lastreros"; 
              03.79, 1528, "Picon Lobero"; 
              05.94, 1483, "Torcaverosa"; 
              06.25, 1735, "Castro Valnera"; 
              09.92, 1082, "El Bernacho"; 
              12.46, 1581, "Pico la Miel"; 
              14.43, 1279, "Portillo de Lunada"; 
              18.47, 1638, "Picon del Fraile"; 
              20.76, 1529, "Pico Veinte"; 
              22.16, 1216, "Mirador de Covalrruyo"; 
              23.44, 1011, "La Casa del Rey"; 
              24.25, 880,  "Bernallan"};
if readGPXfiles
    GPX6_file = gpxread("gpxFiles\bernallan-portillo-el-cijo-castro-valnera-el-bernacho-pico-l.gpx");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX7.title = "Bustantegua-Las Mazas-Sopeña-Castro Valnera- Valbuena-La Zamina-Bustantegua";
GPX7.EG    = "2124";
GPX7.DI    = "35.38";
GPX7.txt   = {00.18,  465, "Bustantegua"; 
            01.81,  713, "El Coteron"; 
            02.25,  960, "Las Mazas"; 
            03.61,  784, "El Monjón"; 
            06.59, 1079, "El Tejo"; 
            09.49, 1282, "Sopeña"; 
            11.66, 1081, "Portillo el Cijo"; 
            13.38, 1500, "Picon Lobero"; 
            16.44, 1747, "Castro Valnera"; 
            19.07, 1464, "Alto de la Piluca"; 
            19.70, 1256, "Canal de Valbuena"; 
            20.50, 1100, "Valbuena"; 
            20.50,  890, "Bernallan"; 
            24.02,  949, "Ocijo"; 
            26.50,  925, "La Zamina"; 
            29.25, 1025, "La Cotera"; 
            31.15,  870, "Busmangas"; 
            32.25,  780, "El Carreteron"; 
            33.14,  678, "Las Sirias"; 
            33.06,  481, "Bustantegua";};
if readGPXfiles
    GPX7_file = gpxread("gpxFiles\bustantegua-las-mazas-sopena-castro-valnera-valbuena-la-zami.gpx");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX8.title = "Los Barrios-Ajanedo-Bustablao-Los Machucos-Porracolina-Calseca-Los Barrios";
GPX8.EG    = "1477";
GPX8.DI    = "22.06";
GPX8.txt   = {00.05,  384, "Los Barrios"; 
                00.98,  317, "Las Vegas"; 
                02.53,  443, "Ajanedo"; 
                05.78,  639, "Alto Bustablao"; 
                09.30,  237, "Bustablao"; 
                11.39,  888, "Los Machucos"; 
                13.77, 1154, "Zs Loberas"; 
                15.74, 1438, "Porracolina"; 
                19.00, 825,  "Calseca"; 
                20.50, 400, "Los Barrios"; };
if readGPXfiles
    GPX8_file =  gpxread("gpxFiles\losbarrios-ajanedo-bustablao-losmachucos-porracolina-calseca.gpx");
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% DATA LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dataLabels = {GPX1;
              GPX2;
              GPX3;
              GPX4;
              GPX5;
              GPX6;
              GPX7;
              GPX8};
save("dataLabels.mat","dataLabels")

%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if readGPXfiles
    dataGPX = {GPX1_file;
               GPX2_file;
               GPX3_file;
               GPX4_file;
               GPX5_file;
               GPX6_file;
               GPX7_file;
               GPX8_file};
    save("dataGPX.mat","dataGPX")
end




toc

end