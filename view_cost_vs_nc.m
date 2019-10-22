function view_cost_vs_nc(file_points)
    % compute cost for NC = [1..10] and plot

    points = dlmread(file_points, ' ', 5, 0);

    % function that get the cost for x clusters
    func = @(x) compute_cost_pc(points, clustering_pc(points, x));
    costs = arrayfun(func, [1 : 10]);

    plot([1 : 10], costs, '-b');
    xlabel('Cluster count');
    ylabel('Cost');

end
