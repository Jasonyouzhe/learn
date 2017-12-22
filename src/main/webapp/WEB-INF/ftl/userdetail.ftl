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
<link rel="stylesheet" href="${base}/resources/css/colorpicker.css" />
<link rel="stylesheet" href="${base}/resources/css/datepicker.css" />
<link rel="stylesheet" href="${base}/resources/css/uniform.css" />
<link rel="stylesheet" href="${base}/resources/css/select2.css" />
<link rel="stylesheet" href="${base}/resources/css/matrix-style2.css" />
<link rel="stylesheet" href="${base}/resources/css/matrix-media.css" />
<link rel="stylesheet" href="${base}/resources/css/bootstrap-wysihtml5.css" />
<link href="${base}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<style>
	.control-group .controls label{
		display:inline-block;
	}
</style>
</head>
<body>

<div id="content">
  <!-- <div id="content-header">
      <h1>User Info</h1>
  </div> -->
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Personal-info</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="${base}/user/updateUser" method="post" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">User No :</label>
              <div class="controls">
              <input type="hidden" class="span11" placeholder="First name" name="id"value="${user.id}"/>
                <input type="text" readonly="readonly" class="span11" placeholder="First name" name="userId"value="${user.userId}"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">User Name :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Last name" name="userName"value="${user.userName}"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">User Password:</label>
              <div class="controls">
                <input type="password"  class="span11" placeholder="Enter Password" name="password" value="${user.password}"/>
              </div>
            </div>
            <div class="form-actions">
              <button type="submit" class="btn btn-success">Save</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
<!--   <div class="row-fluid">
    <div class="widget-box">
      <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
        <h5>wysihtml5</h5>
      </div>
      <div class="widget-content">
        <div class="control-group">
          <form>
            <div class="controls">
              <textarea class="textarea_editor span12" rows="6" placeholder="输入文本 ..."></textarea>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div> -->
</div></div>

<script src="${base}/resources/js/jquery-1.11.2.min.js"></script> 
<script src="${base}/resources/js/jquery.ui.custom.js"></script> 
<script src="${base}/resources/js/bootstrap.min.js"></script> 
<script src="${base}/resources/js/bootstrap-colorpicker.js"></script> 
<script src="${base}/resources/js/bootstrap-datepicker.js"></script> 
<script src="${base}/resources/js/jquery.toggle.buttons.html"></script> 
<script src="${base}/resources/js/masked.js"></script> 
<script src="${base}/resources/js/jquery.uniform.js"></script> 
<script src="${base}/resources/js/select2.min.js"></script> 
<script src="${base}/resources/js/matrix.js"></script> 
<script src="${base}/resources/js/matrix.form_common.js"></script> 
<script src="${base}/resources/js/wysihtml5-0.3.0.js"></script> 
<script src="${base}/resources/js/jquery.peity.min.js"></script> 
<script src="${base}/resources/js/bootstrap-wysihtml5.js"></script> 
<script>
	$('.textarea_editor').wysihtml5();
</script>
</body>
</html>
