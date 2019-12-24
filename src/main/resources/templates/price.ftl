<!doctype html>
<html lang="zh-CN">
<#include "/common/header.ftl">
<#--price-content-start-->
<body class="p-price">
<link rel="stylesheet" href="/ruixuemedia/css/price.css"/>
<!--start-pricing-tablel-->
<script src="/ruixuemedia/js/price/jquery.magnific-popup.js" type="text/javascript"></script>
<script type="text/javascript" src="/ruixuemedia/js/price/modernizr.custom.53451.js"></script>

<script>
  $(document).ready(function() {
    $('.popup-with-zoom-anim').magnificPopup({
      type: 'inline',
      fixedContentPos: false,
      fixedBgPos: true,
      overflowY: 'auto',
      closeBtnInside: true,
      preloader: false,
      midClick: true,
      removalDelay: 300,
      mainClass: 'my-mfp-zoom-in'
    });

  });
</script>
<div class="pricing-plans">
  <div class="wrap">
    <div class="price-head">
      <h1>服务价格</h1>
      <#--<h1>Flat Pricing Tables Design</h1>-->
    </div>
    <div class="pricing-grids">
      <div class="pricing-grid1">
        <div class="price-value">
          <h2><a href="#"> BASIC</a></h2>
          <h5><span>$ 19.99</span><lable> / month</lable></h5>
          <div class="sale-box">
            <span class="on_sale title_shop">NEW</span>
          </div>

        </div>
        <div class="price-bg">
          <ul>
            <li class="whyt"><a href="#">5GB Disk Space </a></li>
            <li><a href="#">10 Domain Names</a></li>
            <li class="whyt"><a href="#">5 E-Mail Address </a></li>
            <li><a href="#">50GB Monthly Bandwidth </a></li>
            <li class="whyt"><a href="#">Fully Support</a></li>
          </ul>
          <div class="cart1">
            <a class="popup-with-zoom-anim" href="#small-dialog">Purchase</a>
          </div>
        </div>
      </div>
      <div class="pricing-grid2">
        <div class="price-value two">
          <h3><a href="#">STANDARD</a></h3>
          <h5><span>$ 29.99</span><lable> / month</lable></h5>
          <div class="sale-box two">
            <span class="on_sale title_shop">NEW</span>
          </div>

        </div>
        <div class="price-bg">
          <ul>
            <li class="whyt"><a href="#">10GB Disk Space </a></li>
            <li><a href="#">20 Domain Names</a></li>
            <li class="whyt"><a href="#">10 E-Mail Address </a></li>
            <li><a href="#">100GB Monthly Bandwidth </a></li>
            <li class="whyt"><a href="#">Fully Support</a></li>
          </ul>
          <div class="cart2">
            <a class="popup-with-zoom-anim" href="#small-dialog">Purchase</a>
          </div>
        </div>
      </div>
      <div class="pricing-grid3">
        <div class="price-value three">
          <h4><a href="#">PREMIUM</a></h4>
          <h5><span>$ 49.99</span><lable> / month</lable></h5>
          <div class="sale-box three">
            <span class="on_sale title_shop">NEW</span>
          </div>

        </div>
        <div class="price-bg">
          <ul>
            <li class="whyt"><a href="#">50GB Disk Space </a></li>
            <li><a href="#">50 Domain Names</a></li>
            <li class="whyt"><a href="#">20 E-Mail Address </a></li>
            <li><a href="#">300GB Monthly Bandwidth </a></li>
            <li class="whyt"><a href="#">Fully Support</a></li>
          </ul>
          <div class="cart3">
            <a class="popup-with-zoom-anim" href="#small-dialog">Purchase</a>
          </div>
        </div>
      </div>
      <div class="clear"> </div>
      <!--pop-up-grid-->
      <div id="small-dialog" class="mfp-hide">
        <div class="pop_up">
          <div class="payment-online-form-left">
            <form>
              <h4><span class="shipping"> </span>Shipping</h4>
              <ul>
                <li><input class="text-box-dark" type="text" value="Frist Name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Frist Name';}"></li>
                <li><input class="text-box-dark" type="text" value="Last Name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Last Name';}"></li>
              </ul>
              <ul>
                <li><input class="text-box-dark" type="text" value="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}"></li>
                <li><input class="text-box-dark" type="text" value="Company Name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Company Name';}"></li>
              </ul>
              <ul>
                <li><input class="text-box-dark" type="text" value="Phone" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Phone';}"></li>
                <li><input class="text-box-dark" type="text" value="Address" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Address';}"></li>
                <div class="clear"> </div>
              </ul>
              <div class="clear"> </div>
              <ul class="payment-type">
                <h4><span class="payment"> </span> Payments</h4>
                <li><span class="col_checkbox">
													<input id="3" class="css-checkbox1" type="checkbox">
													<label for="3" name="demo_lbl_1" class="css-label1"> </label>
													<a class="visa" href="#"> </a>
													</span>

                </li>
                <li>
													<span class="col_checkbox">
														<input id="4" class="css-checkbox2" type="checkbox">
														<label for="4" name="demo_lbl_2" class="css-label2"> </label>
														<a class="paypal" href="#"> </a>
													</span>
                </li>
                <div class="clear"> </div>
              </ul>
              <ul>
                <li><input class="text-box-dark" type="text" value="Card Number" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Card Number';}"></li>
                <li><input class="text-box-dark" type="text" value="Name on card" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Name on card';}"></li>
                <div class="clear"> </div>
              </ul>
              <ul>
                <li><input class="text-box-light hasDatepicker" type="text" id="datepicker" value="Expiration Date" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Expiration Date';}"><em class="pay-date"> </em></li>
                <li><input class="text-box-dark" type="text" value="Security Code" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Security Code';}"></li>
                <div class="clear"> </div>
              </ul>
              <ul class="payment-sendbtns">
                <li><input type="reset" value="Cancel"></li>
                <li><input type="submit" value="Process order"></li>
              </ul>
              <div class="clear"> </div>
            </form>
          </div>
        </div>
      </div>
      <!--pop-up-grid-->
    </div>
    <div class="clear"> </div>
  </div>

</div>
<!--//End-pricingplans-->

<#include "/common/footer.ftl">
<#--price-content-end-->

</html>