<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>瑞雪映画|管理登陆</title>

  <link href="${staticUrl}img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
  <link href="${staticUrl}img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
  <link href="${staticUrl}img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
  <link href="${staticUrl}img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
  <link href="${staticUrl}img/favicon.png" rel="icon" type="image/png">
  <link rel="shortcut icon" href="${staticUrl}img/favicon.ico" type="image/x-icon">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="${staticUrl}css/separate/pages/login.min.css">
  <link rel="stylesheet" href="${staticUrl}css/lib/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="${staticUrl}css/lib/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/main.css">
</head>
<body>

<div class="page-center">
  <div class="page-center-in">
    <div class="container-fluid">
      <form method="post" action="/rx-login/signin" class="sign-box">
        <div class="sign-avatar">
          <img src="${staticUrl}img/avatar-sign.png" alt="">
        </div>
        <header class="sign-title">瑞雪映画|后台管理</header>
            	<#if error?exists >


        <div class="alert alert-danger alert-icon alert-close alert-dismissible fade show" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <i class="font-icon font-icon-warning"></i>
          ${error}
        </div>
              <#else>

</#if>
        <div class="form-group">
          <input type="text" name="username" class="form-control" placeholder="用户名"/>
        </div>
        <div class="form-group">
          <input type="password" name="password" class="form-control" placeholder="密码"/>
        </div>
        <button type="submit" class="btn btn-rounded">登陆</button>
      </form>
    </div>
  </div>
</div><!--.page-center-->


<script src="${staticUrl}js/lib/jquery/jquery-3.2.1.min.js"></script>
<script src="${staticUrl}js/lib/popper/popper.min.js"></script>
<script src="${staticUrl}js/lib/tether/tether.min.js"></script>
<script src="${staticUrl}js/lib/bootstrap/bootstrap.min.js"></script>
<script src="${staticUrl}js/plugins.js"></script>
<script type="text/javascript" src="${staticUrl}js/lib/match-height/jquery.matchHeight.min.js"></script>
<script>
  $(function() {
    $('.page-center').matchHeight({
      target: $('html')
    });

    $(window).resize(function(){
      setTimeout(function(){
        $('.page-center').matchHeight({ remove: true });
        $('.page-center').matchHeight({
          target: $('html')
        });
      },100);
    });
  });
</script>
<script src="${staticUrl}js/app.js"></script>
</body>
</html>