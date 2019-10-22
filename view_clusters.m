% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
    % graphical representation code:

    % number of points
    NP = rows(points);
    % number of clusters
    NC = rows(centroids);

    % Creates a NC-by-3 set of colors from the HSV colormap
    cmap = hsv(NC);

    if NC == 1
        scatter3(points(:, 1), points(:, 2), points(:, 3),
                 [10], cmap(1, :), 'filled');
        hold on;
        return
    endif

    % function that get for each column of x the row where is the min
    f = @(x) [i j] = find(x == min(x));

    % the cluster of each point
    cluster = f(reshape(norm(repmat(centroids, NP, 1)
                - kron(points, ones(NC, 1)), 'rows'), NC, NP));

    for i = 1 : NC
        % points from cluster i
        v = points(find(cluster == i), :);

        scatter3(v(:, 1), v(:, 2), v(:, 3), [10], cmap(i, :), 'filled');
        hold on;
    end

end
