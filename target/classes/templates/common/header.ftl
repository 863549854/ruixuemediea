<head>
  <meta charset="UTF-8">
  <title>瑞雪映画|专业影视传媒</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="${staticUrl}ruixuemedia/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${staticUrl}ruixuemedia/css/style.css">
  <link rel="stylesheet" href="${staticUrl}ruixuemedia/css/responsive.css">
  <link rel="stylesheet" href="css/style.css">

  <style>
    /**************************
* 漂浮QQ/电话组件
***************************/
    .fix-bar {
      width: 80px;
      position: fixed;
      top: 50%;
      right: 0;
      display: block;
      margin-top: -120px;
      background: #1f77e7;
      -moz-border-top-left-radius: 5px;
      border-top-left-radius: 5px;
      -moz-border-bottom-left-radius: 5px;
      border-bottom-left-radius: 5px;
      z-index: 101
    }

    .fix-bar .btn {
      display: block;
      height: 80px;
      border-bottom: 1px solid #0058d8;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
      padding: 16px 0 14px;
      text-decoration: none
    }

    .fix-bar a.btn .pic {
      display: block;
      width: 25px;
      height: auto;
      margin: 0 auto
    }

    .fix-bar a.btn .tit {
      display: block;
      text-align: center;
      color: #fff;
      font-size: 14px;
      margin-top: 6px
    }

    .fix-bar a.btn:nth-of-type(3) {
      border: none
    }

    #telephoneHead {
      font-size: 27px;
      font-weight: 700;
      color: #b9a280;
      text-decoration: none
    }
  </style>
</head>
<body>
<header class="header header-fixed header-1">
  <div class="header-top">
    <div class="container">
      <div class="left-info pull-left">
        <ul class="list-inline">

          <li>
						<span>
							<i class="fa fa-phone"></i> +86&nbsp;${allInfo.tel}
						</span>
          </li>
        </ul>
      </div><!-- /.left-info -->
      <div class="right-info pull-right">
        <ul class="list-inline">
          <li>
						<span>
							<i class="fa fa-envelope"></i> ${allInfo.kefuEmail}
						</span>
          </li>
          <#--<li>-->
            <#--<ul class="list-inline social">-->
              <#--<li id="wechat-icon"><a href="#"><i class="fa fa-wechat"></i></a></li>-->
              <#--<li id="qq-icon"><a href="#"><i class="fa fa-qq"></i></a></li>-->
              <#--<li><a href="#"><i class="fa fa-weibo"></i></a></li>-->
              <#--<!-- <li><a href="#"><i class="fa fa-linkedin"></i></a></li> &ndash;&gt;-->
            <#--</ul><!-- /.social &ndash;&gt;-->
          <#--</li>-->
        </ul>
      </div><!-- /.right-info -->
    </div>
  </div><!-- /.header-top -->

  <nav class="navbar navbar-default header-navigation stricky">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav-bar" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="\">
          <img src="${staticUrl}ruixuemedia/img/rx-logo.png" alt="瑞雪映画"/>
        </a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="main-nav-bar">


        <ul class="nav navbar-nav navigation-box">
          <li><a href="/">主页</a></li>
          <li>
            <a href="/project">作品案例</a>
          </li>
          <#--<li>-->
            <#--<a href="/price">报价</a>-->

          <#--</li>-->
          <li><a href="/about">关于我们</a></li>

          <li><a role="button" data-toggle="collapse" href="#sidebarCollapse" aria-expanded="false" aria-controls="sidebarCollapse">联系我们</a></li>

      </ul>
        <ul class="nav navbar-nav navbar-right right-box">

        </ul>

      </div><!-- /.navbar-collapse -->
    </div><!-- /.container -->
  </nav>

</header><!-- /.header -->
<#--侧栏联系我们-->
<section class="hidden-sidebar collapse" id="sidebarCollapse">
  <button class="close-button" type="button" data-toggle="collapse" data-target="#sidebarCollapse" aria-expanded="false" aria-controls="sidebarCollapse"><i class="fa fa-times"></i></button>
  <div class="single-hidden-sidebar logo">
    <a href="index.html"><img src="${staticUrl}ruixuemedia/img/rx-logo.png" alt="瑞雪映画"/></a>
  </div><!-- /.single-hiddeen-sidebar -->
  <div class="single-hidden-sidebar">
    <h3>瑞雪映画影视文化传媒有限公司</h3>
    <p>北京瑞雪映画影视文化传媒有限公司是一家集文化创意、广告宣传片摄制、影视剧制作为一体的文化传媒公司，成立之初就聚集了清华、北大一帮有梦想的年轻人。</p>
  <#--<a href="#" class="thm-btn">留言联系方式</a>-->
  </div><!-- /.single-hidden-sidebar -->
  <div class="single-hidden-sidebar">
    <h3>联系信息</h3>
    <ul class="contact-info">
      <li>
        <div class="icon-box">
          <i class="fa fa-map-marker"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>${allInfo.addr}</p>
        </div><!-- /.text-box -->
      </li>
      <li>
        <div class="icon-box">
          <i class="fa fa-phone"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>(+86)&nbsp;${allInfo.tel}</p>
        </div><!-- /.text-box -->
      </li>
      <li>
        <div class="icon-box">
          <i class="fa fa-envelope-o"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>${allInfo.kefuEmail}</p>
        </div><!-- /.text-box -->
      </li>
      <li>
        <div class="icon-box">
          <i class="fa fa-clock-o"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>7*24小时全天候服务</p>
        </div><!-- /.text-box -->
      </li>
    </ul>
  </div><!-- /.single-hidden-sidebar -->
</section><!-- /.hidden-sidebar -->