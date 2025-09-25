% main.m
global Nx NumGLP
% Nx = 200;
NumGLP = 5;
CFL = 0.1;

get_GLP

init_data

RK3

calculate_L2_Error

draw_average
