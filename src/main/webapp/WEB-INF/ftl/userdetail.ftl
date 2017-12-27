<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
<base id="base" href="${base}">
<title>后台管理模板</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${base}/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${base}/resources/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${base}/resources/css/matrix-style.css" />
<link rel="stylesheet" href="${base}/resources/css/matrix-media.css" />
<link href="${base}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${base}/resources/plugins/webuploader/webuploader.css">
<%-- <link href='${base}/resources/plugins/sheets/gc.spread.sheets.10.2.0.css' rel='stylesheet' type='text/css'/> --%>
<style>
/* #ext img{
			width: 150px; 
			height: 120px;
		} */
#ext div {
	float: left;
	width: 33%;
}
</style>
</head>
<body>
	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard.html">信息管理系统平台</a>
		</h1>
	</div>
	<!--close-Header-part-->

	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav">
			<li class="dropdown" id="profile-messages"><a title="" href="#"
				data-toggle="dropdown" data-target="#profile-messages"
				class="dropdown-toggle"> <i class="icon icon-user"></i>&nbsp; <span
					class="text">欢迎你，${user.userName}</span>&nbsp; <input type="hidden"
					value=${user.id } name="userId" id="userId"> <input
					type="hidden" value=${user.userName } name="userName" id="userName">
					<b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="${base}/user/${user.id}/detail"><i
							class="icon-user"></i> 个人资料</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-check"></i> 我的任务</a></li>
					<li class="divider"></li>
					<li><a href="${base}/logout"><i class="icon-key"></i> 退出系统</a></li>
				</ul></li>
			<li class="dropdown" id="menu-messages"><a href="#"
				data-toggle="dropdown" data-target="#menu-messages"
				class="dropdown-toggle"> <i class="icon icon-envelope"></i>&nbsp;
					<span class="text">我的消息</span>&nbsp; <span
					class="label label-important">4</span>&nbsp; <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a class="sAdd" title="" href="#"><i class="icon-plus"></i>
							新消息</a></li>
					<li class="divider"></li>
					<li><a class="sInbox" title="" href="#"><i
							class="icon-envelope"></i> 收件箱</a></li>
					<li class="divider"></li>
					<li><a class="sOutbox" title="" href="#"><i
							class="icon-arrow-up"></i> 发件箱</a></li>
					<li class="divider"></li>
					<li><a class="sTrash" title="" href="#"><i
							class="icon-trash"></i> 回收站</a></li>
				</ul></li>
			<li class=""><a title="" href="#"><i class="icon icon-cog"></i>
					<span class="text">&nbsp;设置</span></a></li>
			<li class=""><a title="" href="${base}/logout"><i
					class="icon icon-share-alt"></i> <span class="text">&nbsp;退出系统</span></a></li>
		</ul>
	</div>
	<!--close-top-Header-menu-->

	<!--start-top-serch-->
	<div id="search">
		<input type="text" placeholder="搜索..." />
		<button type="submit" class="tip-bottom" title="Search">
			<i class="icon-search icon-white"></i>
		</button>
	</div>

	<!--sidebar-menu-->
	<div id="sidebar">
		<ul>
			<li class="submenu active"><a href="#"><span>个人主页</span></a></li>
			<li class="submenu"><a href="#"><span>video</span></a></li>
			<li class="submenu"><a href="#"><span>blog</span></a></li>
			<li class="submenu"><a href="#"><span>others</span></a></li>
			<li class="submenu"><a href="#"><span>error</span></a></li>
		</ul>
	</div>
	<!--sidebar-menu-->

	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> User Detail</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span6">
					<div class="widget-content nopadding">
						<form action="${base}/user/updateUser" method="post"
							class="form-horizontal">
							<div class="control-group">
								<label class="control-label">User No :</label>
								<div class="controls">
									<input type="hidden" class="span11" placeholder="First name"
										name="id" value="${user.id}" /> <input type="text"
										readonly="readonly" class="span11" placeholder="First name"
										name="userId" value="${user.userId}" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">User Name :</label>
								<div class="controls">
									<input type="text" class="span11" placeholder="Last name"
										name="userName" value="${user.userName}" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">User Password:</label>
								<div class="controls">
									<input type="password" class="span11"
										placeholder="Enter Password" name="password"
										value="${user.password}" />
								</div>
							</div>
							<@shiro.hasAnyRoles name="admin,manage"> 
								<div class="form-actions">
									<button type="submit" class="btn btn-success">Save</button>
								</div>
							</@shiro.hasAnyRoles>   
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end-main-container-part-->


	<script src="${base}/resources/js/excanvas.min.js"></script>
	<script src="${base}/resources/js/jquery-1.11.2.min.js"></script>
	<script src="${base}/resources/js/jquery.ui.custom.js"></script>
	<script src="${base}/resources/js/bootstrap.min.js"></script>
	<script src="${base}/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="${base}/resources/js/matrix.js"></script>
	<script src="${base}/resources/plugins/webuploader/webuploader.js"></script>
</body>
</html>
