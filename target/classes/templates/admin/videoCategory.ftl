<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>瑞雪映画|视频分类管理</title>

  <link href="${staticUrl}img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
  <link href=${staticUrl}"img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
  <link href="${staticUrl}img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
  <link href="${staticUrl}img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
  <link rel="shortcut icon" href="${staticUrl}img/favicon.ico" type="image/x-icon">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="${staticUrl}css/lib/datatables-net/datatables.min.css">
  <link rel="stylesheet" href="${staticUrl}css/separate/vendor/datatables-net.min.css">
  <link rel="stylesheet" href="${staticUrl}css/lib/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="${staticUrl}css/lib/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/main.css">
</head>
<body class="with-side-menu control-panel control-panel-compact">

<#include "/admin/common/topbar.ftl" />
<#include "/admin/common/sidebar.ftl" />

<div class="page-content">
  <div class="container-fluid">
    <header class="section-header">
      <div class="tbl">
        <div class="tbl-row">
          <div class="tbl-cell">

            <h2>视频分类管理</h2>


          </div>
        </div>
      </div>
    </header>
    <section class="card">
      <div class="card-block">
        <table id="example" class="display table table-striped table-bordered" cellspacing="0"
               width="100%">
          <thead>
          <tr>
            <th>序号</th>
            <th>名称</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <#list videoCategory as v>

          <tr>
            <td>${v_index+1}</td>
            <td>
             ${v.name}
            </td>
            <td style="white-space: nowrap; width: 1%;">
              <div class="tabledit-toolbar btn-toolbar" style="text-align: left;">
                <div class="btn-group btn-group-sm" style="float: none;">
                  <a data-toggle="modal" onclick="preEditModal('${v.id}','${v.name}')" data-target="#addVideoModal"
                     class="tabledit-edit-button btn btn-sm btn-default" style="float: none;">
                    <span
                        class="glyphicon glyphicon-pencil"></span>
                  </a>

                  <a data-toggle="tooltip" onclick="deletevideocategory('${v.id}')" id="delete-video"
                     data-placement="top" title="删除该视频分类"
                     class="tabledit-delete-button btn btn-sm btn-default"
                     style="float: none;">
                    <span class="glyphicon glyphicon-trash"></span>
                  </a>

                </div>
              </div>
            </td>
          </tr>
          </#list>
          </tbody>
        </table>
      </div>
    </section>
    <button data-toggle="modal" data-target="#myModal" type="button"
            style="border-radius: 50% !important;position: fixed;bottom: 60px;right: 20px;z-index: 999;"
            class="btn btn-primary btn-circle"><i class="glyphicon glyphicon-plus"></i></button>
  </div><!--.container-fluid-->
</div><!--.page-content-->
<#--新增视频-->
<div class="modal fade"
     id="myModal"
     tabindex="-1"
     role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
          <i class="font-icon-close-2"></i>
        </button>
        <h4 class="modal-title" id="myModalLabel">新增分类</h4>
      </div>
      <div class="modal-body">
        <form id="addVideoForm">
          <div class="md-form mb-3">

            <i class="fa fa-bookmark-o prefix grey-text"></i>
            <input name="name" type="text" id="form34" class="form-control validate">
            <label data-error="wrong" data-success="right" for="form34">名称</label>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">取消</button>
        <button id="addVideoBtn" type="button" onclick="addVideoCategory()"
                data-loading-text="<i class='fa fa-spinner fa-spin '></i> 正在上传..."
                class="btn btn-rounded btn-primary">新增分类
        </button>
      </div>
    </div>

  </div>
</div>
<#--编辑视频-->
<div class="modal fade"
     id="addVideoModal"
     tabindex="-1"
     role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
          <i class="font-icon-close-2"></i>
        </button>
        <h4 class="modal-title" id="myModalLabel">编辑视频分类</h4>
      </div>
      <div class="modal-body">
        <form id="editVideoForm">
          <div class="md-form mb-3">
            <input type="text" hidden="hidden" name="id" id="videoCategoryId">
            <i class="fa fa-bookmark-o prefix grey-text"></i>
            <input name="name" type="text" id="videoCategoryName" class="form-control validate">
            <label data-error="wrong" data-success="right" for="form34">名称</label>
          </div>


        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">取消</button>
        <button id="editVideoBtn" type="button" onclick="editvideocategory()"
                data-loading-text="<i class='fa fa-spinner fa-spin '></i> 正在上传..."
                class="btn btn-rounded btn-primary">修改视频分类
        </button>
      </div>
    </div>

  </div>
