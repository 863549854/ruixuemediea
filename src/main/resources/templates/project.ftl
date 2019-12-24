<!DOCTYPE html>
<html>
<#include "/common/header.ftl">

<section class="hidden-sidebar collapse" id="sidebarCollapse">
  <button class="close-button" type="button" data-toggle="collapse" data-target="#sidebarCollapse"
          aria-expanded="false" aria-controls="sidebarCollapse"><i class="fa fa-times"></i></button>
  <div class="single-hidden-sidebar logo">
    <a href="index.html"><img src="/ruixuemedia/img/logo.png" alt="瑞雪映画"/></a>
  </div><!-- /.single-hiddeen-sidebar -->
  <div class="single-hidden-sidebar">
    <h3>About Us</h3>l
    <p>We must explain to you how all seds this mistakens idea off denouncing pleasures and praising
      pain was born and I will give you a completed accounts off the system and expound the actually
      teaching of the great explorer ut of the truth, the master builder of human happiness.</p>
    <a href="#" class="thm-btn">Consultation</a>
  </div><!-- /.single-hidden-sidebar -->
  <div class="single-hidden-sidebar">
    <h3>Contact Info</h3>
    <ul class="contact-info">
      <li>
        <div class="icon-box">
          <i class="fa fa-map-marker"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>Rock St 12, Newyork City, USA</p>
        </div><!-- /.text-box -->
      </li>
      <li>
        <div class="icon-box">
          <i class="fa fa-phone"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>(526) 236-895-4732</p>
        </div><!-- /.text-box -->
      </li>
      <li>
        <div class="icon-box">
          <i class="fa fa-envelope-o"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>wefinancesuport@gmail.com</p>
        </div><!-- /.text-box -->
      </li>
      <li>
        <div class="icon-box">
          <i class="fa fa-clock-o"></i>
        </div><!-- /.icon-box -->
        <div class="text-box">
          <p>Week Days: 09.00 to 18.00 <br/>Sunday: Closed</p>
        </div><!-- /.text-box -->
      </li>
    </ul>
  </div><!-- /.single-hidden-sidebar -->
</section><!-- /.hidden-sidebar -->


<section class="inner-banner has-dot-pattern">
  <div class="container">
    <h2>我们的合作案例</h2>
    <p>我们团队与众多企业有良好的合作，其中不乏国企与互联网科技巨头 <br/>但是由于篇幅问题，您所见到的仅仅是我们团队的部分精选案例</p>
    <span class="decor-line"></span>
    <ul class="list-inline bread-cumb">
      <li><a href="#">主页</a></li>
      <li><span>作品案例</span></li>
    </ul><!-- /.list-inline -->
  </div><!-- /.container -->
</section><!-- /.inner-banner -->


<section class="sec-pad project-page">
  <div class="container">
    <div class="text-center">
      <ul class="post-filter list-inline">
        <li class="active" data-filter=".filter-item">
          <span>所有案例</span>

        </li><!-- must add it for inline block hack
                -->
           <#list videoCategory as vc>
             <#if vc.id!="0">

        <li data-filter=".${vc.id}">
          <span>${vc.name}</span>
        </li>

             </#if>


           </#list>
      </ul><!-- /.gallery-filter -->
    </div><!-- /.text-center -->
    <div class="row masonary-layout filter-layout">


      <#list videoVo as vio >
              <div class="col-md-4 col-sm-6 col-xs-12 filter-item ${vio.videoType}">
                <div class="single-project-item">
                  <div class="img-box">
                    <img src="${vio.coverSrc}" style="width:370px!important;height: 240px!important;" alt=""/>
                    <div class="overlay">
                      <div class="box">
                        <div class="content">
                          <ul class="list-inline">
                            <li>
                              <a data-group="1" class="video-popup" href="${vio.videoSrc}"><i class="fa fa-youtube-play"></i></a>
                            </li>
                          </ul><!-- /.list-inline -->
                        </div><!-- /.content -->
                      </div><!-- /.content -->
                    </div><!-- /.overlay -->
                  </div><!-- /.img-box -->
                  <div class="text-box">
                    <h3><a href="#">${vio.head}</a></h3>
                    <span>${vio.desc}</span>
                  </div><!-- /.text-box -->
                </div><!-- /.single-project-item -->
              </div><!-- /.col-md-4 -->

      </#list>




    </div><!-- /.row -->
    <div class="text-center">
      <a href="#" class="thm-btn">更多案例</a>
    </div><!-- /.text-center -->
  </div><!-- /.container -->
</section><!-- /.sec-pad -->

<#include "/common/footer.ftl">

</html>