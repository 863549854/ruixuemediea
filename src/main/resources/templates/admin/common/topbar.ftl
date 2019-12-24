<header class="site-header">
  <div class="container-fluid">
    <a href="#" class="site-logo">
      <img class="hidden-md-down" src="${staticUrl}img/rx-logo.jpg" alt="">
      <img class="hidden-lg-down" src="${staticUrl}img/rx-short-logo.png" alt="">
    </a>

    <button id="show-hide-sidebar-toggle" class="show-hide-sidebar">
      <span>toggle menu</span>
    </button>

    <button class="hamburger hamburger--htla">
      <span>toggle menu</span>
    </button>
    <div class="site-header-content">
      <div class="site-header-content-in">
        <div class="site-header-shown">


          <div class="dropdown user-menu">
            <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
              <img src="/img/avatar-2-64.png" alt="">
            </button>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
            <#--<a class="dropdown-item" href="#"><span-->
            <#--class="font-icon glyphicon glyphicon-user"></span>${username}</a>-->

              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="/rx-login/logout"><span
                  class="font-icon glyphicon glyphicon-log-out"></span>注销登陆</a>
            </div>
          </div>
          <button type="button" class="burger-right">
            <i class="font-icon-menu-addl"></i>
          </button>
        </div><!--.site-header-shown-->
      </div><!--.site-header-content-->
    </div><!--.container-fluid-->
</header><!--.site-header-->
