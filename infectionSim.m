function output = infectionSim(unvacc, vacc, NUMOFPEOPLE, unvacc_perc, init_infect, speed)


    %This program uses graph theory.

    %undirected graph of all the vertices WITHOUT edges
    %undirectedGraph = graph(adjMatrix)
    %figure(1)
    %plot(undirectedGraph)

    clear adjMatrix;
    adjMatrix = zeros(NUMOFPEOPLE); %create a NUMOFPEOPLE by NUMOFPEOPLE zero Matrix

    % ----------- Create Relationships -----------
    % Now that the people (vertices/node) are created, we have to create the network of
    % relationships (lines/edges of the graph)
    numOfFriendsMatrix = randi([2,5],1,NUMOFPEOPLE); %assigns numberOfFriends a person should have and stores it in a mat
    % randi(range of numbers, row, column)

    tempMatrix = [];
    count = 0;
    allFriendsMatrix = [];
    for k = 1:NUMOFPEOPLE
        %create friends matricies
        while length(tempMatrix) ~= numOfFriendsMatrix(k)
            count = count +1;
            temp = randi([1, NUMOFPEOPLE]);
            tempMatrix(count) = temp; 
        end
        %tempMatrix

        clear each
        %while loop makes all the tempMatrixs length of 9 so that we can make
        %into an NUMOFPEOPLE by 9 matrix. 
        while length(tempMatrix) ~= 9
            tempMatrix = [tempMatrix, NaN];
        end


        allFriendsMatrix = [allFriendsMatrix; tempMatrix]; %doesnt work bc different lengths of friends (tempMatrix), so need above while loop

        tempMatrix = []; % reset
        count = 0; %reset

    end

    allFriendsMatrix;

    for eachRow = 1:NUMOFPEOPLE
        for eachCol = 1:9 %9 bc you can have at max 9 friends (until this overlaps when making friend matrix)....
            %eachRow
            %allFriendsMatrix(eachRow, eachCol)
            if isnan(allFriendsMatrix(eachRow, eachCol)) == 0
                adjMatrix(eachRow, allFriendsMatrix(eachRow, eachCol)) = 1;
                adjMatrix(allFriendsMatrix(eachRow, eachCol), eachRow) = 1;
            end
        end
    end

    %cannot be friends with yourself so change the adjMatrix, so that the
    %diagonal is all zeros. 
    clear each
    for each = 1:NUMOFPEOPLE
        adjMatrix(each, each) = 0;
    end

    %------ Disease Statistics and Creating infectionMat (creating people and assigning their information) --------
    vacc_perc = 1-unvacc_perc; %percent of population unvaccinated
    infectionMat = nan(3,NUMOFPEOPLE); %create a 3*N number of people infectionMatrix
    number  = round(vacc_perc * NUMOFPEOPLE); %find out number of people vacinnated
    infectionMat(1,1:number) = vacc; %for the vaccinated people, give them an immunity associated with having the vaccine (vacc)
    infectionMat(1,number+1:end) = unvacc; %for the rest of the unvaccinated people, give them an immunity associated with having the vaccine (unvacc)
    infectionMat(2,1:end) = 0; %initally set all of the people to not infected
    infectionMat(2,1:init_infect) = 1; %Infect an init_infect number of people at the begining

    for w = 1:length(infectionMat)
       infectionMat(3,w) = rand;
       % for the 3rd row, assign each person a random number, 
       % this will be used later to determine whether the 
       % person gets infected or not 
    end
    infectionMat; %shows initial infection matrix

    % ------------ Plot Graph ------------
    %create an matrixInfected of infected people from infectionMat
    clear each
    matrixInfected = [];
    matrixUnvacc = [];
    for h= 1:length(infectionMat);
        if infectionMat(1,h) == unvacc
            matrixUnvacc = [matrixUnvacc,h];
        end
    end
    for person = 1:NUMOFPEOPLE
        if infectionMat(2, person) == 1
            matrixInfected = [matrixInfected, person];
        end
    end

    %undirected graph of all the vertices WITH edges
    g = graph(adjMatrix);
    figure(1)
    p = plot(g, 'NodeColor', 'b', 'MarkerSize', 7);
    highlight(p, matrixUnvacc, 'NodeColor','g')
    highlight(p, matrixInfected, 'NodeColor', 'r')
    title_unvacc = unvacc_perc*100;
    title(['Percent of people unvaccinated: ', num2str(title_unvacc),'%']);
    pause(speed)

    % ------------ Figure out Who Ultimately Gets Infected ------------
    % infection matrix
    % row 1: percent chance of NOT getting disease
    % row 2: infected or not infected (boolean)
    % row 3: if this number is greater than row 1, then they are infected if
    %       connected


     % use adjMatrix to determine which people are infected after meeting with
     % all their friends
     for eachRow = 1:length(adjMatrix)
        if infectionMat(2,eachRow) == 1
         for eachCol = 1:length(adjMatrix)

              if adjMatrix(eachRow, eachCol) == 1
                % eachRow = the person
                % eachCol = its friend
                % each person's friend and see if they are get infected. 
                if infectionMat(3, eachCol) > infectionMat(1,eachCol)
                    infectionMat(2, eachCol) = 1;
                    highlight(p, eachCol, 'NodeColor', 'r')
                    pause(speed)
                end
             end
            end
        end
     end

    infectionMat;

    % ----------Calculations based on the Results of the Simulation-----------
     number_of_unvacc = 0; %sets count of the number of unvaccinated people to 0
     number_of_infec_unvacc = 0; %sets count of the number of unvaccinated and infected people to 0

    %counts the number of unvaccinated people and the number of unvaccinated people who got infected
    for x = 1:length(infectionMat)
        if infectionMat(1,x) == unvacc
            number_of_unvacc = number_of_unvacc+1;
        end
        if infectionMat(1,x) == unvacc & infectionMat(2,x) == 1
            number_of_infec_unvacc = number_of_infec_unvacc +1;
        end
    end

    number_of_vacc = 0; %sets count of the number of vaccinated people to 0
    number_of_infec_vacc = 0; %sets count of the number of vaccinated and infected people to 0

    %counts the number of vaccinated people and the number of vaccinated people who got infected
    for x = 1:length(infectionMat)
        if infectionMat(1,x) == vacc
            number_of_vacc = number_of_vacc+1;
        end
        if infectionMat(1,x) == vacc & infectionMat(2,x) == 1
            number_of_infec_vacc = number_of_infec_vacc +1;
        end
    end

    %calculates percentage of unvaccinated people who got infected
    percentage_of_unvacc_and_infec = (number_of_infec_unvacc / number_of_unvacc)*100;

    %calculates percentage of vaccinated people who got infected
    percentage_of_vacc_and_infec = (number_of_infec_vacc / number_of_vacc)*100;

    %----------- Deciding Outputs ---------
    
    %take off numbers off of graph....

    pre_per_infect = cumsum(infectionMat(2,:));
    per_infect = (pre_per_infect(1,NUMOFPEOPLE)/NUMOFPEOPLE)*100;

    output = [per_infect, percentage_of_unvacc_and_infec, percentage_of_vacc_and_infec];
end