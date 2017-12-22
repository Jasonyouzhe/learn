<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
<base id="base" href="${base}">
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${base}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${base}/resources/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${base}/resources/css/matrix-style2.css" />
<link rel="stylesheet" href="${base}/resources/css/matrix-media.css" />
<link href="${base}/resources/font-awesome/css/font-awesome.css"rel="stylesheet" />
</head>
<body>

	<div id="content">
		<div id="content-header">
			<h1>错误页面</h1>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>Error 2</h5>
						</div>
						<div class="widget-content">
							<div class="error_ex">
								<h1>Error 2</h1>
								<h3>Opps,SQLException.</h3>
								<p>SQLException Please contact IT.</p>
								<a class="btn btn-warning btn-big" href="${base}/tologin">Back to
									Home</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${base}/resources/js/jquery-1.11.2.min.js"></script> 
	<script src="${base}/resources/js/jquery.ui.custom.js"></script>
	<script src="${base}/resources/js/bootstrap.min.js"></script>
	<script src="${base}/resources/js/maruti.html"></script>
</body>
</html>
