<#include "/admin/common/header.ftl" />
<body class="with-side-menu">
<#include "/admin/common/topbar.ftl" />
<#include "/admin/common/sidebar.ftl" />
<div class="page-content">
  <div class="box-typical box-typical-padding">


    <h5 class="m-t-lg with-border">基本信息设置</h5>

    <form action="/rx-admin/editInfo">
      <div class="form-group row">
        <label class="col-sm-2 form-control-label">联系电话</label>
        <div class="col-sm-10">
          <p class="form-control-static"><input name="tel" type="text" class="form-control" value="${basicData.tel}" id="inputTel"
                                                placeholder="联系电话"></p>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 form-control-label">电子邮箱</label>
        <div class="col-sm-10">
          <p class="form-control-static"><input name="email" value="${basicData.kefuEmail}" type="text" class="form-control" id="inputEmail"
                                                placeholder="电子邮箱"></p>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 form-control-label">地址</label>
        <div class="col-sm-10">
          <p class="form-control-static"><input name="addr" value="${basicData.addr}" type="text" class="form-control" id="inputAddr"
                                                placeholder="地址"></p>
        </div>
      </div>
      <div  style="text-align: center;">
        <button id="modifiedAllInfo" type="submit" class="btn btn-rounded">提交</button>

      </div>
    </form>
  </div><!--.box-typical-->
</div><!--.page-content-->

<#include "/admin/common/footer.ftl" />