</div>


<script src="/js/lib/jquery/jquery-3.2.1.min.js"></script>
<script src="/js/lib/popper/popper.min.js"></script>
<script src="/js/lib/tether/tether.min.js"></script>
<script src="/js/lib/bootstrap/bootstrap.min.js"></script>
<script src="/js/plugins.js"></script>

<script src="/js/lib/datatables-net/datatables.min.js"></script>
<script src="${staticUrl}ruixuemedia/assets/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>

<script>
  // 删除视频分类
  function deletevideocategory(id) {
    layer.confirm('确定删除该分类？', {
          btn: ['确定', '取消'] //按钮
        }, function () {
          $.ajax({
                url: "/rx-admin/videocategory/deletevideocategory",
                type: 'POST',
                data: {"id": id.toString()},
                success: function (res) {
                  if (res.status.toString()=="200") {
                    layer.msg('已删除', {icon: 1});

                    history.go(0);
                  } else {
                    layer.msg(res.msg, {icon: 2});

                  }
                }
              }
          );
        }
    )
  }





  // 新增视频分类
  function addVideoCategory() {
    layer.load(1);
    var form = new FormData($("#addVideoForm")[0]);

    $.ajax({
      url: "/rx-admin/videocategory/addvideocategory",
      type: "POST",
      processData: false,
      contentType: false,
      async: true,
      cache: false,
      data: form,
      success: function (data) {
        if (data.status==200){
          layer.msg('新增视频分类成功', {icon: 1});
          setTimeout(function () {
            layer.closeAll();
          }, 2000);
          setTimeout(history.go(0), 3000);
        }else {
          layer.msg(data.msg, {icon: 2});
          setTimeout(function () {
            layer.closeAll();
          }, 2000);
          setTimeout(history.go(0), 3000);
        }

      },
      error: function (res) {
        layer.msg(res.msg);
        setTimeout(history.go(0),3000);

      }
    });
  }

  // 编辑视频分类
  function preEditModal(id,name) {
    // console.log("videoObj:" + video);

    $("#videoCategoryId").val(id);
    $("#videoCategoryName").val(name);


  }
  function editvideocategory(){
    layer.load(1);
    var form = new FormData($("#editVideoForm")[0]);

    $.ajax({
      url: "/rx-admin/videocategory/editvideocategory",
      type: "POST",
      processData: false,
      contentType: false,
      async: true,
      cache: false,
      data: form,
      success: function (data) {
        if (data.status==200){
          layer.msg('编辑视频分类成功', {icon: 1});
          //此处演示关闭
          setTimeout(function () {
            layer.closeAll();
          }, 2000);
          setTimeout(history.go(0), 3000);
        }else {
          layer.msg(data.msg, {icon: 2});
          setTimeout(function () {
            layer.closeAll();
          }, 2000);
          setTimeout(history.go(0), 3000);
        }

      },
      error: function (res) {

        layer.msg(res.msg);
        setTimeout(history.go(0),3000);

      }
    });
  }


    $('#example').DataTable(
        {
          responsive: true,
          "oLanguage": {
            "sSearch": "搜索",
            "sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "抱歉， 没有找到",
            "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
            "sInfoEmpty": "没有数据",
            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
            "oPaginate": {
              "sFirst": "首页",
              "sPrevious": "前一页",
              "sNext": "后一页",
              "sLast": "尾页",
            },
            "sZeroRecords": "没有检索到数据",
            "sProcessing": "<img src='./loading.gif' />"
          }
        }
    );

</script>
<script src="${staticUrl}ruixuemedia/layer/layer.js"></script>
<script src="${staticUrl}js/app.js"></script>
<script>


</script>
</body>
</html>