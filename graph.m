% this will generate plots for clusters and cost in function of number of clusters
function graph(file_index)

	% files
  file_params = strcat("cls/cluster_", num2str(file_index), ".param");
	file_points = strcat("cls/cluster_", num2str(file_index), ".points");

	% call clustering algorithm to compute centroids
	[points centroids] = clustering(file_params, file_points);
  
  % view 3D result points
	figure(1)
	clf
	view_points(points);
	
	% view 3D result clusters
	figure(2)
	clf
	view_clusters(points, centroids);

	% draw cost(NC) function
	figure(3)
	clf
	view_cost_vs_nc(file_points);
end

