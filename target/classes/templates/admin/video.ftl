<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head lang="en">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>瑞雪映画|视频管理</title>

  <link href="/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
  <link href=/"img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
  <link href="/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
  <link href="/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
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

            <h2>视频管理</h2>


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
            <th>封面</th>
            <th>标题</th>
            <th>描述</th>
            <th>发布时间</th>
            <th>类别</th>
            <th>状态</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <#list videos as v>

          <tr>
            <td>${v_index+1}</td>
            <td>
              <a href="${v.coverSrc}" class="img-popup">
                <img style="width: 80px;height: 40px;" src="${v.coverSrc}" alt="瑞雪映画"/>
              </a>
            </td>

            <td>${v.head}</td>
            <td>${v.desc}</td>
<#--            <td>${v.uploadDate?string('yyyy年MM月dd日 HH:mm')}</td>-->
            <td>${v.uploadDate}</td>
            <td>${v.cateName}</td>
          <#--<td><a data-group="1" class="video-popup" href="${v.videoSrc}">播放</a>-->
          <#--|<a href="/">删除</a></td>-->
            <td>
              <#if v.isShow==1>
                正在展示
              <#else>
                未展示
              </#if>
            </td>
            <td style="white-space: nowrap; width: 1%;">
              <div class="tabledit-toolbar btn-toolbar" style="text-align: left;">
                <div class="btn-group btn-group-sm" style="float: none;">
                  <a data-toggle="modal" onclick="preEditModal('${v.id}','${v.head}','${v.desc}','${v.videoType}','${v.coverSrc}','${v.videoSrc}')" data-target="#addVideoModal"
                     class="tabledit-edit-button btn btn-sm btn-default" style="float: none;">
                    <span
                        class="glyphicon glyphicon-pencil"></span>
                  </a>
                  <#if v.isShow==0>
                    <a data-toggle="tooltip" data-placement="top" onclick="displayvideo('${v.id}')"
                       title="展示改视频" class="tabledit-edit-button btn btn-sm btn-default"
                       style="float: none;"><span class="glyphicon glyphicon-eye-open"></span></a>
                  <#else>
                  <a data-toggle="tooltip" data-placement="top" onclick="hiddenVideo('${v.id}')"
                     title="不展示该视频" class="tabledit-edit-button btn btn-sm btn-default"
                     style="float: none;"><span class="glyphicon glyphicon-eye-close"></span></a>
                  </#if>
                    <#if v.isHot==0>
                      <a data-toggle="tooltip" data-placement="top" onclick="pushToIndex('${v.id}')"
                         title="推到首页" class="tabledit-edit-button btn btn-sm btn-default"
                         style="float: none;"><span class="glyphicon glyphicon-thumbs-up
"></span></a>
                    <#else>
                      <a data-toggle="tooltip" data-placement="top" onclick="pullFromIndex('${v.id}')"
                         title="从首页撤回" class="tabledit-edit-button btn btn-sm btn-default"
                         style="float: none;"><span class="glyphicon glyphicon-thumbs-down
