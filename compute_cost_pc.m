% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
    cost = 0;
    % compute clustering solution cost

    % number of points
    NP = rows(points);
    % number of clusters
    NC = rows(centroids);

    if NC == 1
        cost = sum(norm(repmat(centroids, NP, 1) - points, 'rows'));
    else
        cost = sum(min(reshape(norm(repmat(centroids, NP, 1)
                   - kron(points, ones(NC, 1)), 'rows'), NC, NP)));
    endif

end
