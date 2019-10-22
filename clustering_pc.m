% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
    centroids = [];
    new_centr = [];
    % K-Means code:

    if NC == 1
        centroids = mean(points);
        return
    endif

    % number of points
    NP = rows(points);

    % get indexes permutation for NP points
    random_indexes = randperm(NP);
    % get NC-combination of NP points
    random_indexes = random_indexes(1 : NC);
    % get random centroids from points
    centroids = points(random_indexes, :);

    % function that get for each column of x the row where is the min
    f = @(x) [i j] = find(x == min(x));
    tolerance = 0.000000000000001;

    while 1
        new_centr = [];
        % the cluster for each point
        cluster = f(reshape(norm(repmat(centroids, NP, 1)
        			- kron(points, ones(NC, 1)), 'rows'), NC, NP));

        for i = 1 : NC
            v = points(find(cluster == i), :);

            if rows(v) == 1
                new_centr = [new_centr; v]; % only 1 point in cluster
            else
                new_centr = [new_centr; mean(v)];
            endif
        end

        if norm(centroids - new_centr) < tolerance
            centroids = new_centr;
            break
        endif

        centroids = new_centr;
    end

end
