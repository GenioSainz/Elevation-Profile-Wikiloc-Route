function getLABELS()
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
              25.9,550, 'Pandillo'};

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
               26 ,225,   'Val de Asón'};
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dataLabels = {GPX1;
              GPX2;
              GPX3;
              GPX4;
              GPX5};

save("dataLabels.mat","dataLabels")
toc

end