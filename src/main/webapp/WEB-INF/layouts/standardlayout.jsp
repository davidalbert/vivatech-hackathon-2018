<%@page contentType="text/html;charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="../../../../favicon.ico">
	
	<title>Concierge</title>
	
	<link href="/assets/css/fontawesome-all.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="/assets/js/jquery-3.3.1.min.js"></script>

	<link href="/assets/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="/assets/js/underscore-min.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	
	<style>
		body{
			font-family: 'Roboto', sans-serif;
		}
		
		.actionBack{
			margin-left:2px;
		}
		
		.backChevron{
			height :14px;
			margin-top: -2px;
		}
		
		.stepTitle{
			font-size: 32px;
			margin-bottom: 5px;
		}
		
		.row{
			/*background-color: #eef2f6;*/
		}
		
		::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
		    color: #ccc;
		    opacity: 1; /* Firefox */
		}
	</style>
</head>

<body class="text-center">
	<div class="container">
		<tiles:insertAttribute name="content" />
	</div>
</body>
</html>
