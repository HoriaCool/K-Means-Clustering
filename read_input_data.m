% reads cluster count and points from input files
function [NC points] = read_input_data(file_params, file_points)

    NC = 0;
    points = [];

    % read NC
    NC = dlmread(file_params);
    % read points
    points = dlmread(file_points, ' ', 5, 0);

end
