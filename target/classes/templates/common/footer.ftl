<#--QQ咨询组件-->
<#--<section  style="position: fixed;bottom: 40%;right: 5px;z-index: 999;" >-->
  <#--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=444132700&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:444132700:53" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>-->

<#--</section>-->
<div class="fix-bar">
  <!-- CCwpa -->
  <a id="ccwpa-fixbar" onclick="callService()" class="btn key-evt-el"  title="" data-act="点击" data-lbl="右侧栏CC电话咨询">
    <img class="pic" src="http://combo.b.qq.com/bqq/v5/images/ccwpa.png" alt="" width="56" height="39">
    <span class="tit">电话咨询</span>
  </a>
  <!-- 在线咨询组件 -->
  <a id="siteFltWpa" class="siteFltWpa btn key-evt-el" href="javascript:void(0);" target="_blank" onclick="window.open('http://wpa.qq.com/msgrd?v=3&uin=444132700&site=qq&menu=yes')" data-act="点击" data-lbl="右侧栏在线咨询点击">
    <img class="pic" src="http://combo.b.qq.com/bqq/v5/images/onlinewpa.png" alt="" width="56" height="39">
    <span class="tit">在线客服</span>
  </a></div>
<footer class="footer has-dot-pattern sec-pad">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="single-footer-widget about-widget">
          <a href="index.html"><img style="width:215px;height:31px;" src="${staticUrl}ruixuemedia/img/rx-logo.png" alt="瑞雪映画"/></a>
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
          </ul>
        </div><!-- /.single-footer-widget -->
      </div><!-- /.col-md-3 -->
      <div class="col-lg-4 col-md-6">
        <div class="single-footer-widget link-widget">
          <div class="sec-title white medium">
            <h2>快速链接</h2>
            <span class="decor-line">
								<span class="decor-line-inner"></span>
							</span>
          </div><!-- /.sec-title -->
          <div class="clearfix">
            <div class="col-md-6">
              <ul class="links">
                <li><a href="/">主页</a></li>
                <li><a href="/project">作品案例</a></li>
                <#--<li><a href="#">报价</a></li>-->

              </ul><!-- /.links -->
            </div><!-- /.col-md-6 -->
            <div class="col-md-6">
              <ul class="links">
                <li><a href="/about">关于我们</a></li>
                <li><a data-toggle="collapse" href="#sidebarCollapse" aria-expanded="false" aria-controls="sidebarCollapse">联系我们</a></li>

              </ul><!-- /.links -->
            </div><!-- /.col-md-6 -->
          </div><!-- /.row -->

        </div><!-- /.single-footer-widget -->
      </div><!-- /.col-md-3 -->
      <div class="col-lg-4 col-md-6">
        <div class="single-footer-widget subscribe">
          <div class="sec-title white medium">
            <h2>订阅我们</h2>
            <span class="decor-line">
								<span class="decor-line-inner"></span>
							</span>
          </div><!-- /.sec-title -->
          <form  class="clearfix mailchimp-form">
            <input id="dy-emali" type="text" name="email" placeholder="邮箱" />
            <button id="dingyue">订阅</button>
          </form>
          <p>及时获取我们的资讯</p>
          <div class="result"></div><!-- /.result -->

        </div><!-- /.single-footer-widget -->
      </div><!-- /.col-md-3 -->
    </div><!-- /.row -->
  </div><!-- /.container -->
</footer><!-- /.footer -->

	<section class="footer-bottom">
    <div class="container">
      <div class="copyright pull-left">
        <p>Copyrights © 2018-2019 All Rights Reserved by RuixueMedia&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;powerd by @kzysure&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.miitbeian.gov.cn">京ICP备18051539-1</a></p>
      </div><!-- /.copyright pull-left -->
      <div class="social pull-right">
        <#--<ul class="list-inline">-->
          <#--<li><a href="#"><i class="fa fa-wechat"></i></a></li>-->
          <#--<li><a href="#"><i class="fa fa-qq"></i></a></li>-->
          <#--<li><a href="#"><i class="fa fa-weibo"></i></a></li>-->
          <#--<!-- <li><a href="#"><i class="fa fa-linkedin"></i></a></li> &ndash;&gt;-->
        <#--</ul><!-- /.list-inline &ndash;&gt;-->
      </div><!-- /.social pull-right -->
    </div><!-- /.container -->
  </section><!-- /.footer-bottom -->

	<!--Scroll to top-->
	<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></div>



	<script src="${staticUrl}ruixuemedia/js/jquery-latest.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<!-- revolution slider js -->
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>




	<script src="${staticUrl}ruixuemedia/assets/jquery-validation/dist/jquery.validate.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/owl.carousel-2/owl.carousel.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/nouislider/nouislider.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/bootstrap-touch-spin/jquery.bootstrap-touchspin.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/isotope.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/masterslider/masterslider.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/bxslider/dist/jquery.bxslider.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/chartjs/dist/Chart.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/jquery-circle-progress-1.1.2/dist/circle-progress.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/morris.js-master/morris.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/raphael-master/raphael.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/waypoints.min.js"></script>
	<script src="${staticUrl}ruixuemedia/assets/jquery.counterup.min.js"></script>

	<script src="${staticUrl}ruixuemedia/assets/wow.min.js"></script>

	<script src="${staticUrl}ruixuemedia/layer/layer.js"></script>


	<script src="${staticUrl}ruixuemedia/js/custom.js"></script>

<script>
  function callService() {
    layer.prompt({
      title:'请输入您的联系方式，我们的客服代表稍后将与您取得联系',
      formType: 0,
      value: '',
      area: ['800px', '350px'] //自定义文本域宽高
    }, function(value, index, elem){
      layer.msg(value);
      layer.close(index);
    });
     }
</script>

</body>