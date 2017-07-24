<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		       	<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="javascript:void(0)">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="home active fade-in">
					<a href="#/home">Home</a>
				</li>
				<li class="first fade-in">
					<a href="#/first">First</a>
				</li>
				<li class="second">
					<a href="#/second">Second</a>
				</li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control"  ng-model="count">
				</div>
			</form>
			<div class="navbar-left">
				<button class="btn btn-primary" ng-click="getTest()">获取</button>
				<span>{{test}}</span>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</nav>