"></span></a>
                    </#if>
                  <a data-toggle="tooltip" onclick="deleteVideo('${v.id}')" id="delete-video"
                     data-placement="top" title="删除该视频"
                     class="tabledit-delete-button btn btn-sm btn-default"
                     style="float: none;"><span class="glyphicon glyphicon-trash"></span></a>
                  <a data-toggle="tooltip" data-placement="top" title="播放" href="${v.videoSrc}"
                     class="video-popup tabledit-play-button btn btn-sm btn-default"
                     style="float: none;"><span class="glyphicon glyphicon-play-circle"></span></a>
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
        <h4 class="modal-title" id="myModalLabel">新增视频</h4>
      </div>
      <div class="modal-body">
        <form id="addVideoForm">
          <div class="md-form mb-3">

            <i class="fa fa-bookmark-o prefix grey-text"></i>
            <input name="head" type="text" id="form34" class="form-control validate">
            <label data-error="wrong" data-success="right" for="form34">标题</label>
          </div>

          <div class="md-form mb-3">
            <i class="fa fa-book prefix grey-text"></i>
            <input name="desc" type="text" id="form29" class="form-control validate">
            <label data-error="wrong" data-success="right" for="form29">描述</label>
          </div>

          <div class="md-form mb-3">
            <i class="fa fa-cogs prefix grey-text"></i>
            <select class="form-control" name="videoType" id="">
            <#list videoCategory as vica >
              <option value="${vica.id}">${vica.name}</option>

            </#list>

            </select>
            <label data-error="wrong" data-success="right" for="form32">视频分类</label>
          </div>

          <div class="md-form mb-3">
            <i class="fa fa-photo prefix grey-text"></i>
            <input id="img-uplod-panel-add" class="form-control" accept="image/png,image/jpg,image/jpeg" type="file"
                   >
            <input id="input-cover-add" type="hidden" name="cover">
            <input id="input-video-add" type="hidden" name="video">
            <label id="img-upload-percent-add" data-error="wrong" data-success="right"
                   for="form8">&nbsp;</label>
            <div id="img-upload-percent-add-progress-box" style="display: none;" class="progress-with-amount">
              <div class="progress progress-xs">
                <div id="img-upload-percent-add-progress" class="progress-bar progress-info" role="progressbar" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <div id="img-upload-percent-add-progress-number" class="progress-with-amount-number">0%</div>
            </div>
          </div>
          <div class="md-form mb-3">
            <i class="fa fa-file-video-o prefix grey-text"></i>
            <input  id="video-uplod-panel-add" class="form-control" accept="video/*" type="file">
            <label  id="video-upload-percent-add" data-error="wrong" data-success="right" for="form8">&nbsp;</label>
            <div id="video-upload-percent-add-progress-box" style="display: none;" class="progress-with-amount">
              <div class="progress progress-xs">
                <div id="video-upload-percent-add-progress" class="progress-bar progress-info" role="progressbar" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <div id="video-upload-percent-add-progress-number" class="progress-with-amount-number">0%</div>
            </div>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">取消</button>
        <button id="addVideoBtn" type="button" onclick="addVideo()"
                data-loading-text="<i class='fa fa-spinner fa-spin '></i> 正在上传..."
                class="btn btn-rounded btn-primary">新增视频
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
        <h4 class="modal-title" id="myModalLabel">编辑视频</h4>
      </div>
      <div class="modal-body">
        <form id="editVideoForm">
          <div class="md-form mb-3">
            <input type="text" hidden="hidden" name="id" id="videoId">
            <i class="fa fa-bookmark-o prefix grey-text"></i>
            <input name="head" type="text" id="editHead" class="form-control validate">
            <label data-error="wrong" data-success="right" for="form34">标题</label>
          </div>

          <div class="md-form mb-3">
            <i class="fa fa-book prefix grey-text"></i>
            <input name="desc" type="text" id="editDesc" class="form-control validate">
            <label data-error="wrong" data-success="right" for="form29">描述</label>
          </div>

          <div class="md-form mb-3">
            <i class="fa fa-cogs prefix grey-text"></i>
            <select class="form-control" name="videoType" id="editVideoType">
            <#list videoCategory as vica >
              <option value="${vica.id}">${vica.name}</option>

            </#list>

            </select>
            <label data-error="wrong" data-success="right" for="form32">视频分类</label>
          </div>

          <div class="md-form mb-3">
            <i class="fa fa-photo prefix grey-text"></i>
            <input id="img-uplod-panel-edit" class="form-control" accept="image/png,image/jpg,image/jpeg" type="file"
            >
            <input id="edit-cover" type="hidden" name="cover">
            <input id="edit-video" type="hidden" name="video">
            <label id="img-upload-percent-edit" data-error="wrong" data-success="right"
                   for="form8">&nbsp;</label>
            <div id="img-upload-percent-edit-progress-box" style="display: none;" class="progress-with-amount">
              <div class="progress progress-xs">
                <div id="img-upload-percent-edit-progress" class="progress-bar progress-info" role="progressbar" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <div id="img-upload-percent-edit-progress-number" class="progress-with-amount-number">0%</div>
            </div>
          </div>
          <div class="md-form mb-3">
            <i class="fa fa-file-video-o prefix grey-text"></i>
            <input  id="video-uplod-panel-edit" class="form-control" accept="video/*" type="file">
            <label  id="video-upload-percent-edit" data-error="wrong" data-success="right" for="form8">&nbsp;</label>
            <div id="video-upload-percent-edit-progress-box" style="display: none;" class="progress-with-amount">
              <div class="progress progress-xs">
                <div id="video-upload-percent-edit-progress" class="progress-bar progress-info" role="progressbar" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <div id="video-upload-percent-edit-progress-number" class="progress-with-amount-number">0%</div>
            </div>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">取消</button>
        <button id="editVideoBtn" type="button" onclick="editVideoModal()"
                data-loading-text="<i class='fa fa-spinner fa-spin '></i> 正在上传..."
                class="btn btn-rounded btn-primary">修改视频
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

  // 删除视频
  function deleteVideo(videoId) {
    layer.confirm('确定删除该视频？', {
          btn: ['确定', '取消'] //按钮
        }, function () {
          $.ajax({
                url: "/rx-admin/video/deletevideo",
                type: 'POST',
                data: {"id": videoId.toString()},
                success: function (res) {
                  if (res.status == 200) {
                    layer.msg('已删除', {icon: 1});

                    history.go(0);
                  } else {
                    layer.msg(res.msg, {icon: 2});
                    history.go(0);


                  }
                }
              }
          );
        }
    )
  }

  // 展示视频
  function displayvideo(videoId) {
    layer.confirm('确定展示该视频？', {
          btn: ['确定', '取消'] //按钮
        }, function () {
          $.ajax({
                url: "/rx-admin/video/displayvideo",
                type: 'POST',
                data: {"id": videoId.toString()},
                success: function (res) {
                  if (res.status == 200) {
                    layer.msg('已展示', {icon: 1});

                    history.go(0);
                  } else {
                    layer.msg('展示失败', {icon: 2});
                    history.go(0);

                  }
                },

              }
          );
        }
    )
  }

  // 隐藏视频
  function hiddenVideo(videoId) {
    layer.confirm('确定不展示该视频？', {
          btn: ['确定', '取消'] //按钮
        }, function () {
          $.ajax({
                url: "/rx-admin/video/hiddenvideo",
                type: 'POST',
                data: {"id": videoId.toString()},
                success: function (res) {
                  if (res.status == 200) {
                    layer.msg('已隐藏', {icon: 1});

                    history.go(0);
                  } else {
                    layer.msg(res.msg, {icon: 2});
                    setTimeout(history.go(0)
                        ,2000);

                  }
                }
              }
          );
        }
    )
  }
  // 将视频推送到热门视频
  function pushToIndex(videoId) {
    layer.confirm('确定将该视频推送到首页？', {
          btn: ['确定', '取消'] //按钮
        }, function () {
          $.ajax({
                url: "/rx-admin/video/pushToIndex",
                type: 'POST',
                data: {"id": videoId.toString()},
                success: function (res) {
                  if (res.status == 200) {
                    layer.msg('已推送到首页', {icon: 1});

                    history.go(0);
                  } else {
                    layer.msg('推送到首页失败', {icon: 2});
                    history.go(0);

                  }
                },

              }
          );
        }
    )
  }

  // 从热门撤回
  function pullFromIndex(videoId) {
    layer.confirm('确定将该视频从首页撤回？', {
          btn: ['确定', '取消'] //按钮
        }, function () {
          $.ajax({
                url: "/rx-admin/video/pullFromIndex",
                type: 'POST',
                data: {"id": videoId.toString()},
                success: function (res) {
                  if (res.status == 200) {
                    layer.msg('已从首页撤回', {icon: 1});

                    history.go(0);
                  } else {
                    layer.msg(res.msg, {icon: 2});
                    setTimeout(history.go(0)
                        ,2000);

                  }
                }
              }
          );
        }
    )
  }

  // 新增
  function addVideo() {
    layer.load(1);
    var form = new FormData($("#addVideoForm")[0]);

    $.ajax({
      url: "/rx-admin/video/addvideo",
      type: "POST",
      processData: false,
      contentType: false,
      async: true,
      cache: false,
      data: form,
      success: function (data) {
        layer.msg('新增视频成功', {icon: 1});
        //此处演示关闭
        setTimeout(function () {
          layer.closeAll();
        }, 2000);
        setTimeout(history.go(0), 3000);
      },
      error: function (res) {
        layer.msg(res.msg);
        setTimeout(history.go(0),3000);

      }
    });
  }

  // 编辑视频
  function preEditModal(id,head,desc,videoType,coverSrc,videoSrc) {
    // console.log("videoObj:" + video);

    $("#videoId").val(id);
    $("#editHead").val(head);
    $("#editDesc").val(desc);
    $("#editVideoType").val(videoType);
    $("#edit-cover").val(coverSrc);
    $("#edit-video").val(videoSrc);

  }
  function editVideoModal(){
    layer.load(1);
    var form = new FormData($("#editVideoForm")[0]);

    $.ajax({
      url: "/rx-admin/video/editvideo",
      type: "POST",
      processData: false,
      contentType: false,
      async: true,
      cache: false,
      data: form,
      success: function (data) {
        layer.msg('编辑视频成功', {icon: 1});
        //此处演示关闭
        setTimeout(function () {
          layer.closeAll();
        }, 2000);
        setTimeout(history.go(0), 3000);
      },
      error: function (res) {

        layer.msg(res.msg);
        setTimeout(history.go(0),3000);

      }
    });
  }

  $(function () {
    if ($('.video-popup').length) {
      $('.video-popup').magnificPopup({
        disableOn: 700,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: true,

        fixedContentPos: false
      });
    }
    ;
    if ($('.img-popup').length) {
      var groups = {};
      $('.img-popup').each(function () {
        var id = parseInt($(this).attr('data-group'), 10);

        if (!groups[id]) {
          groups[id] = [];
        }

        groups[id].push(this);
      });

      $.each(groups, function () {

        $(this).magnificPopup({
          type: 'image',
          closeOnContentClick: true,
          closeBtnInside: false,
          gallery: {enabled: true}
        });

      });

    }
    ;

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
  });
  var coverBlob="";
  var videoBlob="";
  // 新增监控输入框图片变化
  $("#img-uplod-panel-add").bind("input propertychange",function(event){

    var token="";
    var fileName = $("#img-uplod-panel-add").val();
    var fileTypeIndex =fileName.lastIndexOf(".");
    var fileType = fileName.substring(fileTypeIndex);
    $("#img-upload-percent-add-progress").attr("style","width:"+"0"+"%");
    $("#img-upload-percent-add-progress-number").html("0%");
    var blobFile = this.files[0];
    var observer =   {
      next:res1 => {
        var percent =res1.total.percent.toFixed(0);
      $("#img-upload-percent-add-progress").attr("style","width:"+percent+"%");
    $("#img-upload-percent-add-progress-number").html(percent+"%");

  },
    error:res2 => {
      console.log(res2);

    },
    complete:res3 => {
      $("#img-upload-percent-add-progress-number").html("上传成功");

      var value=$("#img-upload-percent-add").html(fileName);
      $("#input-cover-add").val(res3.key);
    }
  };
    // 展示进度条
    $("#img-upload-percent-add-progress-box").show();
    uploadToQiNiu(blobFile,fileType,observer);
    $("#img-uplod-panel-add").val('');

  });
  // 新增监控视频输入
  $("#video-uplod-panel-add").bind("input propertychange",function(event){

    var token="";
    var fileName = $("#video-uplod-panel-add").val();
    var fileTypeIndex =fileName.lastIndexOf(".");
    var fileType = fileName.substring(fileTypeIndex);
    $("#video-upload-percent-add-progress").attr("style","width:"+"0"+"%");
    $("#video-upload-percent-add-progress-number").html("0%");
    var blobFile = this.files[0];
    var observer =   {
      next:res1 => {
      var percent =res1.total.percent.toFixed(0);
    $("#video-upload-percent-add-progress").attr("style","width:"+percent+"%");
    $("#video-upload-percent-add-progress-number").html(percent+"%");

  },
    error:res2 => {
      console.log(res2);

    },
    complete:res3 => {
      $("#video-upload-percent-add-progress-number").html("上传成功");

      var value=$("#video-upload-percent-add").html(fileName);
      $("#input-video-add").val(res3.key);
    }
  };
    // 展示进度条
    $("#video-upload-percent-add-progress-box").show();
    uploadToQiNiu(blobFile,fileType,observer);

    // 清空图片输入框值
    $("#video-uplod-panel-add").val('');

  });
  // //////////////////////////////////////////////////////////////////////编辑start
  $("#img-uplod-panel-edit").bind("input propertychange",function(event){

    var token="";
    var fileName = $("#img-uplod-panel-edit").val();
    var fileTypeIndex =fileName.lastIndexOf(".");
    var fileType = fileName.substring(fileTypeIndex);
    $("#img-upload-percent-edit-progress").attr("style","width:"+"0"+"%");
    $("#img-upload-percent-edit-progress-number").html("0%");
    var blobFile = this.files[0];
    var observer =   {
      next:res1 => {
      var percent =res1.total.percent.toFixed(0);
    $("#img-upload-percent-edit-progress").attr("style","width:"+percent+"%");
    $("#img-upload-percent-edit-progress-number").html(percent+"%");

  },
    error:res2 => {
      console.log(res2);

    },
    complete:res3 => {
      $("#img-upload-percent-edit-progress-number").html("上传成功");

      var value=$("#img-upload-percent-edit").html(fileName);
      $("#edit-cover").val(res3.key);
    }
  };
    // 展示进度条
    $("#img-upload-percent-edit-progress-box").show();
    uploadToQiNiu(blobFile,fileType,observer);


    // console.log(objURL);
    // 清空图片输入框值
    $("#img-uplod-panel-edit").val('');

  });
  // 新增监控视频输入
  $("#video-uplod-panel-edit").bind("input propertychange",function(event){

    var token="";
    var fileName = $("#video-uplod-panel-edit").val();
    var fileTypeIndex =fileName.lastIndexOf(".");
    var fileType = fileName.substring(fileTypeIndex);
    $("#video-upload-percent-edit-progress").attr("style","width:"+"0"+"%");
    $("#video-upload-percent-edit-progress-number").html("0%");
    // 如果文件存在则获取上传的token
    var blobFile = this.files[0];
    var observer =   {
      next:res1 => {
      var percent =res1.total.percent.toFixed(0);
    $("#video-upload-percent-edit-progress").attr("style","width:"+percent+"%");
    $("#video-upload-percent-edit-progress-number").html(percent+"%");
  },
    error:res2 => {
      console.log(res2);

    },
    complete:res3 => {
      $("#video-upload-percent-edit-progress-number").html("上传成功");

      var value=$("#video-upload-percent-edit").html(fileName);
      $("#edit-video").val(res3.key);
    }
  };
    // 展示进度条
    $("#video-upload-percent-edit-progress-box").show();
    uploadToQiNiu(blobFile,fileType,observer);


    // console.log(objURL);
    // 清空图片输入框值
    $("#video-uplod-panel-edit").val('');

  });
  // //////////////////////////////////////////////////////////////////////编辑end

  function uploadToQiNiu(blobFile,fileType,observer){
    var timestamp = Date.parse(new Date());
    var subfix =Math.ceil(Math.random()*9999).toString();
    var key = timestamp+subfix+fileType;
    var config = {useCdnDomain: false, region: 'qiniu.region.z0'};
    if (blobFile!=""&&blobFile!=undefined&&blobFile!=null){
      $.ajax({
        url: "/rx-admin/video/getUploadToken",
        type: "GET",
        processData: false,
        contentType: false,
        async: false,
        cache: false,
        success: function (data) {
         var token = data.data;
          var observable = qiniu.upload(blobFile, key, token,config);
          var subscription = observable.subscribe(observer);
        },
        error: function (res) {
          layer.msg("获取上传令牌失败,请刷新重试");

        }
      });
    }else {
      layer.msg("请先选择封面和视频再上传");
    }

  }
</script>
<script src="${staticUrl}ruixuemedia/layer/layer.js"></script>
<script src="${staticUrl}js/app.js"></script>
<script src="${staticUrl}js/qiniu.min.js"></script>
</body>
</html>