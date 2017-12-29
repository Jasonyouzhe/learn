<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<base id="base" href="${base}">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>register</title>
	<link href="${base}/resources/plugins/fontsverity/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/resources/plugins/fontsverity/css/gloab.css" rel="stylesheet">
	<link href="${base}/resources/plugins/fontsverity/css/index.css" rel="stylesheet">
</head>
<body class="bgf4">
<div class="login-box f-mt10 f-pb50">
	<div class="main bgf">    
    	<div class="reg-box-pan display-inline">
    	 <div class="step" style="padding-left:257px;padding-top:110px">        	
                <ul>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>Lea</i></span>
                        <p class="lbg-txt">Register Learn System</p>
                    </li>
                </ul>
            </div>  
        	<div class="reg-box" id="verifyCheck" style="margin-top: -33px;">
            	<div class="part1">
	            	<form id="registerform" action="${base}/register" class="form-vertical" style="padding-top:10px;" method="post">                	
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="text" id="username" name="username" maxlength="20" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头" />
	                            <span class="ie8 icon-close close hide"></span>
	                            <label class="icon-sucessfill blank hide"></label>
	                            <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span></label>
	                            <label class="focus valid"></label>
	                        </div>
	                    </div>
	                    <!-- <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="text" class="txt03 f-r3 required" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone" /> 
	                            <span class="ie8 icon-close close hide"></span>                           
	                            <label class="icon-sucessfill blank hide"></label>
	                            <label class="focus">请填写11位有效的手机号码</label>
	                            <label class="focus valid"></label>
	                        </div>
	                    </div> -->
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="password" name="password" id="password" maxlength="20" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" /> 
	                            <span class="ie8 icon-close close hide" style="right:55px"></span>
	                            <span class="showpwd" data-eye="password"></span>                        
	                            <label class="icon-sucessfill blank hide"></label>
	                            <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
	                            <label class="focus valid"></label>
	                            <span class="clearfix"></span>
	                            <label class="strength">
	                            	<span class="f-fl f-size12">安全程度：</span>
	                            	<b><i>弱</i><i>中</i><i>强</i></b>
	                            </label>    
	                        </div>
	                    </div>
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="password" maxlength="20" class="txt03 f-r3 required" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
	                            <span class="ie8 icon-close close hide" style="right:55px"></span>
	                            <span class="showpwd" data-eye="rePassword"></span>
	                            <label class="icon-sucessfill blank hide"></label>
	                            <label class="focus">请再输入一遍上面的密码</label> 
	                            <label class="focus valid"></label>                          
	                        </div>
	                    </div>
	                    
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="text" name="code" maxlength="10" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" id="code" data-valid="isNonEmpty" data-error="验证码不能为空" /> 
	                            <span class="ie8 icon-close close hide"></span>
	                            <label class="f-size12 c-999 f-fl f-pl10">
	                            	<img id="imgObj" src="${base}/files/img/code.jpg" />                             
	                            </label>                        
	                            <label class="icon-sucessfill blank hide" id="codehide" style="left:380px"></label>
	                            <label class="focusa">看不清？<a id="veritycode" class="c-blue">换一张</a></label>   
	                            <label class="focus valid" style="left:370px" id="codeLable"></label>                        
	                        </div>
	                    </div>
	                    
	                    <div class="item col-xs-12" style="height:auto">
	                        <span class="intelligent-label f-fl">&nbsp;</span>  
	                        <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款"> 
	                        	<input type="checkbox" checked /><a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
	                        </p>                       
	                        <label class="focus valid"></label> 
	                    </div> 
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl">&nbsp;</span>    
	                        <div class="f-fl item-ifo" style="float:left;width:200px">
	                        	<input type="button" id="registerBtn" class="btn" style="width:80px;" value="注册"/>                       
	                        </div>
	                        <div class="f-fl item-ifo" style="float:right">
	                           <input type="button" id ="loginBtn" class="btn" style="width:80px;" value="返回登录"/>                       
	                        </div>
	                    </div> 
	                 </form>
	              </div>
                <div class="part2 text-center" style="display:none">
                	<h3>恭喜，您已注册成功，现在开始您的投资之旅吧！</h3>
                    <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="JavaScript:void()" class="c-blue">用户中心</a></p>
                </div>          
            </div>
        </div>
    </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
	<div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
    <div class="apply_up_content">
    	<pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
    </div>
    <center><a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a></center>
</div>
<script src="${base}/resources/js/jquery-1.11.2.min.js"></script> 
<script src="${base}/resources/plugins/fontsverity/js/register.js"></script>
<script>
$(function(){
	BASE_URL = $("#base").attr("href");
	//第一页的确定按钮
	$("#registerBtn").click(function(){	
		$("#codeLable").text("");
		username = $("#username").val();
		password = $("#password").val();
		if(!verifyCheck._click()) return;
		//checkCode
		$.ajax({
		    type: "GET",
		    url: BASE_URL+"/checkCode",
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    data:{"code":$("#code").val()},
		    dataType: "text",
		    success: function(data){
		    	console.log(data);
		    	if (data=="false"){
		    		$("#codeLable").text("验证码错误");
		    		$("#codehide").addClass("hide");
		    		return;
		    	}else{
		 			//submit	
		    		$(".part1").hide();
		    		$(".part2").show();
		    		$(".step li").eq(1).addClass("on");
		    		console.log($("#password").val())
		    		//$("#registerform").submit();
		    		countdown({
		    			maxTime:5,
		    			ing:function(c){
		    				$("#times").text(c);
		    			},
		    			after:function(){
		    				window.location.href=BASE_URL+"/login?username="+username+"&password="+password+"&f=register";		
		    			}
		    		});	
		    	}
		     }
		});
	});
	$("#loginBtn").click(function(){	
		window.location.href=BASE_URL+"/tologin";
	});
});
function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
function closeClause(){
	$(".m-sPopBg,.m-sPopCon").hide();		
}

//get code
$('#veritycode').click(function(){
    $.ajax({
        type: "GET",
        url: BASE_URL+"/getCode",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "text",
        success: function(data){
        	console.log(data);
        	var imgSrc = $("#imgObj");
        	imgSrc.attr("src", "");   //清空resText里面的所有内容   
            imgSrc.attr("src", BASE_URL+data);
         }
    });
});
</script>

<script type="text/javascript">
BASE_URL = $("#base").attr("href");
$.ajax({
    type: "GET",
    url: BASE_URL+"/getCode",
    contentType: "application/x-www-form-urlencoded; charset=utf-8",
    dataType: "text",
    success: function(data){
    	console.log(data);
    	var imgSrc = $("#imgObj");
    	imgSrc.attr("src", "");   //清空resText里面的所有内容   
        imgSrc.attr("src", BASE_URL+data);
     }
});
</script>

</body>
</html>
