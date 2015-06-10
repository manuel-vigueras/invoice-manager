var myApp = angular.module('myApp', []);

myApp.controller('transaccionesController', function($scope, $http) {

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

	$scope.getTransacciones = function() {

		$http.get('allTransaccionesAction').success(
				function(data, status, headers, config) {
					$scope.transacciones = data;
				}).error(function(data, status, headers, config) {
		});
	};

});

myApp.controller('facturasController', function($scope, $http) {

	$scope.filterFacturasByUser = function(userName) {
		$http.get('facturasByUserAction?usuarioSeleccionado=' + userName)
				.success(function(data, status, headers, config) {
					$scope.facturas = data;
				}).error(function(data, status, headers, config) {
				});
	};

	$scope.getAllFacturas = function() {

		$http.get('allFacturasAction').success(
				function(data, status, headers, config) {
					$scope.facturas = data;
				}).error(function(data, status, headers, config) {
		});
	};

});

myApp.controller('satController', function($scope, $http) {

	$scope.filterFacturasConciliadasByPeriodo = function(periodo) {
		$http.get(
				'facturasConciliadasPeriodoAction?periodoSeleccionado='
						+ periodo).success(
				function(data, status, headers, config) {
					$scope.facturas = data;
				}).error(function(data, status, headers, config) {
		});
	};

	$scope.getAllFacturasConciliadas = function() {

		$http.get('facturasConciliadasAction').success(
				function(data, status, headers, config) {
					$scope.facturas = data;
				}).error(function(data, status, headers, config) {
		});
	};

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
