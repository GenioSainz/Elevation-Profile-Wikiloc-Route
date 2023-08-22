function getTxtCoords(TXT)


%     getTxtCoords(T)

%     00.39,  535, "El Canto"; 
%     00.57,  983, "La LLuela"; 
%     03.42,  615, "Valdició"; 
%     05.33, 1008, "La Pinia"; 
%     08.97, 1255, "Alto de la Mina"; 
%     08.18, 1412, "Porracolina"; 
%     10.28, 1362, "Pico Carrio"; 
%     14.88, 1473, "Pizarras"; 
%     16.86, 1514, "Pico Veinte"; 
%     19.31, 1282, "Lunada"; 
%     22.40, 1550, "Pico la Miel"; 
%     23.43, 1420, "Alto la Piluca"; 
%     24.55, 1141, "Canal de Valvuena"; 
%     25.99,  951, "Primer Mirador"; 
%     30.94,  650, "La Concha"; 
%     28.68,  784, "Bernallan"; 
%     30.87,  549, "El Canto"; 

    fprintf('\n')
    for i = 1:length(TXT)

        x = TXT{i}.Position(1);
        y = TXT{i}.Position(2);
        s = TXT{i}.String;
        fprintf('%05.2f, %4d, "%s"; \n',round(x,2),round(y),s)
    end
    fprintf('\n')
    
end