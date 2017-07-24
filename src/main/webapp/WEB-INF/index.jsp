<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html ng-app="app">

	<head>
		<meta charset="UTF-8">
		<title>home</title>
		<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
		<script src="resources/js/angular.js"></script>
		<script src="resources/js/angular-route.min.js"></script>
		<script src="resources/js/angular-animate.min.js"></script>
		<script src="resources/js/jquery-1.12.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
	</head>

	<body ng-controller="myCtrl">
		<div nav-directive></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 view_wrap {{ pageClass }}" ng-view></div>
			</div>
			<div footer-directive></div>
		</div>
	</body>
	<script type="text/javascript">
		var app = angular.module('app', ['ngRoute', 'ngAnimate']);
		app.factory('getTestService',function($http){
			return {
				getTest:function(){
					return	$http.get("${basePath}/test/poetry.html")
				}
			}
		})
		app.directive('navDirective', function() {
			return {
				restrict: 'A',
				replace: 'true',
				templateUrl: '${basePath}/resources/directives/navbar-directive.jsp',
				controller:function($scope){
					$scope.$watch('count',function(newVal,oldVal){
//						console.log(newVal)
					})
				},
				link: function(scope, ele, attrs) {
				}
			}
		});
		app.directive('footerDirective', function() {
			return {
				restrict: 'A',
				replace: 'true',
				templateUrl: '${basePath}/resources/directives/footer.jsp',
				controller:function($scope){
				},
				link: function(scope, ele, attrs) {
				}
			}
		})

		app.controller('myCtrl', function($scope, $location,$filter,$interval,getTestService) {
			$scope.count = 0;
			$scope.getTest = function(){
				getTestService.getTest().then(function(res){
					$scope.test = res.data.name;
				});
			}
			$scope.localTime = $filter('date')(new Date(), "yyyy-MM-dd hh:mm:ss");
			$interval(function(){
				$scope.localTime = $filter('date')(new Date(), "yyyy-MM-dd hh:mm:ss");
			},1000)
			$scope.$on('$viewContentLoaded', function() {
				$scope.count += 1;
				if($location.$$url.substring(1)){
					$('.' + $location.$$url.substring(1)).addClass('active').siblings().removeClass('active');
				}else{
					$('.home').addClass('active').siblings().removeClass('active');
				}
			})
		});

		app.controller('homeController', function($scope) {
			$scope.pageClass = 'page-home';
		});

		// about page controller
		app.controller('firstController', function($scope) {
			$scope.pageClass = 'page-first';
		});

		// contact page controller
		app.controller('secondController', function($scope) {
			$scope.pageClass = 'page-second';
		});

		app.config(function($routeProvider, $locationProvider) {
			$locationProvider.html5Mode(false);
			$locationProvider.hashPrefix('')
			$routeProvider
				.when('/', {
					templateUrl: '${basePath}/resources/template/home.jsp',
					controller: 'homeController'
				})
				.when("/first", {
					templateUrl: "${basePath}/resources/template/first.jsp",
					controller: 'firstController'
				})
				.when("/second", {
					templateUrl: "${basePath}/resources/template/second.jsp",
					controller: 'secondController'
				})
				.otherwise({
					redirectTo: '/'
				});
		})
	</script>

</html>