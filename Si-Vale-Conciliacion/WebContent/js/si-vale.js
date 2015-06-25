function getUsuarios($scope, $http) {
	$http.get('filtroUsuariosAction').success(
			function(data, status, headers, config) {
				$scope.usuarios = data;
			}).error(function(data, status, headers, config) {
	});
}

function getJustificantes($scope, $http) {
	$http.get('filtroJustificanteAction').success(
			function(data, status, headers, config) {
				$scope.justificantes = data;
			}).error(function(data, status, headers, config) {
	});
}

