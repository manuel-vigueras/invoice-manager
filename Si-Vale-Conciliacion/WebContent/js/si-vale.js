var myApp = angular.module('myApp', []);

myApp.controller('MyController', function($scope, $http) {

	$scope.filterTransaccionesByUser = function(userName) {
		$http.get('transaccionesByUserAction?usuarioSeleccionado=' + userName)
				.success(function(data, status, headers, config) {
					$scope.transacciones = data;
				}).error(function(data, status, headers, config) {
				});
	};

	$scope.filterTransaccionesByJustificante = function(justificante) {
		$http.get(
				'transaccionesByJustificanteAction?justificanteSeleccionado='
						+ justificante).success(
				function(data, status, headers, config) {
					$scope.transacciones = data;
				}).error(function(data, status, headers, config) {
		});
	};

	$scope.filterTransaccionesByPeriodo = function(periodo) {
		$http
				.get(
						'transaccionesByPeriodoAction?periodoSeleccionado='
								+ periodo).success(
						function(data, status, headers, config) {
							$scope.transacciones = data;
						}).error(function(data, status, headers, config) {
				});
	};
	console.log($scope.transacciones);

});

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

function getTransacciones($scope, $http) {
	$http.get('allTransaccionesAction').success(
			function(data, status, headers, config) {
				$scope.transacciones = data;
			}).error(function(data, status, headers, config) {
	});
}
