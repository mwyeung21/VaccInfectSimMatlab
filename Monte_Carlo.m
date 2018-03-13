clear all
clc

% ------------ Input Disease ------------
disp('Pick a disease. Note it is case sensititive')
fprintf('Pertussis\nFlu\nMeasles\n')
disease = input('Disease Chosen: ','s');
if isequal(disease,'Pertussis')
    vacc = .85; %15 percent chance of getting disease
    unvacc = .20; %80 percent chance of getting disease
elseif isequal(disease,'Flu')
    vacc = .75; %25 percent chance of getting disease
    unvacc = .31; %69 percent chance of getting disease
elseif isequal(disease,'Measles')
    vacc = .97; %3 percent chance of getting disease
    unvacc = .10; %90 percent chance of getting disease
end

disp('Pick size of population.') % Chooses the population size between 20 and 200 people
fprintf('20\n200\n')
speed = input('Population chosen: ','s');
if isequal(speed,'20')
    population_size = 20;
elseif isequal(speed,'200')
    population_size = 200;
end

disp('Pick speed of simulation.') % This changes the amount of 'pause' that's in the infectionSim function.
fprintf('Fast\nSlow\n')
speed = input('Speed chosen: ','s');
if isequal(speed,'Fast')
    sim_speed = 0;
elseif isequal(speed,'Slow')
    sim_speed = 0.25;
end

fprintf('Simulaton Running...Please hold on.\n');
fprintf('Key for Simulation: Blue dot = Vaccinated Person   Green dot = Unvaccinated Person   Red dot = Infected Person \n');


% ------------ 0% Unvaccinated ------------
per_infect_av_0 = []; % These create the matrices that will be used
percentage_of_unvacc_and_infec_av_0 = [];
percentage_of_vacc_and_infec_av_0 = [];
for i = 1:20 % 20 was chosen as a good amount of times to run to decrease variability while not having the sim take too long
    out = infectionSim(unvacc, vacc, population_size, 0, 1, sim_speed); % Run the simulation with 0 unvaccinated
    per_infect_av_0 = [per_infect_av_0, out(1,1)]; % Creates matrix for percent infected and add on for each iteration of the loop.
    percentage_of_unvacc_and_infec_av_0 = [percentage_of_unvacc_and_infec_av_0, out(1,2)]; % ""
    percentage_of_vacc_and_infec_av_0 = [percentage_of_vacc_and_infec_av_0, out(1,3)]; % ""
end
average_infected_0 = mean(per_infect_av_0); % This takes the average of the percent infected matrix.
average_unvacc_and_infected_0 = mean(percentage_of_unvacc_and_infec_av_0); % ""
average_vacc_and_infected_0 = mean(percentage_of_vacc_and_infec_av_0); % ""

% ------------ 5% Unvaccinated ------------
per_infect_av_5 = []; % Same as above portion of code but for 5% unvaccinated.
percentage_of_unvacc_and_infec_av_5 = [];
percentage_of_vacc_and_infec_av_5 = [];
for i = 1:20
    out = infectionSim(unvacc, vacc, population_size, 0.05, 1, sim_speed);
    per_infect_av_5 = [per_infect_av_5, out(1,1)];
    percentage_of_unvacc_and_infec_av_5 = [percentage_of_unvacc_and_infec_av_5, out(1,2)];
    percentage_of_vacc_and_infec_av_5 = [percentage_of_vacc_and_infec_av_5, out(1,3)];
end
average_infected_5 = mean(per_infect_av_5);
average_unvacc_and_infected_5 = mean(percentage_of_unvacc_and_infec_av_5);
average_vacc_and_infected_5 = mean(percentage_of_vacc_and_infec_av_5);


% ------------ 10% Unvaccinated ------------
per_infect_av_10 = []; % Same as above portion of code but for 10% unvaccinated.
percentage_of_unvacc_and_infec_av_10 = [];
percentage_of_vacc_and_infec_av_10 = [];
for i = 1:20
    out = infectionSim(unvacc, vacc, population_size, 0.1, 1, sim_speed);
    per_infect_av_10 = [per_infect_av_10, out(1,1)];
    percentage_of_unvacc_and_infec_av_10 = [percentage_of_unvacc_and_infec_av_10, out(1,2)];
    percentage_of_vacc_and_infec_av_10 = [percentage_of_vacc_and_infec_av_10, out(1,3)];
end
average_infected_10 = mean(per_infect_av_10);
average_unvacc_and_infected_10 = mean(percentage_of_unvacc_and_infec_av_10);
average_vacc_and_infected_10 = mean(percentage_of_vacc_and_infec_av_10);


