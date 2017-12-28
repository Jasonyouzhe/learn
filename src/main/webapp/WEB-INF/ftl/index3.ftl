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
    <link rel="stylesheet" href="${base}/resources/css/matrix-style.css" />
    <link rel="stylesheet" href="${base}/resources/css/matrix-media.css" />
    <link href="${base}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${base}/resources/plugins/webuploader/webuploader.css">
	<%-- <link href='${base}/resources/plugins/sheets/gc.spread.sheets.10.2.0.css' rel='stylesheet' type='text/css'/> --%>
	<style>
		/* #ext img{
			width: 150px; 
			height: 120px;
		} */
		#ext div{
			float: left;
			width: 33%; 
		}
	</style>
</head>
<body>
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
            <li class="submenu"> 
                <a href="#"><span>error</span></a>
            </li>
        </ul>
    </div>
    <!--sidebar-menu-->

    <!--main-container-part-->
    <div id="content">
        <!--breadcrumbs-->
        <div id="content-header">
          <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
        </div>
        <!--End-breadcrumbs-->
            <!-- uploader file -->
			<div id="uploader" class="wu-example" style="float:right">
				<!--用来存放文件信息-->
				<div id="thelist" class="uploader-list"></div>
				<div class="btns">
					<div id="videopicker" style="float:left">选择文件</div>
					<button id="ctlBtn" class="btn btn-default" style="width: 80px; height: 40px; float:left">开始上传</button>
					<button id="delBtn" class="btn btn-default" style="width: 80px; height: 40px;">DELETE</button>
				</div>
			</div>
			<!-- video list start-->
 			<div id="ext" style="float:left">   
				<#if fileList??>
					<#list fileList as file>
						<div>
						    <!-- <img src="${base}/files/${file.shrinkagePath}">-->
						    <video controls="controls" width="300" height="200">
							  <source src="${base}/files/${file.filePath}" type="video/mp4" />
							</video>
						  </div>
					</#list>
				</#if>
			</div> 
			<!-- video list end-->
			<!-- <div id='ss' style='width:100%; height:400px;'></div> -->
    </div>
    <!--end-main-container-part-->


<script src="${base}/resources/js/excanvas.min.js"></script> 
<script src="${base}/resources/js/jquery-1.11.2.min.js"></script> 
<script src="${base}/resources/js/jquery.ui.custom.js"></script> 
<script src="${base}/resources/js/bootstrap.min.js"></script> 
<script src="${base}/resources/js/nicescroll/jquery.nicescroll.min.js"></script> 
<script src="${base}/resources/js/matrix.js"></script> 
<script src="${base}/resources/plugins/webuploader/webuploader.js"></script> 
<%-- <script src="${base}/resources/plugins/sheets/gc.spread.sheets.all.10.2.0.min.js"></script>  --%>
<script type="text/javascript">
	function myrefresh()
	{
		window.location.reload();
	}
	//setTimeout('myrefresh()',1000); //指定1秒刷新一次
    $(document).ready(function(){
    	BASE_URL = $("#base").attr("href")
    	var $list =$("#thelist");
   	    var $btn =$("#ctlBtn");
    	var uploader
   	    uploader = WebUploader.create({
   	        // swf文件路径
   	        swf: BASE_URL + '/resources/plugins/webuploader/Uploader.swf',
   	        // 文件接收服务端。
   	        server: BASE_URL+'/user/file/fileupload',
   	        // 选择文件的按钮。可选。
   	        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
   	        //pick: '#videopicker',
   	     	pick: {
   	      		id:$("#videopicker"), // id
   	         	multiple: false  // false  单选 
   	        },
   	        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
   	        resize: false,
   	        
   	        method: 'post',
   	  		// 限制上传个数
   	     	fileNumLimit: 1,
   	     	// 开起分片上传。
    	     //chunked: true,
   	     	// 只允许选择图片文件。 
   	        accept: { 
   	        title: 'video', 
   	        extensions: 'mp4,flv,jpeg,bmp,doc,docx,rar,pdf',
   	        mimeTypes: 'video/*'
   	        }  
   	    });
// 当有文件被添加进队列的时候
	uploader.on( 'fileQueued', function( file ) {
	    $list.append( '<div id="' + file.id + '" class="item">' +
	        '<h4 class="info">' + file.name + '</h4>' +
	        '<p class="state">等待上传...</p>' +
	        '<textarea name="fileDescription" id="fileDescription" rows="3" cols="20">视频简单描述........</textarea>'+
	    	'</div>');
	});
// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress .progress-bar');

	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<div class="progress progress-striped active">' +
	          '<div class="progress-bar" role="progressbar" style="width: 0%">' +
	          '</div>' +
	        '</div>').appendTo( $li ).find('.progress-bar');
	    }

	    $li.find('p.state').text('上传中');

	    $percent.css( 'width', percentage * 100 + '%' );
	});

	uploader.on( 'uploadSuccess', function( file, response ) {
		if (response._raw==="success"){
		    $( '#'+file.id ).find('p.state').text('已上传');
		    //uploader.removeFile( file )
		    $("#thelist div").remove();
		    uploader.reset();
		    window.location.reload();
		}
	});

	uploader.on( 'uploadError', function( file ) {
	    $( '#'+file.id ).find('p.state').text('上传出错');
	});

	uploader.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').fadeOut();
	});
	
 	  $('#ctlBtn').bind('click', function () {
 		 uploader.options.formData={
   	     		'userId':$("#userId").val(),
   	     		'userName':$("#userName").val(),
   	     		'fileDescription':$("#fileDescription").val(),
   	     		'fileType':"2"
   	     	},
 		  console.log($("#userId").val())
 		  console.log($("#userName").val())
 		  console.log($("#fileDescription").val())
          uploader.upload();
       });
 	  
 	  $('#delBtn').bind('click', function () {
 		 $("#thelist div").remove();
 		 uploader.reset();
       });
	
 	  
 	   //var spread = new GC.Spread.Sheets.Workbook($('#ss')[0], { sheetCount: 1 });
 	   // get spread object
 	   // var spread = $('#ss').data('workbook');
});
    
    
    //初始化相关元素高度
    /* function init(){
        $("body").height($(window).height()-80);
        $("#iframe-main").height(900);
        $("#sidebar").height($(window).height()-50);
    }

    $(function(){
        init();
        $(window).resize(function(){
            init();
        });
    }); */
    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:
    /* function goPage (newURL) {
        // if url is empty, skip the menu dividers and reset the menu selection to default
        if (newURL != "") {
            // if url is "-", it is this page -- reset the menu:
            if (newURL == "-" ) {
                resetMenu();            
            } 
            // else, send page to designated URL            
            else {  
                document.location.href = newURL;
            }
        }
    } */

    // resets the menu selection upon entry to this page:
    /* function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    } */
    // uniform使用示例：
    /* $.uniform.update($(this).attr("checked", true)); */
    </script>
</body>
</html>
