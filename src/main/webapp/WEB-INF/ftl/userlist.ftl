<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
	<base id="base" href="${base}">
    <title>后台管理模板</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${base}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${base}/resources/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${base}/resources/css/uniform.css" />
	<link rel="stylesheet" href="${base}/resources/css/select2.css" />
	<link rel="stylesheet" href="${base}/resources/css/matrix-style2.css" />
    <link rel="stylesheet" href="${base}/resources/css/matrix-style.css" />
    <link rel="stylesheet" href="${base}/resources/css/matrix-media.css" />
    <link href="${base}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<style>
	</style>
</head>
<body style="height:900px">
    <!--Header-part-->
    <div id="header">
      <h1><a href="dashboard.html">信息管理系统平台</a></h1>
    </div>
    <!--close-Header-part--> 

    <!--top-Header-menu-->
    <div id="user-nav" class="navbar navbar-inverse">
        <ul class="nav">
            <li  class="dropdown" id="profile-messages" >
                <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle">
                    <i class="icon icon-user"></i>&nbsp;
                    <span class="text">欢迎你，${user.userName}</span>&nbsp;
                    <input type="hidden" value=${user.id} name="userId" id="userId">
                    <input type="hidden" value=${user.userName} name="userName" id="userName">
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${base}/user/${user.id}/detail"><i class="icon-user"></i> 个人资料</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="icon-check"></i> 我的任务</a></li>
                    <li class="divider"></li>
                    <li><a href="${base}/logout"><i class="icon-key"></i> 退出系统</a></li>
                </ul>
            </li>
            <li class="dropdown" id="menu-messages">
                <a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle">
                    <i class="icon icon-envelope"></i>&nbsp;
                    <span class="text">我的消息</span>&nbsp;
                    <span class="label label-important">4</span>&nbsp; 
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> 新消息</a></li>
                    <li class="divider"></li>
                    <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> 收件箱</a></li>
                    <li class="divider"></li>
                    <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> 发件箱</a></li>
                    <li class="divider"></li>
                    <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> 回收站</a></li>
                </ul>
            </li>
            <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">&nbsp;设置</span></a></li>
            <li class=""><a title="" href="${base}/logout"><i class="icon icon-share-alt"></i> <span class="text">&nbsp;退出系统</span></a></li>
        </ul>
    </div>
    <!--close-top-Header-menu-->

    <!--start-top-serch-->
    <div id="search">
        <input type="text" placeholder="搜索..."/>
        <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
    </div>
    
       <!--sidebar-menu-->
    <div id="sidebar">
        <ul>
            <li class="submenu active">
                <a href="#"><span>
                <@shiro.user>  
    				欢迎[<@shiro.principal />] 
   				 </@shiro.user></span></a> 
            </li>
            <li class="submenu"> 
                <a href="#"><span>video</span></a>
            </li>
            <li class="submenu">
				<a href="#"><span>blog</span></a>
            </li>
            <li class="submenu"> 
                <a href="#"><span>others</span></a>
            </li>
            <@shiro.hasAnyRoles name="admin,manage"> 
	            <li class="submenu"> 
	                <a href="${base}/user/userlist"><span>manage user</span></a>
	            </li>
           </@shiro.hasAnyRoles>   
        </ul>
    </div>
    <!--sidebar-menu-->

    <!--main-container-part-->
    <div id="content" style="width:auto;height:120px; overflow-y:scroll; border:1px solid;">
        <!--breadcrumbs-->
        <div id="content-header">
          <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
        </div>
        <!--End-breadcrumbs-->
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>user list</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>userNo</th>
                  <th>username</th>
                  <th>userstatus</th>
                  <th>roles</th>
                  <th>permissions</th>
                </tr>
              </thead>
              <tbody>
              <#if userList??>
              		<#list userList as user>
						<tr>
						     <td>${user.userId }</td>
			                 <td>${user.userName }</td>
			                 <#if user.userDzone==0>
			                  	<td class="center">正常</td>
			                 <#else> 
			                  	<td class="center">冻结</td>
			                 </#if>
			                 <td>
				                 <div class="control-group">
						         <div class="controls">	
					                 <#list user.roles as role>
						                  <label>
						                  <input type="checkbox" name="roleName" />
						                  ${role.roleName }
						                  </label>
							         </#list>
						         </div>
						         </div>	
			                 </td>
			                 <td>
				                 <div class="control-group">
						         <div class="controls">	
					                 <#list user.roles as role>
					                 	<#list role.permissions as permission>
							                  <label>
							                  <input type="checkbox" name="permissionName" />
							                  ${permission.permissionsName }
							                  </label>
						                  </#list>
							         </#list>
						         </div>
						         </div>	
			                 </td>
						 </tr>
					</#list>
              </#if>
              </tbody>
            </table>
	            <!-- 利用pageHelper分页
	            <div style="float:right">
		            <#if page??>
		            	<p>一共${page.pages}页</p>
				        <a href="${base}/user/userlist?pageNumber=${page.firstPage}">第一页</a>
				        <a href="${base}/user/userlist?pageNumber=${page.nextPage}">下一页</a>
				        <a href="${base}/user/userlist?pageNumber=${page.prePage}">上一页</a>
				        <a href="${base}/user/userlist?pageNumber=${page.lastPage}">最后页</a>
				    </#if>
			    </div>
	          	利用pageHelper分页  -->
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
<script src="${base}/resources/js/jquery.uniform.js"></script> 
<script src="${base}/resources/js/select2.min.js"></script> 
<script src="${base}/resources/js/jquery.dataTables.min.js"></script> 
<script src="${base}/resources/js/matrix.tables.js"></script>
<script src="${base}/resources/js/matrix.form_common.js"></script>
<script src="${base}/resources/js/nicescroll/jquery.nicescroll.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	BASE_URL = $("#base").attr("href");
	
});
</script>
</body>
</html>
