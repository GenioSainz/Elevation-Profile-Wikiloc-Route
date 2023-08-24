# Elevation Profile

With this script you can represent and customize altitude profiles from .gpx files using Matlab. To smooth the profile, the [Moving mean](https://es.mathworks.com/help/matlab/ref/movmean.html) function is used. It's important to select the length of the moving mean window based on the GPS signal quality through the **window_percent** parameter. This parameter represents the window length as a percentage of the total number of GPS samples.

Some examples to compare the effect of varying the parameter **window_percent**:
<br/>

![ElevationProfile](filterImgs/SubPlotWindowLength.png)
<br/>

$$ \overline{|GPS-Filtered|} = 0.271m   $$

![ElevationProfile](filterImgs/filter_0.05.png)
<br/><br/>


# Elevation profiles final examples from my wikiloc routes

## Profile 1
https://es.wikiloc.com/rutas-senderismo/selaya-picones-de-sopena-castro-valnera-bajada-a-vega-de-pas-desde-el-alto-de-estacas-de-trueba-sel-57011719
![](imgs/elevation_profile_1.png)
<br/>

## Profile 2
https://es.wikiloc.com/rutas-senderismo/pandillo-castrovalnera-lunada-picondelfraile-covalrruyo-fincadelrey-portilloelcijo-lavara-cascadade-73922005
![](imgs/elevation_profile_2.png)
<br/>

## Profile 3
https://es.wikiloc.com/rutas-senderismo/sanroque-porracolina-picondelfraile-piconesdecallejaalbira-sanroque-69089035
![](imgs/elevation_profile_3.png)
<br/>

## Profile 4
https://es.wikiloc.com/rutas-senderismo/valdeason-mosquiteru-porracolina-ason-mortillano-penarocias-valdeason-72540252
![](imgs/elevation_profile_4.png)
<br/>

## Profile 5
https://es.wikiloc.com/rutas-senderismo/el-canto-la-lluela-valdicio-porracolina-pizarras-pico-veinte-lunada-pico-la-miel-canal-de-valbuena-120774650
![](imgs/elevation_profile_5.png)
<br/>

## Profile 6
https://es.wikiloc.com/rutas-senderismo/bernallan-portillo-el-cijo-castro-valnera-el-bernacho-pico-la-miel-lunada-picon-del-fraile-pico-vei-123025667
![](imgs/elevation_profile_6.png)
<br/>

## Profile 7
https://es.wikiloc.com/rutas-senderismo/bustantegua-las-mazas-sopena-castro-valnera-valbuena-la-zamina-bustantegua-123253959
![](imgs/elevation_profile_7.png)
<br/>

## Profile 8
https://es.wikiloc.com/rutas-senderismo/losbarrios-ajanedo-bustablao-losmachucos-porracolina-calseca-losbarrios-144384091
![](imgs/elevation_profile_8.png)
<br/>