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
                        <p class="lbg-txt">Sign Learn System</p>
                    </li>
                </ul>
            </div>  
        	<div class="reg-box" id="verifyCheck" style="margin-top: -33px;">
            	<div class="part1">
	            	<form id="loginForm" action="${base}/login" class="form-vertical" style="padding-top:10px;" method="post">                	
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="text" id="username" name="username" maxlength="20" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||isUname" data-error="用户名不能为空" />
	                            <span class="ie8 icon-close close hide"></span>
	                            <label class="icon-sucessfill blank hide"></label>
	                            <label class="focus valid"></label>
	                            <#if val??>
	                    			<label class="focus valid">用户不存在</label>
	                   			 </#if>
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
	                            <input type="password" name="password" id="password" maxlength="20" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty" data-error="密码不能为空" /> 
	                            <span class="ie8 icon-close close hide" style="right:55px"></span>
	                            <span class="showpwd" data-eye="password"></span>                        
	                            <label class="icon-sucessfill blank hide"></label>
	                            <label class="focus valid"></label>   
	                        </div>
	                    </div>
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>    
	                        <div class="f-fl item-ifo">
	                            <input type="text" maxlength="4" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" /> 
	                            <span class="ie8 icon-close close hide"></span>
	                            <label class="f-size12 c-999 f-fl f-pl10">
	                            	<img src="${base}/resources/plugins/fontsverity/images/yzm.jpg" />                               
	                            </label>                        
	                            <label class="icon-sucessfill blank hide" style="left:380px"></label>
	                            <label class="focusa">看不清？<a href="javascript:;" class="c-blue">换一张</a></label>   
	                            <label class="focus valid" style="left:370px"></label>                        
	                        </div>
	                    </div>
	                    <div class="item col-xs-12">
	                        <span class="intelligent-label f-fl">&nbsp;</span>    
	                        <div class="f-fl item-ifo" style="float:left;width:200px">
	                        	<input type="button" id="loginBtn" class="btn" style="width:80px;" value="Sign in"/>                       
	                        </div>
	                        <div class="f-fl item-ifo" style="float:right">
	                           <input type="button" id="registerBtn" class="btn" style="width:80px;" value="Sign up"/>                       
	                        </div>
	                    </div> 
	                    <input type="hidden" name="f" value="signin">
	                 </form>
	              </div>         
            </div>
        </div>
    </div>
</div>
<script src="${base}/resources/js/jquery-1.11.2.min.js"></script> 
<script src="${base}/resources/plugins/fontsverity/js/register.js"></script>
<script>
$(function(){
	BASE_URL = $("#base").attr("href");
	//第一页的确定按钮
	$("#loginBtn").click(function(){	
		if(!verifyCheck._click()) return;
		$("#loginForm").submit();
	});
	$("#registerBtn").click(function(){	
		window.location.href=BASE_URL+"/toregister";
	});
});
</script>
</body>
</html>