% ------------ 20% Unvaccinated ------------
per_infect_av_20 = []; % Same as above portion of code but for 20% unvaccinated.
percentage_of_unvacc_and_infec_av_20 = [];
percentage_of_vacc_and_infec_av_20 = [];
for i = 1:20
    out = infectionSim(unvacc, vacc, population_size, 0.2, 1, sim_speed);
    per_infect_av_20 = [per_infect_av_20, out(1,1)];
    percentage_of_unvacc_and_infec_av_20 = [percentage_of_unvacc_and_infec_av_20, out(1,2)];
    percentage_of_vacc_and_infec_av_20 = [percentage_of_vacc_and_infec_av_20, out(1,3)];
end
average_infected_20 = mean(per_infect_av_20);
average_unvacc_and_infected_20 = mean(percentage_of_unvacc_and_infec_av_20);
average_vacc_and_infected_20 = mean(percentage_of_vacc_and_infec_av_20);


% ------------ 30% Unvaccinated ------------
per_infect_av_30 = []; % Same as above portion of code but for 30% unvaccinated.
percentage_of_unvacc_and_infec_av_30 = [];
percentage_of_vacc_and_infec_av_30 = [];
for i = 1:20
    out = infectionSim(unvacc, vacc, population_size, 0.3, 1, sim_speed);
    per_infect_av_30 = [per_infect_av_30, out(1,1)];
    percentage_of_unvacc_and_infec_av_30 = [percentage_of_unvacc_and_infec_av_30, out(1,2)];
    percentage_of_vacc_and_infec_av_30 = [percentage_of_vacc_and_infec_av_30, out(1,3)];
end
average_infected_30 = mean(per_infect_av_30);
average_unvacc_and_infected_30 = mean(percentage_of_unvacc_and_infec_av_30);
average_vacc_and_infected_30 = mean(percentage_of_vacc_and_infec_av_30);


% ------------ 50% Unvaccinated ------------
per_infect_av_50 = []; % Same as above portion of code but for 50% unvaccinated.
percentage_of_unvacc_and_infec_av_50 = [];
percentage_of_vacc_and_infec_av_50 = [];
for i = 1:20
    out = infectionSim(unvacc, vacc, population_size, 0.5, 1, sim_speed);
    per_infect_av_50 = [per_infect_av_50, out(1,1)];
    percentage_of_unvacc_and_infec_av_50 = [percentage_of_unvacc_and_infec_av_50, out(1,2)];
    percentage_of_vacc_and_infec_av_50 = [percentage_of_vacc_and_infec_av_50, out(1,3)];
end
average_infected_50 = mean(per_infect_av_50);
average_unvacc_and_infected_50 = mean(percentage_of_unvacc_and_infec_av_50);
average_vacc_and_infected_50 = mean(percentage_of_vacc_and_infec_av_50);


% ------------ Graphing ------------
graph_mat_y = [average_infected_0,average_infected_5,average_infected_10,average_infected_20,average_infected_30,average_infected_50]; % The y-values will be the average number infected for each percent unvaccinated.
graph_mat_x = [0,5,10,20,30,50]; % The x-values are the percents of unvaccinated.
slope = (average_infected_5-average_infected_0)/5; % Finds the slope of the first portion of the graph (0-5% unvaccinated). This line will be used to show the graph does not increase linearly.
line_y = [average_infected_0,(slope*50)+average_infected_0]; % Sets the y-values of the line to be the y-intercept and the end position figured out by y = mx+b
line_x = [0,50]; % The x values of the line.
figure(2)
plot(graph_mat_x,graph_mat_y); % Graphs the percent infected
line(line_x,line_y,'Color','red','LineStyle','--'); % Draws the line to show non-linearity
title(['Trend in Infection According to Unvaccinated Rate for ',disease]);
xlabel('Percentage of Initial Unvaccinated');
ylabel('Percentage of Final Infected')

graph_mat_2_y_a = [average_vacc_and_infected_0,average_vacc_and_infected_5,average_vacc_and_infected_10,average_vacc_and_infected_20,average_vacc_and_infected_30,average_vacc_and_infected_50]; % Sets the first part of the graph to be percent of people who are vaccinated and infected.
graph_mat_2_y_b = [average_unvacc_and_infected_0,average_unvacc_and_infected_5,average_unvacc_and_infected_10,average_unvacc_and_infected_20,average_unvacc_and_infected_30,average_unvacc_and_infected_50]; % Sets the second part of the graph to be percent of people who are unvaccinated and infected.
graph_mat_2_x = [0,5,10,20,30,50];  % The x-values are the percents of unvaccinated.
figure(3)
plot(graph_mat_2_x,graph_mat_2_y_a); % Plot first line (vaccinated)
hold on
plot(graph_mat_2_x,graph_mat_2_y_b); % Plot second line (unvaccinated)
hold off
legend('Vaccinated', 'Unvaccinated');
title(['Unvaccinated vs. Vaccinated for ',disease]);
xlabel('Percentage of Initial Unvaccinated');
ylabel('Percentage Infected');

fprintf('Simulation finished. \n');